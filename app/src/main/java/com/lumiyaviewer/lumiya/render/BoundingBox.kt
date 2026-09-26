package com.lumiyaviewer.lumiya.render

import android.opengl.GLES20
import android.opengl.GLES30
import com.lumiyaviewer.lumiya.render.glres.GLQuery
import com.lumiyaviewer.lumiya.render.glres.buffers.GLLoadableBuffer
import com.lumiyaviewer.lumiya.render.glres.buffers.GLVertexArrayObject
import com.lumiyaviewer.rawbuffers.DirectByteBuffer

class BoundingBox(renderContext: RenderContext) {
    private val vertexArrayObject: GLVertexArrayObject
    private val vertexBuffer: GLLoadableBuffer

    init {
        val directByteBuffer = DirectByteBuffer(cubeVertices.size * 4)
        directByteBuffer.loadFromFloatArray(0, cubeVertices, 0, cubeVertices.size)
        vertexBuffer = GLLoadableBuffer(directByteBuffer)
        vertexArrayObject = GLVertexArrayObject(renderContext.glResourceManager, 1)
        GLES20.glUseProgram(renderContext.boundingBoxProgram.getHandle())
        vertexArrayObject.Bind(0)
        vertexBuffer.Bind20(renderContext, renderContext.boundingBoxProgram.vPosition, 3, GLES20.GL_FLOAT, 12, 0)
        GLES20.glBindBuffer(GLES20.GL_ELEMENT_ARRAY_BUFFER, 0)
        vertexArrayObject.Unbind()
        GLES20.glUseProgram(0)
    }

    fun OcclusionQuery(renderContext: RenderContext, glQuery: GLQuery) {
        renderContext.glObjWorldApplyMatrix(renderContext.boundingBoxProgram.uObjWorldMatrix)
        renderContext.glObjScaleApplyVector(renderContext.boundingBoxProgram.uObjCoordScale)
        vertexArrayObject.Bind(0)
        glQuery.BeginOcclusionQuery(renderContext)
        GLES20.glDrawArrays(GLES20.GL_TRIANGLES, 0, cubeVertices.size / 3)
        glQuery.EndOcclusionQuery()
        vertexArrayObject.Unbind()
    }

    companion object {
        private val cubeVertices = floatArrayOf(
            -0.5f, -0.5f, -0.5f, -0.5f, -0.5f, 0.5f, -0.5f, 0.5f, 0.5f, 0.5f, 0.5f, -0.5f,
            -0.5f, -0.5f, -0.5f, -0.5f, 0.5f, -0.5f, 0.5f, -0.5f, 0.5f, -0.5f, -0.5f, -0.5f,
            0.5f, -0.5f, -0.5f, 0.5f, 0.5f, -0.5f, 0.5f, -0.5f, -0.5f, -0.5f, -0.5f, -0.5f,
            -0.5f, -0.5f, -0.5f, -0.5f, 0.5f, 0.5f, -0.5f, 0.5f, -0.5f, 0.5f, -0.5f, 0.5f,
            -0.5f, -0.5f, 0.5f, -0.5f, -0.5f, -0.5f, 0.5f, 0.5f, -0.5f, -0.5f, 0.5f, 0.5f,
            -0.5f, 0.5f, 0.5f, 0.5f, 0.5f, -0.5f, -0.5f, 0.5f, 0.5f, -0.5f, 0.5f, -0.5f,
            -0.5f, 0.5f, 0.5f, 0.5f, 0.5f, 0.5f, 0.5f, -0.5f, -0.5f, 0.5f, 0.5f, -0.5f,
            0.5f, -0.5f, 0.5f, 0.5f, 0.5f, 0.5f, 0.5f, 0.5f, 0.5f, -0.5f, -0.5f, 0.5f,
            -0.5f, 0.5f, 0.5f, 0.5f, -0.5f, 0.5f, -0.5f, -0.5f, 0.5f, 0.5f, 0.5f, 0.5f,
            0.5f, -0.5f, 0.5f, -0.5f, 0.5f, 0.5f
        )

        @JvmStatic
        fun EndOcclusionQueries(renderContext: RenderContext) {
            GLES20.glUseProgram(0)
            renderContext.curPrimProgram = null
            GLES30.glColorMask(true, true, true, true)
            GLES30.glDepthMask(true)
            GLES30.glDepthFunc(GLES30.GL_LESS)
            GLES30.glEnable(GLES30.GL_DEPTH_TEST)
        }

        @JvmStatic
        fun PrepareOcclusionQueries(renderContext: RenderContext) {
            GLES30.glColorMask(false, false, false, false)
            GLES30.glDepthMask(false)
            GLES30.glDisable(GLES30.GL_DEPTH_TEST)
            GLES30.glDepthFunc(GLES30.GL_LEQUAL)
            GLES20.glUseProgram(renderContext.boundingBoxProgram.getHandle())
            renderContext.glModelApplyMatrix(renderContext.boundingBoxProgram.uMVPMatrix)
        }
    }
}
