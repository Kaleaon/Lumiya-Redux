package com.lumiyaviewer.lumiya.render.avatar

import android.opengl.GLES10
import android.opengl.GLES20
import android.opengl.Matrix
import com.lumiyaviewer.lumiya.render.MatrixStack
import com.lumiyaviewer.lumiya.render.RenderContext
import com.lumiyaviewer.lumiya.render.glres.GLCleanable
import com.lumiyaviewer.lumiya.render.glres.textures.GLLoadedTextTexture
import com.lumiyaviewer.lumiya.render.glres.textures.GLTextTextureCache
import com.lumiyaviewer.lumiya.res.ResourceConsumer
import com.lumiyaviewer.lumiya.res.text.DrawableTextParams

class DrawableHoverText(
    private val textTextureCache: GLTextTextureCache,
    private val hoverText: String,
    private val backgroundColor: Int
) : ResourceConsumer, GLCleanable {

    @Volatile
    private var hoverTextTexture: GLLoadedTextTexture? = null
    private var textureRequested = false

    fun DrawAtWorld(
        renderContext: RenderContext,
        x: Float, y: Float, z: Float, yOffset: Float,
        matrixStack: MatrixStack,
        colorize: Boolean, color: Int
    ) {
        val floats = FloatArray(8)
        val matrixData = renderContext.modelViewMatrix.matrixData
        val matrixDataOffset = renderContext.modelViewMatrix.matrixDataOffset
        val matrixData2 = matrixStack.matrixData
        val matrixDataOffset2 = matrixStack.matrixDataOffset
        floats[0] = x
        floats[1] = y
        floats[2] = z
        floats[3] = 1.0f
        Matrix.multiplyMV(floats, 4, matrixData, matrixDataOffset, floats, 0)
        floats[5] = floats[5] + yOffset
        if (renderContext.hasGL20) {
            System.arraycopy(floats, 4, floats, 0, 4)
        } else {
            Matrix.multiplyMV(floats, 0, matrixData2, matrixDataOffset2, floats, 4)
        }
        if (floats[3] != 0.0f) {
            val screenX = floats[0] / floats[3]
            val screenY = floats[1] / floats[3]
            if (floats[3] != 0.0f) {
                GLDraw(renderContext, screenX, screenY, floats[2] / floats[3], colorize, color)
            }
        }
    }

    override fun GLCleanup() {
        textTextureCache.CancelRequest(this)
        textureRequested = false
        hoverTextTexture = null
    }

    fun GLDraw(renderContext: RenderContext, x: Float, y: Float, z: Float, colorize: Boolean, color: Int) {
        if (!textureRequested) {
            textureRequested = true
            textTextureCache.RequestResource(DrawableTextParams.create(hoverText, backgroundColor), this)
        }
        val texture = hoverTextTexture ?: return
        val width = (texture.width * 2.0f) / renderContext.viewportRect[2]
        val height = (texture.height * 2.0f) / renderContext.viewportRect[3]
        if (renderContext.hasGL20) {
            GLES20.glUniform3f(renderContext.quadProgram!!.uPreTranslate, x, y, z)
            GLES20.glUniform3f(renderContext.quadProgram!!.uScale, width, height, 1.0f)
            GLES20.glUniform3f(renderContext.quadProgram!!.uPostTranslate, 0.0f, texture.baselineOffset, 0.0f)
            texture.GLDraw()
            if (colorize) {
                GLES20.glUniform4f(renderContext.quadProgram!!.uColor,
                    ((color shr 0) and 255) / 255.0f,
                    ((color shr 8) and 255) / 255.0f,
                    ((color shr 16) and 255) / 255.0f,
                    (255 - ((color shr 24) and 255)) / 255.0f)
                GLES20.glUniform1i(renderContext.quadProgram!!.uColorize, 1)
            } else {
                GLES20.glUniform4f(renderContext.quadProgram!!.uColor, 1.0f, 1.0f, 1.0f, 1.0f)
                GLES20.glUniform1i(renderContext.quadProgram!!.uColorize, 0)
            }
        } else {
            GLES10.glLoadIdentity()
            GLES10.glTranslatef(x, y, z)
            GLES10.glScalef(width, height, 1.0f)
            GLES10.glTranslatef(0.0f, texture.baselineOffset, 0.0f)
            if (colorize) {
                GLES10.glColor4f(
                    ((color shr 0) and 255) / 255.0f,
                    ((color shr 8) and 255) / 255.0f,
                    ((color shr 16) and 255) / 255.0f,
                    1.0f - (((color shr 24) and 255) / 255.0f))
            } else {
                GLES10.glColor4f(1.0f, 1.0f, 1.0f, 1.0f)
            }
            texture.GLDraw()
        }
        renderContext.quad.DrawQuad(renderContext)
    }

    override fun OnResourceReady(obj: Any?, z: Boolean) {
        if (obj is GLLoadedTextTexture) {
            hoverTextTexture = obj
        } else if (obj == null) {
            hoverTextTexture = null
        }
    }
}
