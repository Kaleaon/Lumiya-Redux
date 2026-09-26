package com.lumiyaviewer.lumiya.render

import com.google.common.cache.CacheBuilder
import com.google.common.cache.CacheLoader
import com.google.common.cache.LoadingCache
import com.lumiyaviewer.lumiya.render.avatar.DrawableAvatar
import com.lumiyaviewer.lumiya.render.avatar.DrawableAvatarStub
import com.lumiyaviewer.lumiya.render.glres.GLLoadQueue
import com.lumiyaviewer.lumiya.render.glres.textures.GLTerrainTextureCache
import com.lumiyaviewer.lumiya.render.glres.textures.GLTextTextureCache
import com.lumiyaviewer.lumiya.render.glres.textures.GLTextureCache
import com.lumiyaviewer.lumiya.render.spatial.SpatialIndex
import com.lumiyaviewer.lumiya.render.spatial.SpatialObjectIndex
import com.lumiyaviewer.lumiya.res.geometry.GeometryCache
import com.lumiyaviewer.lumiya.res.geometry.PrimCache
import com.lumiyaviewer.lumiya.res.mesh.MeshCache
import com.lumiyaviewer.lumiya.res.terrain.TerrainGeometryCache
import com.lumiyaviewer.lumiya.res.terrain.TerrainTextureCache
import com.lumiyaviewer.lumiya.res.text.DrawableTextCache
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectAvatarInfo

class DrawableStore(
    glLoadQueue: GLLoadQueue,
    @JvmField val hasGL20: Boolean,
    avatarCountLimit: Int,
    hasTerrainTextureCache: Boolean,
    textTextureCacheSize: Int,
    spatialIndexToken: Any?
) {
    // These fields mirror the original Java class's inline field initializers, which run
    // before the constructor body (and therefore before glTextureCache/textTextureCache/
    // primCache/spatialObjectIndex/glTerrainTextureCache below, which were constructor-body
    // assignments in the original).
    @JvmField
    val terrainGeometryCache = TerrainGeometryCache()

    @JvmField
    val drawableAvatarCache: LoadingCache<SLObjectAvatarInfo, DrawableAvatar> = CacheBuilder.newBuilder()
        .weakKeys()
        .weakValues()
        .build(object : CacheLoader<SLObjectAvatarInfo, DrawableAvatar>() {
            override fun load(objectAvatarInfo: SLObjectAvatarInfo): DrawableAvatar {
                return objectAvatarInfo.avatarVisualState.createDrawableAvatar(this@DrawableStore)
            }
        })

    @JvmField
    val drawableAvatarStubCache: LoadingCache<SLObjectAvatarInfo, DrawableAvatarStub> = CacheBuilder.newBuilder()
        .weakKeys()
        .weakValues()
        .build(object : CacheLoader<SLObjectAvatarInfo, DrawableAvatarStub>() {
            override fun load(objectAvatarInfo: SLObjectAvatarInfo): DrawableAvatarStub {
                return objectAvatarInfo.avatarVisualState.createDrawableAvatarStub(this@DrawableStore)
            }
        })

    @JvmField
    val meshCache = MeshCache()

    @JvmField
    val geometryCache: GeometryCache = GeometryCache(meshCache)

    @JvmField
    val glTextureCache: GLTextureCache

    @JvmField
    val textTextureCache: GLTextTextureCache

    @JvmField
    val primCache: PrimCache

    @JvmField
    val spatialObjectIndex: SpatialObjectIndex

    @JvmField
    val glTerrainTextureCache: GLTerrainTextureCache?

    init {
        glTextureCache = GLTextureCache(glLoadQueue)
        textTextureCache = GLTextTextureCache(glLoadQueue, DrawableTextCache(textTextureCacheSize))
        primCache = PrimCache(glTextureCache, geometryCache)
        spatialObjectIndex = SpatialObjectIndex(this, avatarCountLimit)
        glTerrainTextureCache = if (hasTerrainTextureCache) {
            GLTerrainTextureCache(glLoadQueue, TerrainTextureCache())
        } else {
            null
        }
        SpatialIndex.getInstance().EnableObjectIndex(spatialObjectIndex, spatialIndexToken)
    }

    fun setMeshCapURL(meshCapURL: String) {
        meshCache.setCapURL(meshCapURL)
    }
}
