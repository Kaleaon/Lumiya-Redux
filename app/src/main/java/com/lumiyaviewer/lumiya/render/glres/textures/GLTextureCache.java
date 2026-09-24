package com.lumiyaviewer.lumiya.render.glres.textures;

import com.lumiyaviewer.lumiya.openjpeg.OpenJPEG;
import com.lumiyaviewer.lumiya.render.RenderContext;
import com.lumiyaviewer.lumiya.render.glres.GLLoadQueue;
import com.lumiyaviewer.lumiya.render.glres.GLResourceCache;
import com.lumiyaviewer.lumiya.render.tex.DrawableTextureParams;
import com.lumiyaviewer.lumiya.res.ResourceConsumer;
import com.lumiyaviewer.lumiya.res.textures.TextureCache;

public class GLTextureCache extends GLResourceCache<DrawableTextureParams, OpenJPEG, GLLoadedTexture> {
    public GLTextureCache(GLLoadQueue glLoadQueue) {
        super(glLoadQueue);
    }

    @Override
    protected void CancelRawResource(ResourceConsumer resourceConsumer) {
        TextureCache.getInstance().CancelRequest(resourceConsumer);
    }

    @Override
    public int GetResourceSize(OpenJPEG openJPEG) {
        return openJPEG.getLoadedSize();
    }

    @Override
    public GLLoadedTexture LoadResource(DrawableTextureParams drawableTextureParams, OpenJPEG openJPEG, RenderContext renderContext) {
        return new GLLoadedTexture(renderContext, openJPEG);
    }

    @Override
    public void RequestRawResource(DrawableTextureParams drawableTextureParams, ResourceConsumer resourceConsumer) {
        TextureCache.getInstance().RequestResource(drawableTextureParams, resourceConsumer);
    }
}
