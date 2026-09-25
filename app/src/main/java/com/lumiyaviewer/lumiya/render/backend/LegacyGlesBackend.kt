package com.lumiyaviewer.lumiya.render.backend

import android.opengl.GLES10
import android.opengl.GLES11
import android.opengl.GLES20
import com.lumiyaviewer.lumiya.render.RenderContext
import com.lumiyaviewer.lumiya.render.drawable.DrawableGeometry
import com.lumiyaviewer.lumiya.render.glres.buffers.GLLoadableBuffer

/** OpenGL ES implementation retained while the experimental renderer matures. */
open class LegacyGlesBackend : RenderBackend {
    override fun onContextInitialized(renderContext: RenderContext) = Unit
    override fun beginFrame(renderContext: RenderContext) = Unit
    override fun endFrame(renderContext: RenderContext) = Unit

    override fun useProgram(programHandle: Int) = GLES20.glUseProgram(programHandle)

    override fun bindTexture2D(textureHandle: Int) = GLES20.glBindTexture(GL_TEXTURE_2D, textureHandle)

    override fun unbindTexture2D() = bindTexture2D(0)

    override fun setTextureEnabled(renderContext: RenderContext, enabled: Boolean) {
        if (renderContext.hasGL20) {
            if (!enabled && renderContext.curPrimProgram != null) unbindTexture2D()
            renderContext.curPrimProgram?.setTextureEnabled(enabled)
            return
        }
        if (enabled) {
            GLES10.glEnable(GL_TEXTURE_2D)
            GLES10.glEnableClientState(GL_TEXTURE_COORD_ARRAY)
        } else {
            GLES10.glDisable(GL_TEXTURE_2D)
            GLES10.glDisableClientState(GL_TEXTURE_COORD_ARRAY)
        }
    }

    override fun setMaterialColor(renderContext: RenderContext, rgba: Int, selected: Boolean) {
        val r = if (selected) 1.0f else (255 - (rgba and 255)) / 255.0f
        val g = if (selected) 0.0f else (255 - ((rgba shr 8) and 255)) / 255.0f
        val b = if (selected) 0.0f else (255 - ((rgba shr 16) and 255)) / 255.0f
        val a = if (selected) 0.6f else (255 - ((rgba shr 24) and 255)) / 255.0f
        if (renderContext.hasGL20) {
            setUniform4f(renderContext.curPrimProgram.vColor, r, g, b, a)
        } else {
            GLES10.glColor4f(r, g, b, a)
        }
    }

    override fun setUniform1i(uniformLocation: Int, value: Int) =
        GLES20.glUniform1i(uniformLocation, value)

    override fun setUniform4f(uniformLocation: Int, x: Float, y: Float, z: Float, w: Float) =
        GLES20.glUniform4f(uniformLocation, x, y, z, w)

    override fun setUniformMatrix4fv(uniformLocation: Int, values: FloatArray, offset: Int) =
        GLES20.glUniformMatrix4fv(uniformLocation, 1, false, values, offset)

    override fun submitMeshDraw(
        renderContext: RenderContext,
        drawableGeometry: DrawableGeometry,
        faceIndex: Int,
        legacyFaceBuffer: GLLoadableBuffer?,
        texMatrix: FloatArray,
        texMatrixOffset: Int,
    ) {
        if (renderContext.hasGL20) {
            setUniformMatrix4fv(renderContext.curPrimProgram.uTexMatrix, texMatrix, texMatrixOffset)
            if (faceIndex == -1) drawableGeometry.GLDrawAll20(renderContext)
            else drawableGeometry.GLDrawFace20(renderContext, faceIndex)
            return
        }
        GLES11.glMatrixMode(GL_TEXTURE)
        GLES11.glPushMatrix()
        GLES11.glLoadMatrixf(texMatrix, texMatrixOffset)
        if (faceIndex == -1) drawableGeometry.GLDrawAll10(renderContext)
        else drawableGeometry.GLDrawFace10(renderContext, faceIndex, legacyFaceBuffer)
        GLES11.glPopMatrix()
        GLES11.glMatrixMode(GL_MODELVIEW)
    }

    private companion object {
        const val GL_TEXTURE_2D = 3553
        const val GL_TEXTURE_COORD_ARRAY = 32888
        const val GL_TEXTURE = 5890
        const val GL_MODELVIEW = 5888
    }
}
