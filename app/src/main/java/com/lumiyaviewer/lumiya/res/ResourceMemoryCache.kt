package com.lumiyaviewer.lumiya.res

import com.google.common.cache.CacheBuilder

abstract class ResourceMemoryCache<ResourceParams, ResourceType> : ResourceManager<ResourceParams, ResourceType>() {

    @Suppress("UNCHECKED_CAST")
    private val finalResults = CacheBuilder.newBuilder()
        .weakValues()
        .build<ResourceParams, ResourceType>()

    @Suppress("UNCHECKED_CAST")
    private val intermediateResults = CacheBuilder.newBuilder()
        .weakValues()
        .build<ResourceParams, ResourceType>()

    override fun CompleteRequest(params: ResourceParams, result: ResourceType, consumers: Set<ResourceConsumer>) {
        if (result != null) {
            finalResults.put(params, result)
        } else {
            finalResults.invalidate(params)
        }
        super.CompleteRequest(params, result, consumers)
    }

    override fun IntermediateResult(params: ResourceParams, result: ResourceType, consumers: Set<ResourceConsumer>) {
        if (result != null) {
            intermediateResults.put(params, result)
        } else {
            intermediateResults.invalidate(params)
        }
        super.IntermediateResult(params, result, consumers)
    }

    override fun RequestResource(params: ResourceParams, consumer: ResourceConsumer) {
        val finalResult = finalResults.getIfPresent(params)
        if (finalResult != null) {
            consumer.OnResourceReady(finalResult, false)
            return
        }
        val intermediateResult = intermediateResults.getIfPresent(params)
        if (intermediateResult != null) {
            consumer.OnResourceReady(intermediateResult, true)
        }
        super.RequestResource(params, consumer)
    }
}
