package com.lumiyaviewer.lumiya.render.glres

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.render.RenderContext
import com.lumiyaviewer.lumiya.res.ResourceConsumer
import com.lumiyaviewer.lumiya.res.ResourceManager
import com.lumiyaviewer.lumiya.res.ResourceMemoryCache
import com.lumiyaviewer.lumiya.res.ResourceRequest

abstract class GLResourceCache<ResourceParams, RawType, ResourceType : GLSizedResource>(
    private val loadQueue: GLLoadQueue
) : ResourceMemoryCache<ResourceParams, ResourceType>() {

    private inner class LoadRequest<Raw : RawType>(
        resourceParams: ResourceParams,
        resourceManager: ResourceManager<ResourceParams, ResourceType>
    ) : ResourceRequest<ResourceParams, ResourceType>(resourceParams, resourceManager), GLLoadQueue.GLLoadable, ResourceConsumer {

        @Volatile
        private var finalResult: Boolean = false

        @Volatile
        private var loadedFinal: Boolean = false

        @Volatile
        private var loadedResource: ResourceType? = null

        @Volatile
        private var rawResource: Raw? = null

        override fun GLCompleteLoad() {
            val resourceType: ResourceType?
            val isLoadedFinal: Boolean
            synchronized(this) {
                resourceType = loadedResource
                isLoadedFinal = loadedFinal
            }
            if (isLoadedFinal) {
                completeRequest(resourceType)
            } else {
                intermediateResult(resourceType)
            }
        }

        override fun GLGetLoadSize(): Int {
            val raw: Raw?
            synchronized(this) {
                raw = rawResource
            }
            return if (raw != null) GetResourceSize(raw) else 0
        }

        override fun GLLoad(renderContext: RenderContext, glLoadHandler: GLLoadQueue.GLLoadHandler): Int {
            val raw: Raw?
            val isFinalResult: Boolean
            synchronized(this) {
                raw = rawResource
                isFinalResult = finalResult
            }
            @Suppress("UNCHECKED_CAST")
            val resourceType = LoadResource(params, raw as RawType, renderContext) as ResourceType?
            val loadedSize = resourceType?.loadedSize ?: 0
            synchronized(this) {
                loadedResource = resourceType
                loadedFinal = isFinalResult
            }
            if (resourceType != null) {
                glLoadHandler.GLResourceLoaded(this)
            }
            return loadedSize
        }

        override fun OnResourceReady(obj: Any?, z: Boolean) {
            if (obj != null) {
                try {
                    synchronized(this) {
                        @Suppress("UNCHECKED_CAST")
                        rawResource = obj as Raw
                        finalResult = !z
                    }
                    loadQueue.add(this)
                } catch (e: ClassCastException) {
                    Debug.Warning(e)
                    completeRequest(null)
                }
            } else {
                completeRequest(null)
            }
            this@GLResourceCache.collectReferences()
        }

        override fun cancelRequest() {
            loadQueue.remove(this)
            CancelRawResource(this)
            super.cancelRequest()
        }

        override fun execute() {
            RequestRawResource(params, this)
        }
    }

    protected abstract fun CancelRawResource(resourceConsumer: ResourceConsumer)

    override fun CreateNewRequest(
        resourceParams: ResourceParams,
        resourceManager: ResourceManager<ResourceParams, ResourceType>
    ): ResourceRequest<ResourceParams, ResourceType> {
        return LoadRequest<RawType>(resourceParams, resourceManager)
    }

    protected abstract fun GetResourceSize(rawType: RawType): Int

    protected abstract fun LoadResource(resourceParams: ResourceParams, rawType: RawType, renderContext: RenderContext): ResourceType?

    protected abstract fun RequestRawResource(resourceParams: ResourceParams, resourceConsumer: ResourceConsumer)
}
