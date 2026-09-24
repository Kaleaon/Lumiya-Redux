package com.lumiyaviewer.lumiya.render.scene

/**
 * Hands scene changes from producer threads to a renderer thread.
 *
 * Bounded by coalescing rather than by dropping: only the newest version of
 * each terrain patch and of the environment is kept, so the queue never holds
 * more than one region's worth of terrain plus one environment, however far
 * the renderer falls behind (the P4-SCENE-01 back-pressure requirement).
 */
class SceneDeltaQueue {
    private val lock = Any()
    private val terrain = LinkedHashMap<Int, SceneDelta.TerrainPatch>()
    private var environment: SceneDelta.Environment? = null

    fun offer(delta: SceneDelta) {
        synchronized(lock) {
            when (delta) {
                is SceneDelta.TerrainPatch -> {
                    terrain.remove(delta.key)
                    terrain[delta.key] = delta
                }
                is SceneDelta.Environment -> environment = delta
            }
        }
    }

    fun offerAll(deltas: Iterable<SceneDelta>) {
        for (delta in deltas) {
            offer(delta)
        }
    }

    /** Everything queued so far, oldest first; the environment comes first. */
    fun drain(): List<SceneDelta> {
        synchronized(lock) {
            val out = ArrayList<SceneDelta>(terrain.size + 1)
            environment?.let { out.add(it) }
            out.addAll(terrain.values)
            environment = null
            terrain.clear()
            return out
        }
    }

    val size: Int
        get() = synchronized(lock) { terrain.size + (if (environment != null) 1 else 0) }
}
