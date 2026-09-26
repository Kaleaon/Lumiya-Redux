package com.lumiyaviewer.lumiya.render.glres

import com.lumiyaviewer.lumiya.render.TextureMemoryTracker
import java.lang.ref.PhantomReference
import java.lang.ref.ReferenceQueue
import java.util.Collections
import java.util.IdentityHashMap
import java.util.WeakHashMap

class GLResourceManager {
    private val refQueue = ReferenceQueue<GLGenericResource>()
    private val refSet: MutableSet<GLGenericResourceReference> =
        Collections.synchronizedSet(Collections.newSetFromMap(IdentityHashMap()))
    private val glCleanableLock = Any()
    private val glCleanables: MutableSet<GLCleanable> = Collections.newSetFromMap(WeakHashMap())

    abstract class GLGenericResourceReference(
        glGenericResource: GLGenericResource,
        glResourceManager: GLResourceManager
    ) : PhantomReference<GLGenericResource>(glGenericResource, glResourceManager.refQueue) {
        init {
            glResourceManager.refSet.add(this)
        }

        @Suppress("FunctionName")
        abstract fun GLFree()
    }

    abstract class GLResourceReference(
        glResource: GLResource,
        @JvmField protected val handle: Int,
        glResourceManager: GLResourceManager
    ) : GLGenericResourceReference(glResource, glResourceManager) {
        init {
            glResourceManager.refSet.add(this)
        }
    }

    @Suppress("FunctionName")
    fun Cleanup() {
        synchronized(glCleanableLock) {
            glCleanables.size
        }
        while (true) {
            val polled = refQueue.poll() ?: return
            if (polled is GLGenericResourceReference) {
                polled.GLFree()
                refSet.remove(polled)
            }
        }
    }

    @Suppress("FunctionName")
    fun Flush() {
        synchronized(glCleanableLock) {
            for (glCleanable in glCleanables) {
                glCleanable?.GLCleanup()
            }
            glCleanables.clear()
        }
        @Suppress("ControlFlowWithEmptyBody")
        while (refQueue.poll() != null) {
        }
        refSet.clear()
        TextureMemoryTracker.releaseAllGLMemory()
    }

    fun addCleanable(glCleanable: GLCleanable) {
        synchronized(glCleanableLock) {
            glCleanables.add(glCleanable)
        }
    }
}
