package com.lumiyaviewer.lumiya.render.terrain

import android.opengl.GLES10
import android.opengl.GLES11
import android.opengl.GLES20
import com.lumiyaviewer.lumiya.render.RenderContext
import com.lumiyaviewer.lumiya.render.glres.buffers.GLLoadableBuffer
import com.lumiyaviewer.lumiya.render.glres.textures.GLLoadedTexture
import com.lumiyaviewer.lumiya.slproto.terrain.TerrainPatchHeightMap
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import com.lumiyaviewer.lumiya.utils.IdentityMatrix
import com.lumiyaviewer.rawbuffers.DirectByteBuffer
import kotlin.math.min

class TerrainPatchGeometry(heightMap: TerrainPatchHeightMap) {
    private val indexBuffer: GLLoadableBuffer
    private val vertexBuffer: GLLoadableBuffer
    private val waterIndexBuffer: GLLoadableBuffer
    private val waterVertexBuffer: GLLoadableBuffer
    private var indexCount = 0
    private var waterIndexCount = 0

    init {
        val vertices = DirectByteBuffer(VERTEX_SIZE_BYTES).apply { position(0) }
        val waterVertices = DirectByteBuffer(WATER_VERTEX_SIZE_BYTES).apply { position(0) }
        val indices = DirectByteBuffer(INDEX_SIZE_BYTES).apply { position(0) }
        val waterIndices = DirectByteBuffer(INDEX_SIZE_BYTES).apply { position(0) }
        val normal = LLVector3()
        val waterHeight = heightMap.waterHeight
        val heights = heightMap.heightArray
        val normals = heightMap.normalArray

        var rowOffset = 0
        for (row in 0 until SAMPLES_PER_EDGE) {
            for (column in 0 until SAMPLES_PER_EDGE) {
                val sample = rowOffset + column
                vertices.putFloat(column.toFloat())
                vertices.putFloat(row.toFloat())
                vertices.putFloat(heights[sample])
                normal.set(-normals[sample * 2], normals[sample * 2 + 1], 2.0f)
                normal.normVec()
                vertices.putFloat(normal.x)
                vertices.putFloat(normal.y)
                vertices.putFloat(normal.z)
                vertices.putFloat(column / DRAW_PATCH_SIZE.toFloat())
                vertices.putFloat(row / DRAW_PATCH_SIZE.toFloat())
                waterVertices.putFloat(column.toFloat())
                waterVertices.putFloat(row.toFloat())
                waterVertices.putFloat(waterHeight)
            }
            rowOffset += SAMPLES_PER_EDGE
        }

        var patchRowOffset = 0
        for (row in 0 until DRAW_PATCH_SIZE) {
            for (column in 0 until DRAW_PATCH_SIZE) {
                val topLeft = patchRowOffset + column
                val topRight = topLeft + 1
                val bottomLeft = topLeft + SAMPLES_PER_EDGE
                val bottomRight = bottomLeft + 1
                putQuad(indices, topLeft, topRight, bottomLeft, bottomRight)
                indexCount += INDICES_PER_QUAD
                val minimumHeight = min(
                    min(vertices.getFloat(topLeft * FLOATS_PER_VERTEX + 2), vertices.getFloat(topRight * FLOATS_PER_VERTEX + 2)),
                    min(vertices.getFloat(bottomLeft * FLOATS_PER_VERTEX + 2), vertices.getFloat(bottomRight * FLOATS_PER_VERTEX + 2)),
                )
                if (minimumHeight <= waterHeight) {
                    putQuad(waterIndices, topLeft, topRight, bottomLeft, bottomRight)
                    waterIndexCount += INDICES_PER_QUAD
                }
            }
            patchRowOffset += SAMPLES_PER_EDGE
        }
        vertexBuffer = GLLoadableBuffer(vertices)
        indexBuffer = GLLoadableBuffer(indices)
        waterVertexBuffer = GLLoadableBuffer(waterVertices)
        waterIndexBuffer = GLLoadableBuffer(waterIndices)
    }

