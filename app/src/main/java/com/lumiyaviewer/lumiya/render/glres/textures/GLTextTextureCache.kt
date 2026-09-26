package com.lumiyaviewer.lumiya.render.glres.textures

import com.lumiyaviewer.lumiya.render.RenderContext
import com.lumiyaviewer.lumiya.render.glres.GLLoadQueue
import com.lumiyaviewer.lumiya.render.glres.GLResourceCache
import com.lumiyaviewer.lumiya.res.ResourceConsumer
import com.lumiyaviewer.lumiya.res.text.DrawableTextBitmap
import com.lumiyaviewer.lumiya.res.text.DrawableTextCache
import com.lumiyaviewer.lumiya.res.text.DrawableTextParams

class GLTextTextureCache(
    glLoadQueue: GLLoadQueue,
    private val drawableTextCache: DrawableTextCache
) : GLResourceCache<DrawableTextParams, DrawableTextBitmap, GLLoadedTextTexture>(glLoadQueue) {

    override fun CancelRawResource(resourceConsumer: ResourceConsumer) {
        drawableTextCache.CancelRequest(resourceConsumer)
    }

    override fun GetResourceSize(drawableTextBitmap: DrawableTextBitmap): Int = 0

    override fun LoadResource(
        drawableTextParams: DrawableTextParams,
        drawableTextBitmap: DrawableTextBitmap,
        renderContext: RenderContext
    ): GLLoadedTextTexture =
        GLLoadedTextTexture(renderContext, drawableTextBitmap.bitmap, drawableTextBitmap.baselineOffset)

    override fun RequestRawResource(drawableTextParams: DrawableTextParams, resourceConsumer: ResourceConsumer) {
        drawableTextCache.RequestResource(drawableTextParams, resourceConsumer)
    }
}
