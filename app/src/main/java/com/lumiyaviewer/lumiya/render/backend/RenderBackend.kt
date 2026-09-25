package com.lumiyaviewer.lumiya.render.backend

import com.lumiyaviewer.lumiya.render.RenderContext
import com.lumiyaviewer.lumiya.render.drawable.DrawableGeometry
import com.lumiyaviewer.lumiya.render.glres.buffers.GLLoadableBuffer

/** Renderer operations shared by the legacy and experimental implementations. */
interface RenderBackend {
    fun onContextInitialized(renderContext: RenderContext)
    fun beginFrame(renderContext: RenderContext)
    fun endFrame(renderContext: RenderContext)
    fun useProgram(programHandle: Int)
    fun bindTexture2D(textureHandle: Int)
    fun unbindTexture2D()
    fun setTextureEnabled(renderContext: RenderContext, enabled: Boolean)
    fun setMaterialColor(renderContext: RenderContext, rgba: Int, selected: Boolean)
    fun setUniform1i(uniformLocation: Int, value: Int)
    fun setUniform4f(uniformLocation: Int, x: Float, y: Float, z: Float, w: Float)
    fun setUniformMatrix4fv(uniformLocation: Int, values: FloatArray, offset: Int)

    fun submitMeshDraw(
        renderContext: RenderContext,
        drawableGeometry: DrawableGeometry,
        faceIndex: Int,
        legacyFaceBuffer: GLLoadableBuffer?,
        texMatrix: FloatArray,
        texMatrixOffset: Int,
    )
}
