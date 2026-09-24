package com.lumiyaviewer.lumiya.render.glres.textures;

import com.lumiyaviewer.lumiya.render.RenderContext;
import com.lumiyaviewer.lumiya.render.glres.GLLoadQueue;
import com.lumiyaviewer.lumiya.render.glres.GLResourceCache;
import com.lumiyaviewer.lumiya.res.ResourceConsumer;
import com.lumiyaviewer.lumiya.res.text.DrawableTextBitmap;
import com.lumiyaviewer.lumiya.res.text.DrawableTextCache;
import com.lumiyaviewer.lumiya.res.text.DrawableTextParams;

public class GLTextTextureCache extends GLResourceCache<DrawableTextParams, DrawableTextBitmap, GLLoadedTextTexture> {
    private final DrawableTextCache drawableTextCache;

    public GLTextTextureCache(GLLoadQueue glLoadQueue, DrawableTextCache drawableTextCache) {
        super(glLoadQueue);
        this.drawableTextCache = drawableTextCache;
    }

    @Override
    protected void CancelRawResource(ResourceConsumer resourceConsumer) {
        this.drawableTextCache.CancelRequest(resourceConsumer);
    }

    @Override
    public int GetResourceSize(DrawableTextBitmap drawableTextBitmap) {
        return 0;
    }

    @Override
    public GLLoadedTextTexture LoadResource(DrawableTextParams drawableTextParams, DrawableTextBitmap drawableTextBitmap, RenderContext renderContext) {
        return new GLLoadedTextTexture(renderContext, drawableTextBitmap.getBitmap(), drawableTextBitmap.getBaselineOffset());
    }

    @Override
    public void RequestRawResource(DrawableTextParams drawableTextParams, ResourceConsumer resourceConsumer) {
        this.drawableTextCache.RequestResource(drawableTextParams, resourceConsumer);
    }
}
