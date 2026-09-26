package com.lumiyaviewer.lumiya.render.spatial

import com.lumiyaviewer.lumiya.render.DrawableStore
import com.lumiyaviewer.lumiya.render.avatar.DrawableAvatar
import com.lumiyaviewer.lumiya.res.collections.WeakQueue
import com.lumiyaviewer.lumiya.res.executors.PrimComputeExecutor
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectInfo
import com.lumiyaviewer.lumiya.slproto.terrain.TerrainData
import java.lang.reflect.Array as JArray
import java.util.Collections
import java.util.HashMap
import java.util.IdentityHashMap
import java.util.concurrent.atomic.AtomicBoolean

class SpatialObjectIndex(
    private val drawableStore: DrawableStore,
    avatarCountLimit: Int
) {
    @Volatile
    private var avatarCountLimit: Int = avatarCountLimit

    @Volatile
    private var objectsInFrustrum: DrawList

    private val frustrumChanged = AtomicBoolean(false)
    private val drawListUpdateRequested = AtomicBoolean(false)
    private val objectUpdateRemoveLock = Any()
    private val objectsToUpdate: MutableSet<DrawListObjectEntry> = Collections.newSetFromMap(IdentityHashMap())
    private val objectsToRemove: MutableSet<DrawListObjectEntry> = Collections.newSetFromMap(IdentityHashMap())

    @Volatile
    private var initialUpdateCompleted = false

    @Volatile
    private var indexDisabled = false

    private val terrainLock = Any()

    @Suppress("UNCHECKED_CAST")
    private val terrain: Array<Array<DrawListTerrainEntry?>> =
        JArray.newInstance(DrawListTerrainEntry::class.java, 16, 16) as Array<Array<DrawListTerrainEntry?>>

    private val terrainDirty: MutableMap<Int, TerrainData> = HashMap()
    private val lock = Any()

    @Volatile
    private var frustrumInfo: FrustrumInfo? = null

    @Volatile
    private var frustrumPlanes: FrustrumPlanes? = null

    private val drawListUpdateTask = DrawListUpdateTask()
    private val objectsUpdateTask = ObjectsUpdateTask()

    private val terrainUpdate = Runnable {
        var z3 = false
        while (initialUpdateCompleted && !indexDisabled) {
            val terrainData: TerrainData?
            val intValue2: Int
            val z: Boolean
            synchronized(terrainLock) {
                val it = terrainDirty.entries.iterator()
                if (it.hasNext()) {
                    val entry = it.next()
                    intValue2 = entry.key
                    terrainData = entry.value
                    it.remove()
                    z = true
                } else {
                    terrainData = null
                    intValue2 = -1
                    z = false
                }
            }
            if (!z) {
                break
            }
            if (intValue2 < 0 || terrainData == null) {
                // skip
            } else {
                val i2 = intValue2 % 16
                val i3 = intValue2 / 16
                val patchInfo = terrainData.getPatchInfo(i2, i3)
                if (patchInfo != null) {
                    val drawListTerrainEntry2: DrawListTerrainEntry
                    synchronized(terrainLock) {
                        drawListTerrainEntry2 = terrain[i2][i3] ?: DrawListTerrainEntry(patchInfo, i2, i3).also {
                            terrain[i2][i3] = it
                        }
                        if (terrain[i2][i3] !== drawListTerrainEntry2) {
                            // was just created
                        } else {
                            drawListTerrainEntry2.updatePatchInfo(patchInfo)
                        }
                    }
                    spatialTree.updateObject(drawListTerrainEntry2)
                } else {
                    val drawListTerrainEntry: DrawListTerrainEntry?
                    synchronized(terrainLock) {
                        drawListTerrainEntry = terrain[i2][i3]
                        terrain[i2][i3] = null
                    }
                    if (drawListTerrainEntry != null) {
                        spatialTree.removeObject(drawListTerrainEntry)
                    }
                }
                z3 = true
            }
        }
        if (z3) {
            drawListUpdateRequested.set(true)
        }
    }

    private val spatialTree = SpatialTree(NUM_DEPTH_BINS, REGION_SIZE_XY, REGION_SIZE_XY, REGION_SIZE_Z, this)

    init {
        this.avatarCountLimit = avatarCountLimit
        objectsInFrustrum = DrawList.create(drawableStore, null, avatarCountLimit)
    }

    private inner class DrawListUpdateTask : Runnable, WeakQueue.LowPriority {
        override fun run() {
            if (initialUpdateCompleted && !indexDisabled) {
                if (frustrumChanged.getAndSet(false) || spatialTree.isTreeWalkNeeded()) {
                    val fp = frustrumPlanes
                    val fi = frustrumInfo
                    if (fp != null && fi != null) {
                        spatialTree.walkTree(fp, fi.viewDistance)
                    }
                }
                if (spatialTree.isDrawListChanged()) {
                    objectsInFrustrum = getObjectsInCells(avatarCountLimit)
                }
            }
        }
    }

    private inner class ObjectsUpdateTask : Runnable {
        override fun run() {
            if (initialUpdateCompleted && !indexDisabled) {
                val drawListObjectEntryArr: Array<DrawListObjectEntry>
                val drawListObjectEntries: Array<DrawListObjectEntry>
                synchronized(objectUpdateRemoveLock) {
                    drawListObjectEntryArr = objectsToUpdate.toTypedArray()
                    drawListObjectEntries = objectsToRemove.toTypedArray()
                    objectsToUpdate.clear()
                    objectsToRemove.clear()
                }
                var z = false
                for (drawListObjectEntry in drawListObjectEntryArr) {
                    z = z or if (!drawListObjectEntry.objectInfo.isDead) handleUpdateObject(drawListObjectEntry) else handleRemoveObject(drawListObjectEntry)
                }
                for (drawListObjectEntry2 in drawListObjectEntries) {
                    z = z or handleRemoveObject(drawListObjectEntry2)
                }
                if (z || spatialTree.isDrawListChanged() || spatialTree.isTreeWalkNeeded()) {
                    drawListUpdateRequested.set(true)
                }
            }
        }
    }

    fun getObjectsInCells(i: Int): DrawList {
        val create = DrawList.create(drawableStore, objectsInFrustrum, i)
        spatialTree.addDrawables(create)
        create.initRenderPasses()
        return create
    }

    fun handleRemoveObject(drawListObjectEntry: DrawListObjectEntry): Boolean {
        spatialTree.removeObject(drawListObjectEntry)
        drawListObjectEntry.objectInfo.clearDrawListEntry()
        return false
    }

    fun handleUpdateObject(drawListObjectEntry: DrawListObjectEntry): Boolean {
        drawListObjectEntry.updateBoundingBox()
        spatialTree.updateObject(drawListObjectEntry)
        return false
    }

    private fun removeObject(drawListObjectEntry: DrawListObjectEntry) {
        val remove: Boolean
        synchronized(objectUpdateRemoveLock) {
            remove = objectsToUpdate.remove(drawListObjectEntry) or objectsToRemove.add(drawListObjectEntry)
        }
        if (remove && initialUpdateCompleted && !indexDisabled) {
            PrimComputeExecutor.getInstance().execute(objectsUpdateTask)
        }
    }

    fun completeInitialUpdate() {
        initialUpdateCompleted = true
        if (indexDisabled) {
            return
        }
        PrimComputeExecutor.getInstance().execute(objectsUpdateTask)
        PrimComputeExecutor.getInstance().execute(terrainUpdate)
        drawListUpdateRequested.set(true)
    }

    fun disableIndex() {
        indexDisabled = true
    }

    fun getDrawableAvatar(objectInfo: SLObjectInfo): DrawableAvatar {
        return drawableStore.drawableAvatarCache.getIfPresent(objectInfo)
    }

    fun getObjectsInFrustrum(): DrawList = objectsInFrustrum

    fun requestEntryRemoval(drawListEntry: DrawListEntry) {
        if (drawListEntry is DrawListObjectEntry) {
            removeObject(drawListEntry)
        }
    }

    fun setAvatarCountLimit(avatarCountLimit: Int) {
        this.avatarCountLimit = avatarCountLimit
    }

    fun setViewport(frustrumInfo: FrustrumInfo, frustrumPlanes: FrustrumPlanes) {
        var z = true
        synchronized(lock) {
            if (this.frustrumInfo == null) {
                this.frustrumInfo = frustrumInfo
            } else if (this.frustrumInfo == frustrumInfo) {
                z = false
            } else {
                this.frustrumInfo = frustrumInfo
            }
            if (z) {
                this.frustrumPlanes = frustrumPlanes
                frustrumChanged.set(true)
                if (initialUpdateCompleted && !indexDisabled) {
                    drawListUpdateRequested.set(true)
                }
            }
        }
    }

    fun updateDrawListIfNeeded(): Boolean {
        if (!drawListUpdateRequested.getAndSet(false)) {
            return false
        }
        PrimComputeExecutor.getInstance().execute(drawListUpdateTask)
        return true
    }

    fun updateObject(drawListObjectEntry: DrawListObjectEntry) {
        val add: Boolean
        synchronized(objectUpdateRemoveLock) {
            add = if (!drawListObjectEntry.objectInfo.isDead) objectsToUpdate.add(drawListObjectEntry) else objectsToRemove.add(drawListObjectEntry)
        }
        if (add && initialUpdateCompleted && !indexDisabled) {
            PrimComputeExecutor.getInstance().execute(objectsUpdateTask)
        }
    }

    fun updateTerrainPatch(i: Int, i2: Int, terrainData: TerrainData) {
        synchronized(terrainLock) {
            terrainDirty[i2 * 16 + i] = terrainData
        }
        if (initialUpdateCompleted && !indexDisabled) {
            PrimComputeExecutor.getInstance().execute(terrainUpdate)
        }
    }

    companion object {
        private const val NUM_DEPTH_BINS = 16
        private const val REGION_SIZE_XY = 256.0f
        private const val REGION_SIZE_Z = 4096.0f
    }
}
