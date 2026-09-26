package com.lumiyaviewer.lumiya.render.glres.textures

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.opengl.GLES10
import android.opengl.GLES20
import android.opengl.GLUtils
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.openjpeg.OpenJPEG
import com.lumiyaviewer.lumiya.render.RenderContext
import java.io.IOException
import javax.annotation.Nullable

class GLLoadedTexture : GLResourceTexture {

    val hasAlphaLayer: Boolean
    val height: Int
    val width: Int

    constructor(renderContext: RenderContext, bitmap: Bitmap) : super(renderContext.glResourceManager, bitmap.height * bitmap.rowBytes) {
        if (renderContext.hasGL20) {
            GLES20.glBindTexture(3553, handle)
        } else {
            GLES10.glBindTexture(3553, handle)
        }
        hasAlphaLayer = bitmap.hasAlpha()
        width = bitmap.width
        height = bitmap.height
        renderContext.KeepTexture(bitmap)
        GLUtils.texImage2D(3553, 0, bitmap, 0)
        if (renderContext.hasGL20) {
            GLES20.glTexParameteri(3553, 10240, 9729)
            GLES20.glTexParameteri(3553, 10241, 9729)
            GLES20.glTexParameteri(3553, 10242, 10497)
            GLES20.glTexParameteri(3553, 10243, 10497)
        } else {
            GLES10.glTexParameterf(3553, 10240, 9728.0f)
            GLES10.glTexParameterf(3553, 10241, 9728.0f)
            GLES10.glTexParameterf(3553, 10242, 10497.0f)
            GLES10.glTexParameterf(3553, 10243, 10497.0f)
        }
        if (renderContext.hasGL20) {
            GLES20.glBindTexture(3553, 0)
        } else {
            GLES10.glBindTexture(3553, 0)
        }
    }

    constructor(renderContext: RenderContext, openJPEG: OpenJPEG) : super(renderContext.glResourceManager, openJPEG.loadedSize) {
        if (renderContext.hasGL20) {
            GLES20.glBindTexture(3553, handle)
        } else {
            GLES10.glBindTexture(3553, handle)
        }
        hasAlphaLayer = openJPEG.hasAlphaLayer()
        width = openJPEG.width
        height = openJPEG.height
        renderContext.KeepTexture(openJPEG)
        if (renderContext.hasGL30) {
            openJPEG.SetAsImmutableTexture()
        } else {
            openJPEG.SetAsTexture()
        }
        if (renderContext.hasGL20) {
            GLES20.glTexParameteri(3553, 10240, 9729)
            GLES20.glTexParameteri(3553, 10241, 9729)
            GLES20.glTexParameteri(3553, 10242, 10497)
            GLES20.glTexParameteri(3553, 10243, 10497)
        } else {
            GLES10.glTexParameterf(3553, 10240, 9728.0f)
            GLES10.glTexParameterf(3553, 10241, 9728.0f)
            GLES10.glTexParameterf(3553, 10242, 10497.0f)
            GLES10.glTexParameterf(3553, 10243, 10497.0f)
        }
        if (renderContext.hasGL20) {
            GLES20.glBindTexture(3553, 0)
        } else {
            GLES10.glBindTexture(3553, 0)
        }
    }

    fun GLDraw() {
        GLES10.glBindTexture(3553, handle)
    }

    companion object {
        @JvmStatic
        @Nullable
        fun loadFromAssets(renderContext: RenderContext, context: Context, assetName: String): GLLoadedTexture? {
            return try {
                val stream = context.assets.open(assetName)
                val decodeStream = BitmapFactory.decodeStream(stream)
                stream.close()
                if (decodeStream != null) GLLoadedTexture(renderContext, decodeStream) else null
            } catch (e: IOException) {
                Debug.Warning(e)
                null
            }
        }
    }
}
