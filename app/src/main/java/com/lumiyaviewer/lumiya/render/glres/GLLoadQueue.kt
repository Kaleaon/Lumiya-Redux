package com.lumiyaviewer.lumiya.render.glres

import com.lumiyaviewer.lumiya.render.RenderContext
import com.lumiyaviewer.lumiya.res.collections.WeakQueue

abstract class GLLoadQueue {
    @JvmField
    val loadQueue: WeakQueue<GLLoadable> = WeakQueue()

    interface GLLoadHandler {
        fun GLResourceLoaded(glLoadable: GLLoadable)
    }

    interface GLLoadable {
        fun GLCompleteLoad()
        fun GLGetLoadSize(): Int
        fun GLLoad(renderContext: RenderContext, glLoadHandler: GLLoadHandler): Int
    }

    abstract fun RunLoadQueue(renderContext: RenderContext)

    open fun StopLoadQueue() {
        loadQueue.clear()
    }

    open fun add(glLoadable: GLLoadable) {
        loadQueue.offer(glLoadable)
    }

    open fun remove(glLoadable: GLLoadable) {
        loadQueue.remove(glLoadable)
    }
}
