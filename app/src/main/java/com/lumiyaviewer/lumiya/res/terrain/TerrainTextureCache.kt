package com.lumiyaviewer.lumiya.res.terrain

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.openjpeg.OpenJPEG
import com.lumiyaviewer.lumiya.render.tex.DrawableTextureParams
import com.lumiyaviewer.lumiya.render.tex.TextureClass
import com.lumiyaviewer.lumiya.res.ResourceConsumer
import com.lumiyaviewer.lumiya.res.ResourceManager
import com.lumiyaviewer.lumiya.res.ResourceMemoryCache
import com.lumiyaviewer.lumiya.res.ResourceRequest
import com.lumiyaviewer.lumiya.res.textures.TextureCache
import com.lumiyaviewer.lumiya.slproto.terrain.TerrainPatchInfo
import com.lumiyaviewer.lumiya.utils.HasPriority
import java.util.UUID
import java.util.concurrent.Future

class TerrainTextureCache : ResourceMemoryCache<TerrainPatchInfo, OpenJPEG>() {

    companion object {
        @JvmField
        val TextureResolution = 256
    }

    private class TerrainTextureRequest(
        patchInfo: TerrainPatchInfo,
        manager: ResourceManager<TerrainPatchInfo, OpenJPEG>
    ) : ResourceRequest<TerrainPatchInfo, OpenJPEG>(patchInfo, manager), Runnable, HasPriority {

        @Volatile
        private var bakingFuture: Future<*>? = null
        private var layerNeededMask = 0
        private var layerReadyMask = 0
        private val rawRequests = arrayOfNulls<TerrainRawTextureRequest>(4)
        private val rawTextures = arrayOfNulls<OpenJPEG>(4)

        private inner class TerrainRawTextureRequest(
            uuid: UUID,
            private val layer: Int
        ) : ResourceConsumer {
            init {
                TextureCache.getInstance().RequestResource(
                    DrawableTextureParams.create(uuid, TextureClass.Terrain), this
                )
            }

            @Suppress("FunctionName")
            override fun OnResourceReady(resource: Any?, success: Boolean) {
                if (resource is OpenJPEG) {
                    onLayerReady(layer, resource)
                } else if (resource == null) {
                    onLayerReady(layer, null)
                }
            }
        }

        override fun cancelRequest() {
            synchronized(this) {
                for (i in 0 until 4) {
                    rawRequests[i] = null
                }
                bakingFuture?.cancel(false)
            }
            super.cancelRequest()
        }

        override fun execute() {
            layerNeededMask = getParams().layerMask
            layerReadyMask = 0
            if (layerNeededMask == 0) {
                bakingFuture = TextureCache.getInstance().decompressorExecutor.submit(this)
                return
            }
            synchronized(this) {
                for (i in 0 until 4) {
                    if (rawRequests[i] == null && (layerNeededMask and (1 shl i)) != 0) {
                        rawRequests[i] = TerrainRawTextureRequest(
                            getParams().textures.getTextureUUID(i), i
                        )
                    }
                }
            }
        }

        override fun getPriority(): Int = 0

        @Synchronized
        fun onLayerReady(layer: Int, texture: OpenJPEG?) {
            synchronized(this) {
                rawTextures[layer] = texture
                layerReadyMask = layerReadyMask or (1 shl layer)
                Debug.Printf(
                    "Terrain: onLayerReady (%d), rawTexture %s, layerNeededMask %d, layerReadyMask %d",
                    layer, texture?.toString() ?: "null", layerNeededMask, layerReadyMask
                )
                if ((layerNeededMask and layerReadyMask) == layerNeededMask) {
                    var allReady = true
                    for (i in 0 until 4) {
                        if ((layerNeededMask and (1 shl i)) != 0 && rawTextures[i] == null) {
                            Debug.Printf("Terrain: texture for layer %d is not ready", i)
                            allReady = false
                            break
                        }
                    }
                    if (allReady) {
                        bakingFuture = TextureCache.getInstance().decompressorExecutor.submit(this)
                    } else {
                        completeRequest(null)
                    }
                }
            }
        }

        override fun run() {
            try {
                val params = getParams()
                val bakedTexture = OpenJPEG.bakeTerrain(
                    256, 256,
                    rawTextures,
                    params.textureHeightMap,
                    params.heightMap.mapWidth,
                    params.heightMap.mapHeight
                )
                Debug.Printf("Terrain: Baked texture producer: produced baked texture")
                completeRequest(bakedTexture)
            } catch (e: Exception) {
                Debug.Warning(e)
                completeRequest(null)
            }
        }
    }

    @Suppress("FunctionName")
    override fun CreateNewRequest(
        params: TerrainPatchInfo,
        manager: ResourceManager<TerrainPatchInfo, OpenJPEG>
    ): ResourceRequest<TerrainPatchInfo, OpenJPEG> {
        return TerrainTextureRequest(params, manager)
    }
}
