package com.lumiyaviewer.lumiya.res.geometry

import com.lumiyaviewer.lumiya.openjpeg.OpenJPEG
import com.lumiyaviewer.lumiya.render.drawable.DrawableGeometry
import com.lumiyaviewer.lumiya.render.tex.DrawableTextureParams
import com.lumiyaviewer.lumiya.render.tex.TextureClass
import com.lumiyaviewer.lumiya.res.ResourceConsumer
import com.lumiyaviewer.lumiya.res.ResourceManager
import com.lumiyaviewer.lumiya.res.ResourceMemoryCache
import com.lumiyaviewer.lumiya.res.ResourceRequest
import com.lumiyaviewer.lumiya.res.executors.PrimComputeExecutor
import com.lumiyaviewer.lumiya.res.mesh.MeshCache
import com.lumiyaviewer.lumiya.res.textures.TextureCache
import com.lumiyaviewer.lumiya.slproto.mesh.MeshData
import com.lumiyaviewer.lumiya.slproto.prims.PrimVolumeParams

class GeometryCache(private val meshCache: MeshCache) : ResourceMemoryCache<PrimVolumeParams, DrawableGeometry>() {

    private class MeshGeometryRequest(
        private val meshCache: MeshCache,
        params: PrimVolumeParams,
        manager: ResourceManager<PrimVolumeParams, DrawableGeometry>
    ) : ResourceRequest<PrimVolumeParams, DrawableGeometry>(params, manager), Runnable, ResourceConsumer {

        @Volatile
        private var meshData: MeshData? = null

        override fun OnResourceReady(resource: Any?, success: Boolean) {
            if (resource !is MeshData) {
                completeRequest(null)
            } else {
                meshData = resource
                PrimComputeExecutor.getInstance().execute(this)
            }
        }

        override fun cancelRequest() {
            PrimComputeExecutor.getInstance().remove(this)
            super.cancelRequest()
        }

        override fun execute() {
            meshCache.RequestResource(getParams().SculptID, this)
        }

        override fun run() {
            try {
                completeRequest(DrawableGeometry(meshData))
            } catch (e: Exception) {
                completeRequest(null)
            }
        }
    }

    private class SculptGeometryRequest(
        params: PrimVolumeParams,
        manager: ResourceManager<PrimVolumeParams, DrawableGeometry>
    ) : ResourceRequest<PrimVolumeParams, DrawableGeometry>(params, manager), Runnable, ResourceConsumer {

        @Volatile
        private var sculptData: OpenJPEG? = null
        private val sculptTextureParams = DrawableTextureParams.create(getParams().SculptID, TextureClass.Sculpt)

        override fun OnResourceReady(resource: Any?, success: Boolean) {
            if (resource !is OpenJPEG) {
                completeRequest(null)
            } else {
                sculptData = resource
                PrimComputeExecutor.getInstance().execute(this)
            }
        }

        override fun cancelRequest() {
            PrimComputeExecutor.getInstance().remove(this)
            TextureCache.getInstance().CancelRequest(this)
            super.cancelRequest()
        }

        override fun execute() {
            TextureCache.getInstance().RequestResource(sculptTextureParams, this)
        }

        override fun run() {
            try {
                completeRequest(DrawableGeometry(getParams(), sculptData))
            } catch (e: Exception) {
                completeRequest(null)
            }
        }
    }

    private class SimpleGeometryRequest(
        params: PrimVolumeParams,
        manager: ResourceManager<PrimVolumeParams, DrawableGeometry>
    ) : ResourceRequest<PrimVolumeParams, DrawableGeometry>(params, manager), Runnable {

        override fun cancelRequest() {
            PrimComputeExecutor.getInstance().remove(this)
            super.cancelRequest()
        }

        override fun execute() {
            PrimComputeExecutor.getInstance().execute(this)
        }

        override fun run() {
            try {
                completeRequest(DrawableGeometry(getParams(), null))
            } catch (e: Exception) {
                completeRequest(null)
            }
        }
    }

    override fun CreateNewRequest(
        params: PrimVolumeParams,
        manager: ResourceManager<PrimVolumeParams, DrawableGeometry>
    ): ResourceRequest<PrimVolumeParams, DrawableGeometry> {
        return when {
            params.isMesh() -> MeshGeometryRequest(meshCache, params, manager)
            params.isSculpt() -> SculptGeometryRequest(params, manager)
            else -> SimpleGeometryRequest(params, manager)
        }
    }
}
