package com.lumiyaviewer.lumiya.render.glres.buffers

import android.opengl.GLES30
import com.lumiyaviewer.lumiya.render.glres.GLGenericResource
import com.lumiyaviewer.lumiya.render.glres.GLResourceManager

class GLVertexArrayObject(glResourceManager: GLResourceManager, val size: Int) : GLGenericResource {
    private val vaoIndices: IntArray = IntArray(size)

    private class GLVertexArrayObjectReference(
        glGenericResource: GLGenericResource,
        glResourceManager: GLResourceManager,
        private val vaoIndices: IntArray
    ) : GLResourceManager.GLGenericResourceReference(glGenericResource, glResourceManager) {
        override fun GLFree() {
            GLES30.glDeleteVertexArrays(vaoIndices.size, vaoIndices, 0)
        }
    }

    init {
        GLES30.glGenVertexArrays(size, vaoIndices, 0)
        GLVertexArrayObjectReference(this, glResourceManager, vaoIndices)
    }

    fun Bind(i: Int) {
        GLES30.glBindVertexArray(vaoIndices[i])
    }

    fun Unbind() {
        GLES30.glBindVertexArray(0)
    }
}
