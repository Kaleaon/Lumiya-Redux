package com.lumiyaviewer.lumiya.res

import java.util.Collections
import java.util.WeakHashMap

abstract class ResourceRequest<ResourceParams, ResourceType>(
    private val params: ResourceParams,
    private val manager: ResourceManager<ResourceParams, ResourceType>
) {
    private var started = false
    private var isCompleted = false
    var isCancelled: Boolean = false
    private val consumers: MutableSet<ResourceConsumer> =
        Collections.newSetFromMap(WeakHashMap(4, 0.5f))

    fun addConsumer(consumer: ResourceConsumer) {
        consumers.add(consumer)
    }

    open fun cancelRequest() {}

    open fun completeRequest(result: ResourceType?) {
        isCompleted = true
        manager.CompleteRequest(params, result, consumers)
    }

    abstract fun execute()

    internal fun getParams(): ResourceParams = params

    fun intermediateResult(result: ResourceType?) {
        manager.IntermediateResult(params, result, consumers)
    }

    fun isCompleted(): Boolean = isCompleted

    fun isStale(): Boolean = consumers.isEmpty()

    fun removeConsumer(consumer: ResourceConsumer): Boolean {
        consumers.remove(consumer)
        return consumers.isEmpty()
    }

    fun willStart(): Boolean {
        if (started) return false
        started = true
        return true
    }
}
