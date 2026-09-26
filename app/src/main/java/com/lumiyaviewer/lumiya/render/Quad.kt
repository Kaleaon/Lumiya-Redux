package com.lumiyaviewer.lumiya.render

import android.opengl.GLES10
import android.opengl.GLES20
import com.lumiyaviewer.lumiya.render.glres.buffers.GLLoadableBuffer
import com.lumiyaviewer.rawbuffers.DirectByteBuffer

class Quad {
    private val indexBuffer: GLLoadableBuffer
    private val vertexBuffer: GLLoadableBuffer

    init {
        val vertexBytes = DirectByteBuffer(squareCoords.size * 4)
        val floatBuffer = vertexBytes.asFloatBuffer()
        floatBuffer.put(squareCoords)
        floatBuffer.position(0)
        val indexBytes = DirectByteBuffer(drawOrder.size * 2)
        val shortBuffer = indexBytes.asShortBuffer()
        shortBuffer.put(drawOrder)
        shortBuffer.position(0)
        vertexBuffer = GLLoadableBuffer(vertexBytes)
        indexBuffer = GLLoadableBuffer(indexBytes)
    }

    fun DrawQuad(renderContext: RenderContext) {
        if (renderContext.hasGL20) {
            indexBuffer.DrawElements20(GLES20.GL_TRIANGLES, drawOrder.size, GLES20.GL_UNSIGNED_SHORT, 0)
        } else {
            indexBuffer.DrawElements(renderContext, GLES10.GL_TRIANGLES, drawOrder.size, GLES10.GL_UNSIGNED_SHORT, 0)
        }
    }

    fun DrawSingleQuadShader(renderContext: RenderContext, vPosition: Int, vTexCoord: Int) {
        if (renderContext.hasGL20) {
            vertexBuffer.Bind20(renderContext, vPosition, 3, GLES20.GL_FLOAT, 20, 0)
            vertexBuffer.Bind20(renderContext, vTexCoord, 2, GLES20.GL_FLOAT, 20, 12)
            indexBuffer.DrawElements20(GLES20.GL_TRIANGLES, drawOrder.size, GLES20.GL_UNSIGNED_SHORT, 0)
        }
    }

    fun EndDrawQuads(renderContext: RenderContext) {
    }

    fun PrepareDrawQuads(renderContext: RenderContext) {
        if (renderContext.hasGL20) {
            GLES20.glUseProgram(renderContext.quadProgram.getHandle())
            vertexBuffer.Bind20(renderContext, renderContext.quadProgram.vPosition, 3, GLES20.GL_FLOAT, 20, 0)
            vertexBuffer.Bind20(renderContext, renderContext.quadProgram.vTexCoord, 2, GLES20.GL_FLOAT, 20, 12)
            GLES20.glUniform1i(renderContext.quadProgram.sTexture, 0)
            indexBuffer.BindElements20(renderContext)
            return
        }
        GLES10.glEnable(GLES10.GL_TEXTURE_2D)
        GLES10.glColor4f(1.0f, 1.0f, 1.0f, 1.0f)
        vertexBuffer.Bind(renderContext, GLES10.GL_VERTEX_ARRAY, 3, GLES10.GL_FLOAT, 20, 0)
        vertexBuffer.Bind(renderContext, GLES10.GL_TEXTURE_COORD_ARRAY, 2, GLES10.GL_FLOAT, 20, 12)
        GLES10.glEnableClientState(GLES10.GL_TEXTURE_COORD_ARRAY)
        GLES10.glTexParameterf(GLES10.GL_TEXTURE_2D, GLES10.GL_TEXTURE_MIN_FILTER, GLES10.GL_NEAREST.toFloat())
        GLES10.glTexParameterf(GLES10.GL_TEXTURE_2D, GLES10.GL_TEXTURE_MAG_FILTER, GLES10.GL_NEAREST.toFloat())
        GLES10.glTexParameterf(GLES10.GL_TEXTURE_2D, GLES10.GL_TEXTURE_WRAP_S, GLES10.GL_REPEAT.toFloat())
        GLES10.glTexParameterf(GLES10.GL_TEXTURE_2D, GLES10.GL_TEXTURE_WRAP_T, GLES10.GL_REPEAT.toFloat())
        indexBuffer.BindElements(renderContext)
    }

    companion object {
        private val squareCoords = floatArrayOf(
            -0.5f, 0.5f, 0.0f, 0.0f, 0.0f,
            -0.5f, -0.5f, 0.0f, 0.0f, 1.0f,
            0.5f, -0.5f, 0.0f, 1.0f, 1.0f,
            0.5f, 0.5f, 0.0f, 1.0f, 0.0f
        )
        private val drawOrder = shortArrayOf(0, 1, 2, 0, 2, 3)
    }
}
