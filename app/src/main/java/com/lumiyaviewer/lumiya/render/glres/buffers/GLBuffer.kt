package com.lumiyaviewer.lumiya.render.glres.buffers

import android.opengl.GLES11
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.render.TextureMemoryTracker
import com.lumiyaviewer.lumiya.render.glres.GLResource
import com.lumiyaviewer.lumiya.render.glres.GLResourceManager
import com.lumiyaviewer.rawbuffers.DirectByteBuffer

open class GLBuffer(glResourceManager: GLResourceManager, private val rawBuffer: DirectByteBuffer?) :
    GLResource(glResourceManager) {

    private class GLResourceBufferReference(
        glResource: GLResource,
        handle: Int,
        glResourceManager: GLResourceManager,
        private val rawBuffer: DirectByteBuffer?
    ) : GLResourceManager.GLResourceReference(glResource, handle, glResourceManager) {
        override fun GLFree() {
            val ints = idBuffer.get()!!
            ints[0] = handle
            Debug.Printf("GLBuffer: deleted buffer %d", ints[0])
            GLES11.glDeleteBuffers(1, ints, 0)
            if (rawBuffer != null) {
                TextureMemoryTracker.releaseBufferMemory(rawBuffer.capacity)
            }
        }
    }

    init {
        if (rawBuffer != null) {
            TextureMemoryTracker.allocBufferMemory(rawBuffer.capacity)
        }
        GLResourceBufferReference(this, handle, glResourceManager, rawBuffer)
    }

    override fun Allocate(manager: GLResourceManager): Int {
        val ints = idBuffer.get()!!
        GLES11.glGenBuffers(1, ints, 0)
        Debug.Printf("GLBuffer: allocated buffer %d", ints[0])
        return ints[0]
    }

    companion object {
        private val idBuffer = object : ThreadLocal<IntArray>() {
            override fun initialValue(): IntArray = IntArray(1)
        }
    }
}
