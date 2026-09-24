package com.lumiyaviewer.lumiya.render.glres.textures;

import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.openjpeg.OpenJPEG;
import com.lumiyaviewer.lumiya.render.RenderContext;
import com.lumiyaviewer.lumiya.render.glres.GLLoadQueue;
import com.lumiyaviewer.lumiya.render.glres.GLResourceCache;
import com.lumiyaviewer.lumiya.res.ResourceConsumer;
import com.lumiyaviewer.lumiya.res.terrain.TerrainTextureCache;
import com.lumiyaviewer.lumiya.slproto.terrain.TerrainPatchInfo;

public class GLTerrainTextureCache extends GLResourceCache<TerrainPatchInfo, OpenJPEG, GLLoadedTexture> {
    private final TerrainTextureCache terrainTextureCache;

    public GLTerrainTextureCache(GLLoadQueue glLoadQueue, TerrainTextureCache terrainTextureCache) {
        super(glLoadQueue);
        this.terrainTextureCache = terrainTextureCache;
    }

    @Override
    protected void CancelRawResource(ResourceConsumer resourceConsumer) {
        this.terrainTextureCache.CancelRequest(resourceConsumer);
    }

    @Override
    public int GetResourceSize(OpenJPEG openJPEG) {
        return openJPEG.getLoadedSize();
    }

    @Override
    public GLLoadedTexture LoadResource(TerrainPatchInfo terrainPatchInfo, OpenJPEG openJPEG, RenderContext renderContext) {
        Debug.Printf("Terrain: Loading baked texture into GL", new Object[0]);
        return new GLLoadedTexture(renderContext, openJPEG);
    }

    @Override
    public void RequestRawResource(TerrainPatchInfo terrainPatchInfo, ResourceConsumer resourceConsumer) {
        this.terrainTextureCache.RequestResource(terrainPatchInfo, resourceConsumer);
    }
}
