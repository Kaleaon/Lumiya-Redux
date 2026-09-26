package com.lumiyaviewer.lumiya.res.geometry

import com.lumiyaviewer.lumiya.render.drawable.DrawableGeometry
import com.lumiyaviewer.lumiya.render.drawable.DrawablePrim
import com.lumiyaviewer.lumiya.render.glres.textures.GLTextureCache
import com.lumiyaviewer.lumiya.res.ResourceConsumer
import com.lumiyaviewer.lumiya.res.ResourceManager
import com.lumiyaviewer.lumiya.res.ResourceMemoryCache
import com.lumiyaviewer.lumiya.res.ResourceRequest
import com.lumiyaviewer.lumiya.res.executors.PrimComputeExecutor
import com.lumiyaviewer.lumiya.slproto.prims.PrimDrawParams

class PrimCache(
    private val textureCache: GLTextureCache,
    private val geometryCache: GeometryCache
) : ResourceMemoryCache<PrimDrawParams, DrawablePrim>() {

    private class PrimRequest(
        private val glTextureCache: GLTextureCache,
        private val geometryCache: GeometryCache,
        params: PrimDrawParams,
        manager: ResourceManager<PrimDrawParams, DrawablePrim>
    ) : ResourceRequest<PrimDrawParams, DrawablePrim>(params, manager), Runnable, ResourceConsumer {

        @Volatile
        private var geometry: DrawableGeometry? = null

        override fun OnResourceReady(resource: Any?, success: Boolean) {
            if (resource !is DrawableGeometry) {
                completeRequest(null)
            } else {
                geometry = resource
                PrimComputeExecutor.getInstance().execute(this)
            }
        }

        override fun cancelRequest() {
            PrimComputeExecutor.getInstance().remove(this)
            geometryCache.CancelRequest(this)
            super.cancelRequest()
        }

        override fun execute() {
            geometryCache.RequestResource(getParams().volumeParams, this)
        }

        override fun run() {
            try {
                completeRequest(DrawablePrim(getParams(), geometry))
            } catch (e: Exception) {
                completeRequest(null)
            }
        }
    }

    override fun CreateNewRequest(
        params: PrimDrawParams,
        manager: ResourceManager<PrimDrawParams, DrawablePrim>
    ): ResourceRequest<PrimDrawParams, DrawablePrim> {
        return PrimRequest(textureCache, geometryCache, params, manager)
    }
}
