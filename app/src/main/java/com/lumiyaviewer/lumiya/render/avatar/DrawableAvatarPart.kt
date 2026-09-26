package com.lumiyaviewer.lumiya.render.avatar

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.openjpeg.OpenJPEG
import com.lumiyaviewer.lumiya.render.RenderContext
import com.lumiyaviewer.lumiya.render.drawable.DrawableFaceTexture
import com.lumiyaviewer.lumiya.render.glres.textures.GLTextureCache
import com.lumiyaviewer.lumiya.render.tex.DrawableTextureParams
import com.lumiyaviewer.lumiya.res.ResourceConsumer
import com.lumiyaviewer.lumiya.res.executors.PrimComputeExecutor
import com.lumiyaviewer.lumiya.res.textures.TextureCache
import com.lumiyaviewer.lumiya.slproto.avatar.AvatarTextureFaceIndex
import com.lumiyaviewer.lumiya.slproto.avatar.SLAnimatedMeshData
import com.lumiyaviewer.lumiya.slproto.avatar.SLPolyMesh
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.util.Arrays
import java.util.UUID

class DrawableAvatarPart(
    private val avatarUUID: UUID,
    val faceIndex: AvatarTextureFaceIndex,
    private val referenceMeshData: SLPolyMesh,
    private val hasGL20: Boolean
) : ResourceConsumer {

    @Volatile
    private var meshData: SLAnimatedMeshData? = null

    @Volatile
    private var meshDataUpdated: Boolean = false

    @Volatile
    private var partMorphParams: FloatArray? = null

    @Volatile
    private var rawTexture: OpenJPEG? = null

    @Volatile
    private var texture: DrawableFaceTexture? = null

    @Volatile
    private var textureUUID: UUID? = null

    private val updateLock = Any()

    private val meshUpdate = Runnable {
        Debug.Printf("Avatar: meshUpdate entered for part %s", faceIndex.toString())
        val openJPEG: OpenJPEG?
        val morphParams: FloatArray?
        synchronized(updateLock) {
            openJPEG = rawTexture
            morphParams = partMorphParams
        }
        if (morphParams == null || openJPEG == null) return@Runnable
        Debug.Printf("Avatar: meshUpdate: part %s params %s", faceIndex.toString(), Arrays.toString(morphParams))
        val animatedMeshData = SLAnimatedMeshData(referenceMeshData, hasGL20)
        referenceMeshData.applyMorphData(animatedMeshData, morphParams, openJPEG)
        synchronized(updateLock) {
            meshData = animatedMeshData
            meshDataUpdated = true
        }
    }

    private fun RequestMeshUpdate() {
        PrimComputeExecutor.getInstance().execute(meshUpdate)
    }

    fun GLDraw(renderContext: RenderContext, floats: FloatArray?, forceUpdate: Boolean) {
        var needsUpdate = forceUpdate
        if (renderContext.hasGL20) {
            needsUpdate = false
        }
        val currentMeshData: SLAnimatedMeshData?
        val drawableFaceTexture: DrawableFaceTexture?
        synchronized(updateLock) {
            currentMeshData = meshData
            drawableFaceTexture = texture
            if (currentMeshData != null && meshDataUpdated && floats != null) {
                meshDataUpdated = false
                needsUpdate = true
            }
        }
        if (currentMeshData != null) {
            if (needsUpdate) {
                referenceMeshData.applySkeleton(currentMeshData, floats)
                currentMeshData.setVerticesDirty()
            }
            currentMeshData.GLDraw(renderContext, drawableFaceTexture)
        }
    }

    override fun OnResourceReady(obj: Any?, z: Boolean) {
        Debug.Printf("Avatar: (requesting meshUpdate) face %s texture %s",
            faceIndex.toString(), obj?.toString() ?: "null")
        if (obj is OpenJPEG) {
            synchronized(updateLock) {
                rawTexture = obj
            }
            RequestMeshUpdate()
        }
    }

    internal fun setPartMorphParams(floats: FloatArray) {
        val changed: Boolean
        synchronized(updateLock) {
            changed = !Arrays.equals(partMorphParams, floats)
            if (changed) {
                partMorphParams = floats
            }
        }
        if (changed) {
            Debug.Printf("Avatar: (requesting meshUpdate) new morphParams for part %s", faceIndex.toString())
            RequestMeshUpdate()
        }
    }

    internal fun setTexture(glTextureCache: GLTextureCache, uuid: UUID?) {
        synchronized(updateLock) {
            Debug.Printf("Avatar: face %s texture %s", faceIndex.toString(), uuid?.toString() ?: "null")
            var effectiveUuid = uuid
            if (effectiveUuid != null) {
                if (effectiveUuid == UUIDPool.ZeroUUID || effectiveUuid == DEFAULT_AVATAR_TEXTURE) {
                    effectiveUuid = null
                }
            }
            val currentTextureUUID = textureUUID
            if (currentTextureUUID != null) {
                if (effectiveUuid != null && currentTextureUUID == effectiveUuid) return
            } else if (effectiveUuid == null) {
                return
            }
            textureUUID = effectiveUuid
            if (effectiveUuid != null) {
                val create = DrawableTextureParams.create(effectiveUuid, faceIndex, avatarUUID)
                TextureCache.getInstance().RequestResource(create, this)
                texture = DrawableFaceTexture(create)
            } else {
                texture = null
                meshData = null
                rawTexture = null
            }
        }
    }

    companion object {
        @JvmField
        val DEFAULT_AVATAR_TEXTURE: UUID = UUID.fromString("c228d1cf-4b5d-4ba8-84f4-899a0796aa97")
    }
}