    fun GLDraw(renderContext: RenderContext, objectWorldMatrix: FloatArray, texture: GLLoadedTexture?) {
        if (indexCount == 0) return
        if (!renderContext.hasGL20) renderContext.glObjWorldPushAndMultMatrixf(objectWorldMatrix, 0)
        if (renderContext.hasGL20) drawTerrain20(renderContext, objectWorldMatrix, texture)
        else drawTerrain10(renderContext, texture)
        if (waterIndexCount != 0) {
            if (renderContext.hasGL20) drawWater20(renderContext, objectWorldMatrix)
            else drawWater10(renderContext)
        }
        if (!renderContext.hasGL20) renderContext.glObjWorldPopMatrix()
    }

    private fun drawTerrain20(context: RenderContext, matrix: FloatArray, texture: GLLoadedTexture?) {
        GLES20.glUseProgram(context.primProgram.handle)
        vertexBuffer.Bind20(context, context.primProgram.vPosition, 3, GLES20.GL_FLOAT, FLOATS_PER_VERTEX * 4, 0)
        vertexBuffer.Bind20(context, context.primProgram.vNormal, 3, GLES20.GL_FLOAT, FLOATS_PER_VERTEX * 4, 12)
        GLES20.glUniformMatrix4fv(context.primProgram.uObjWorldMatrix, 1, false, matrix, 0)
        if (texture != null) {
            texture.GLDraw()
            vertexBuffer.Bind20(context, context.primProgram.vTexCoord, 2, GLES20.GL_FLOAT, FLOATS_PER_VERTEX * 4, 24)
            GLES20.glUniform4f(context.primProgram.vColor, 1f, 1f, 1f, 1f)
            context.primProgram.setTextureEnabled(true)
        } else {
            GLES20.glBindTexture(GLES20.GL_TEXTURE_2D, 0)
            GLES20.glDisableVertexAttribArray(context.primProgram.vTexCoord)
            GLES20.glUniform4f(context.primProgram.vColor, 0.1f, 0.5f, 0.1f, 1f)
            context.primProgram.setTextureEnabled(false)
        }
        GLES20.glUniform1i(context.primProgram.sTexture, 0)
        indexBuffer.BindElements20(context)
        indexBuffer.DrawElements20(GLES20.GL_TRIANGLES, indexCount, GLES20.GL_UNSIGNED_SHORT, 0)
    }

    private fun drawTerrain10(context: RenderContext, texture: GLLoadedTexture?) {
        GLES10.glDisableClientState(GLES10.GL_NORMAL_ARRAY)
        if (texture != null) {
            GLES10.glEnable(GLES10.GL_TEXTURE_2D)
            texture.GLDraw()
            GLES10.glColor4f(1f, 1f, 1f, 1f)
            vertexBuffer.Bind(context, GLES10.GL_TEXTURE_COORD_ARRAY, 2, GLES10.GL_FLOAT, FLOATS_PER_VERTEX * 4, 24)
        } else {
            GLES10.glDisableClientState(GLES10.GL_TEXTURE_COORD_ARRAY)
            GLES10.glDisable(GLES10.GL_TEXTURE_2D)
            GLES10.glColor4f(0.1f, 0.5f, 0.1f, 1f)
        }
        vertexBuffer.Bind(context, GLES10.GL_VERTEX_ARRAY, 3, GLES10.GL_FLOAT, FLOATS_PER_VERTEX * 4, 0)
        indexBuffer.BindElements(context)
        indexBuffer.DrawElements(context, GLES10.GL_TRIANGLES, indexCount, GLES10.GL_UNSIGNED_SHORT, 0)
    }

    private fun drawWater20(context: RenderContext, matrix: FloatArray) {
        GLES20.glDisable(GLES20.GL_CULL_FACE)
        GLES20.glUseProgram(context.waterProgram.handle)
        GLES20.glUniformMatrix4fv(context.waterProgram.uObjWorldMatrix, 1, false, matrix, 0)
        waterVertexBuffer.Bind20(context, context.waterProgram.vPosition, 3, GLES20.GL_FLOAT, 0, 0)
        waterIndexBuffer.BindElements20(context)
        waterIndexBuffer.DrawElements20(GLES20.GL_TRIANGLES, waterIndexCount, GLES20.GL_UNSIGNED_SHORT, 0)
        GLES20.glEnable(GLES20.GL_CULL_FACE)
    }

