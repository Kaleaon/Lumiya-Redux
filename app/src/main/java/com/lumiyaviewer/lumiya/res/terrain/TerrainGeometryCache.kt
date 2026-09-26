package com.lumiyaviewer.lumiya.res.terrain

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.render.terrain.TerrainPatchGeometry
import com.lumiyaviewer.lumiya.res.ResourceManager
import com.lumiyaviewer.lumiya.res.ResourceMemoryCache
import com.lumiyaviewer.lumiya.res.ResourceRequest
import com.lumiyaviewer.lumiya.res.executors.PrimComputeExecutor
import com.lumiyaviewer.lumiya.slproto.terrain.TerrainPatchHeightMap

class TerrainGeometryCache : ResourceMemoryCache<TerrainPatchHeightMap, TerrainPatchGeometry>() {

    private class TerrainGeometryRequest(
        heightMap: TerrainPatchHeightMap,
        manager: ResourceManager<TerrainPatchHeightMap, TerrainPatchGeometry>
    ) : ResourceRequest<TerrainPatchHeightMap, TerrainPatchGeometry>(heightMap, manager), Runnable {

        override fun cancelRequest() {
            PrimComputeExecutor.getInstance().remove(this)
            super.cancelRequest()
        }

        override fun execute() {
            PrimComputeExecutor.getInstance().execute(this)
        }

        override fun run() {
            try {
                completeRequest(TerrainPatchGeometry(getParams()))
            } catch (e: Exception) {
                Debug.Warning(e)
                completeRequest(null)
            }
        }
    }

    @Suppress("FunctionName")
    override fun CreateNewRequest(
        params: TerrainPatchHeightMap,
        manager: ResourceManager<TerrainPatchHeightMap, TerrainPatchGeometry>
    ): ResourceRequest<TerrainPatchHeightMap, TerrainPatchGeometry> {
        return TerrainGeometryRequest(params, manager)
    }
}
