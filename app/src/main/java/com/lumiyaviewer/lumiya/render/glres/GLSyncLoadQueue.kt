package com.lumiyaviewer.lumiya.render.glres

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.render.RenderContext
import com.lumiyaviewer.lumiya.render.TextureMemoryTracker

class GLSyncLoadQueue : GLLoadQueue(), GLLoadQueue.GLLoadHandler {
    private var framesWait = 0

    override fun GLResourceLoaded(glLoadable: GLLoadQueue.GLLoadable) {
        glLoadable.GLCompleteLoad()
    }

    override fun RunLoadQueue(renderContext: RenderContext) {
        if (framesWait != 0) {
            framesWait--
            return
        }
        var loadedSize = 0
        var loadedCount = 0
        while (true) {
            if (!TextureMemoryTracker.canAllocateMemory(0)) {
                break
            }
            val removed = loadQueue.poll() ?: break
            if (!TextureMemoryTracker.canAllocateMemory(removed.GLGetLoadSize())) {
                TextureMemoryTracker.stall()
                loadQueue.add(removed)
                break
            }
            val newLoadedSize = removed.GLLoad(renderContext, this) + loadedSize
            framesWait = WAIT_FRAMES_AFTER_LOAD
            val newLoadedCount = loadedCount + 1
            if (newLoadedCount >= MAX_LOADS_PER_FRAME || newLoadedSize >= MAX_SIZE_PER_FRAME) {
                break
            }
            loadedCount = newLoadedCount
            loadedSize = newLoadedSize
        }
        if (loadedCount != 0) {
            Debug.Printf("waitForMemory: loadedCount %d, size %d", loadedCount, loadedSize)
        }
    }

    companion object {
        private const val MAX_LOADS_PER_FRAME = 16
        private const val MAX_SIZE_PER_FRAME = 4194304
        private const val WAIT_FRAMES_AFTER_LOAD = 3
    }
}
