package com.lumiyaviewer.lumiya.react

import java.lang.ref.ReferenceQueue
import java.lang.ref.WeakReference
import java.util.concurrent.Executor

class Subscription<K, T> internal constructor(
    val key: K,
    private val subscriptionPool: Unsubscribable<K, T>,
    private val executor: Executor?,
    private val onData: OnData<T>,
    private val onError: OnError?,
    referenceQueue: ReferenceQueue<Subscription<K, T>>?
) : RefreshableOne {

    fun interface OnData<T> {
        fun onData(data: T)
    }

    fun interface OnError {
        fun onError(error: Throwable)
    }

    class SubscriptionReference<K, T>(
        subscription: Subscription<K, T>,
        referenceQueue: ReferenceQueue<in Subscription<K, T>>?
    ) : WeakReference<Subscription<K, T>>(subscription, referenceQueue) {
        val key: K = subscription.key
    }

    internal val reference: SubscriptionReference<K, T> = SubscriptionReference(this, referenceQueue)

    internal fun onData(data: T) {
        val exec = executor
        if (exec != null) {
            exec.execute { onData.onData(data) }
        } else {
            onData.onData(data)
        }
    }

    internal fun onError(error: Throwable) {
        val handler = onError ?: return
        val exec = executor
        if (exec != null) {
            exec.execute { handler.onError(error) }
        } else {
            handler.onError(error)
        }
    }

    override fun requestRefresh() {
        val pool = subscriptionPool
        if (pool is Refreshable<*>) {
            @Suppress("UNCHECKED_CAST")
            (pool as Refreshable<K>).requestUpdate(key)
        }
    }

    fun unsubscribe() {
        subscriptionPool.unsubscribe(this)
    }
}
