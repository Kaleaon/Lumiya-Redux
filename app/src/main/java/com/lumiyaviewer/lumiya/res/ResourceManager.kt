package com.lumiyaviewer.lumiya.res

import com.google.common.cache.CacheBuilder
import com.google.common.cache.CacheLoader
import com.google.common.cache.RemovalNotification
import com.lumiyaviewer.lumiya.res.executors.ResourceCleanupExecutor
import java.util.concurrent.ConcurrentLinkedQueue
import java.util.concurrent.ScheduledFuture
import java.util.concurrent.TimeUnit

abstract class ResourceManager<ResourceParams, ResourceType> {
    private val lock = Any()

    @Volatile
    private var cleanupFuture: ScheduledFuture<*>? = null
    private val cancelledRequests = ConcurrentLinkedQueue<ResourceRequest<ResourceParams, ResourceType>>()

    private val removalListener = { notification: RemovalNotification<ResourceConsumer, ResourceRequest<ResourceParams, ResourceType>> ->
        val key = notification.key
        val value = notification.value
        if (value != null && !value.isCompleted() && !value.isCancelled) {
            if (key != null) {
                value.removeConsumer(key)
            }
            if (value.isStale()) {
                value.isCancelled = true
                cancelledRequests.add(value)
                @Suppress("UNCHECKED_CAST")
                val current = requestMap.getIfPresent(value.getParams()) as? ResourceRequest<ResourceParams, ResourceType>
                if (current === value) {
                    requestMap.invalidate(value.getParams())
                }
            }
        }
    }

    private val consumerMap = CacheBuilder.newBuilder()
        .weakKeys()
        .removalListener(removalListener)
        .build<ResourceConsumer, ResourceRequest<ResourceParams, ResourceType>>()

    @Suppress("UNCHECKED_CAST")
    private val requestMap = CacheBuilder.newBuilder()
        .weakValues()
        .build(object : CacheLoader<ResourceParams, ResourceRequest<ResourceParams, ResourceType>>() {
            override fun load(key: ResourceParams & Any): ResourceRequest<ResourceParams, ResourceType> {
                return CreateNewRequest(key, this@ResourceManager)
            }
        })

    private val cleanup = Runnable { collectReferences() }

    @Suppress("FunctionName")
    fun CancelRequest(consumer: ResourceConsumer?) {
        if (consumer != null) {
            synchronized(lock) {
                consumerMap.invalidate(consumer)
            }
            collectReferences()
        }
    }

    @Suppress("FunctionName")
    open fun CompleteRequest(params: ResourceParams, result: ResourceType, consumers: Set<ResourceConsumer>) {
        val consumerList: ArrayList<ResourceConsumer>
        synchronized(lock) {
            requestMap.invalidate(params)
            consumerList = ArrayList(consumers.size)
            for (consumer in consumers) {
                consumerList.add(consumer)
                consumerMap.invalidate(consumer)
            }
        }
        for (consumer in consumerList) {
            consumer.OnResourceReady(result, false)
        }
        consumerList.clear()
        collectReferences()
    }

    @Suppress("FunctionName")
    protected abstract fun CreateNewRequest(
        params: ResourceParams,
        manager: ResourceManager<ResourceParams, ResourceType>
    ): ResourceRequest<ResourceParams, ResourceType>

    @Suppress("FunctionName")
    open fun IntermediateResult(params: ResourceParams, result: ResourceType, consumers: Set<ResourceConsumer>) {
        val consumerList: ArrayList<ResourceConsumer>
        synchronized(lock) {
            consumerList = ArrayList(consumers.size)
            for (consumer in consumers) {
                consumerList.add(consumer)
            }
        }
        for (consumer in consumerList) {
            consumer.OnResourceReady(result, true)
        }
        consumerList.clear()
        collectReferences()
    }

    @Suppress("FunctionName")
    open fun RequestResource(params: ResourceParams, consumer: ResourceConsumer) {
        val request: ResourceRequest<ResourceParams, ResourceType>
        val willStart: Boolean
        synchronized(lock) {
            request = requestMap.getUnchecked(params)
            consumerMap.put(consumer, request)
            request.addConsumer(consumer)
            willStart = request.willStart()
            if (cleanupFuture == null) {
                cleanupFuture = ResourceCleanupExecutor.getInstance()
                    .scheduleAtFixedRate(cleanup, 1L, 1L, TimeUnit.SECONDS)
            }
        }
        if (willStart) {
            request.execute()
        }
    }

    protected open fun collectReferences() {
        var toCancel: ArrayList<ResourceRequest<ResourceParams, ResourceType>>? = null
        synchronized(lock) {
            requestMap.cleanUp()
            consumerMap.cleanUp()
            while (true) {
                val poll = cancelledRequests.poll() ?: break
                if (toCancel == null) toCancel = ArrayList()
                toCancel!!.add(poll)
            }
            if (requestMap.size() == 0L && consumerMap.size() == 0L && cancelledRequests.isEmpty()) {
                cleanupFuture?.cancel(false)
                cleanupFuture = null
            }
        }
        if (toCancel != null) {
            for (request in toCancel!!) {
                request.cancelRequest()
            }
            toCancel!!.clear()
        }
    }
}
