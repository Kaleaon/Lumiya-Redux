package com.lumiyaviewer.lumiya.render.glres.textures

import android.graphics.Bitmap
import com.lumiyaviewer.lumiya.render.RenderContext

open class GLLoadedTextTexture(context: RenderContext, bitmap: Bitmap, @JvmField val baselineOffset: Float) :
    GLLoadedTexture(context, bitmap)