    private fun drawWater10(context: RenderContext) {
        GLES10.glDisable(GLES10.GL_CULL_FACE)
        GLES10.glDisableClientState(GLES10.GL_TEXTURE_COORD_ARRAY)
        GLES10.glDisable(GLES10.GL_TEXTURE_2D)
        GLES10.glColor4f(0.4f, 0.4f, 0.6f, 1f)
        waterVertexBuffer.Bind(context, GLES10.GL_VERTEX_ARRAY, 3, GLES10.GL_FLOAT, 0, 0)
        waterIndexBuffer.BindElements(context)
        waterIndexBuffer.DrawElements(context, GLES10.GL_TRIANGLES, waterIndexCount, GLES10.GL_UNSIGNED_SHORT, 0)
        GLES10.glEnable(GLES10.GL_CULL_FACE)
    }

    companion object {
        const val DrawPatchSize = 16
        private const val DRAW_PATCH_SIZE = DrawPatchSize
        private const val SAMPLES_PER_EDGE = DRAW_PATCH_SIZE + 1
        private const val FLOATS_PER_VERTEX = 8
        private const val INDICES_PER_QUAD = 6
        private const val INDEX_SIZE_BYTES = 3072
        private const val VERTEX_SIZE_BYTES = 9248
        private const val WATER_VERTEX_SIZE_BYTES = 3468
        private val waterFrequency = floatArrayOf(17.951958f, 12.566371f, 8.975979f, 15.707963f)
        private val waterPhase = floatArrayOf(1.73f, 0.64f, 1.27f, 0.9f)
        private val waterAmplitude = floatArrayOf(0.5f, 0.5f, 0.3f, 0.4f)
        private val waterDirection = floatArrayOf(1f, 0.3f, 0.4f, 0.75f, -0.5f, 0.7f, 0.63f, -0.3f)

        private fun putQuad(buffer: DirectByteBuffer, topLeft: Int, topRight: Int, bottomLeft: Int, bottomRight: Int) {
            buffer.putShort(topLeft.toShort())
            buffer.putShort(topRight.toShort())
            buffer.putShort(bottomLeft.toShort())
            buffer.putShort(topRight.toShort())
            buffer.putShort(bottomRight.toShort())
            buffer.putShort(bottomLeft.toShort())
        }

        @JvmStatic
        fun GLPrepare(context: RenderContext) {
            if (!context.hasGL20) {
                GLES11.glMatrixMode(GLES11.GL_TEXTURE)
                GLES11.glLoadMatrixf(IdentityMatrix.getMatrix(), 0)
                GLES11.glMatrixMode(GLES11.GL_MODELVIEW)
                return
            }
            GLES20.glUseProgram(context.primProgram.handle)
            context.glModelApplyMatrix(context.primProgram.uMVPMatrix)
            context.primProgram.SetupLighting(context, context.windlightPreset)
            GLES20.glUniform4f(context.primProgram.uObjCoordScale, 1f, 1f, 1f, 1f)
            GLES20.glUniformMatrix4fv(context.primProgram.uTexMatrix, 1, false, IdentityMatrix.getMatrix(), 0)
            GLES20.glUseProgram(context.waterProgram.handle)
            GLES20.glUniform4f(context.waterProgram.vColor, 0.4f, 0.4f, 0.6f, 1f)
            context.glModelApplyMatrix(context.waterProgram.uMVPMatrix)
            GLES20.glUniform1f(context.waterProgram.uTime, context.waterTime)
            GLES20.glUniform1fv(context.waterProgram.uFrequency, 4, waterFrequency, 0)
            GLES20.glUniform1fv(context.waterProgram.uPhase, 4, waterPhase, 0)
            GLES20.glUniform1fv(context.waterProgram.uAmplitude, 4, waterAmplitude, 0)
            GLES20.glUniform2fv(context.waterProgram.uDirection, 4, waterDirection, 0)
        }
    }
}
