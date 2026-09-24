package com.lumiyaviewer.lumiya.render;

import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import com.lumiyaviewer.lumiya.render.avatar.DrawableAvatar;
import com.lumiyaviewer.lumiya.render.avatar.DrawableAvatarStub;
import com.lumiyaviewer.lumiya.render.glres.GLLoadQueue;
import com.lumiyaviewer.lumiya.render.glres.textures.GLTerrainTextureCache;
import com.lumiyaviewer.lumiya.render.glres.textures.GLTextTextureCache;
import com.lumiyaviewer.lumiya.render.glres.textures.GLTextureCache;
import com.lumiyaviewer.lumiya.render.spatial.SpatialIndex;
import com.lumiyaviewer.lumiya.render.spatial.SpatialObjectIndex;
import com.lumiyaviewer.lumiya.res.geometry.GeometryCache;
import com.lumiyaviewer.lumiya.res.geometry.PrimCache;
import com.lumiyaviewer.lumiya.res.mesh.MeshCache;
import com.lumiyaviewer.lumiya.res.terrain.TerrainGeometryCache;
import com.lumiyaviewer.lumiya.res.terrain.TerrainTextureCache;
import com.lumiyaviewer.lumiya.res.text.DrawableTextCache;
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectAvatarInfo;
import javax.annotation.Nonnull;

public class DrawableStore {
    public final GLTerrainTextureCache glTerrainTextureCache;
    public final GLTextureCache glTextureCache;
    public final boolean hasGL20;
    public final PrimCache primCache;
    public final SpatialObjectIndex spatialObjectIndex;
    public final GLTextTextureCache textTextureCache;
    public final TerrainGeometryCache terrainGeometryCache = new TerrainGeometryCache();
    public final LoadingCache<SLObjectAvatarInfo, DrawableAvatar> drawableAvatarCache = CacheBuilder.newBuilder().weakKeys().weakValues().build(new CacheLoader<SLObjectAvatarInfo, DrawableAvatar>() {
        @Override
        public DrawableAvatar load(@Nonnull SLObjectAvatarInfo objectAvatarInfo) {
            return objectAvatarInfo.getAvatarVisualState().createDrawableAvatar(DrawableStore.this);
        }
    });
    public final LoadingCache<SLObjectAvatarInfo, DrawableAvatarStub> drawableAvatarStubCache = CacheBuilder.newBuilder().weakKeys().weakValues().build(new CacheLoader<SLObjectAvatarInfo, DrawableAvatarStub>() {
        @Override
        public DrawableAvatarStub load(@Nonnull SLObjectAvatarInfo objectAvatarInfo) {
            return objectAvatarInfo.getAvatarVisualState().createDrawableAvatarStub(DrawableStore.this);
        }
    });
    public final MeshCache meshCache = new MeshCache();
    public final GeometryCache geometryCache = new GeometryCache(this.meshCache);

    public DrawableStore(GLLoadQueue glLoadQueue, boolean hasGL20, int i, boolean z2, int i2, Object obj) {
        this.hasGL20 = hasGL20;
        this.glTextureCache = new GLTextureCache(glLoadQueue);
        this.textTextureCache = new GLTextTextureCache(glLoadQueue, new DrawableTextCache(i2));
        this.primCache = new PrimCache(this.glTextureCache, this.geometryCache);
        this.spatialObjectIndex = new SpatialObjectIndex(this, i);
        this.glTerrainTextureCache = z2 ? new GLTerrainTextureCache(glLoadQueue, new TerrainTextureCache()) : null;
        SpatialIndex.getInstance().EnableObjectIndex(this.spatialObjectIndex, obj);
    }

    public void setMeshCapURL(String meshCapURL) {
        this.meshCache.setCapURL(meshCapURL);
    }
}
