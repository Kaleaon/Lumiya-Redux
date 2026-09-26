package com.lumiyaviewer.lumiya.react

import com.google.common.base.Predicate
import com.lumiyaviewer.lumiya.Debug
import java.lang.ref.ReferenceQueue
import java.util.concurrent.Executor

class SubscriptionPool<K, T> @JvmOverloads constructor(
    private var requestHandler: RequestHandler<K>? = null
) : Unsubscribable<K, T>, Refreshable<K>, ResultHandler<K, T>, Subscribable<K, T>, RequestSource<K, T> {

    private val entries: MutableMap<K, SubscriptionRequestedList<K, T>> = HashMap()
    private val lock = Any()
    private val refQueue = ReferenceQueue<Subscription<K, T>>()
    private var disposeHandler: DisposeHandler<T>? = null
    private var disposeExecutor: Executor? = null
    private var cacheInvalidateExecutor: Executor? = null
    private var cacheInvalidateHandler: Refreshable<K>? = null
    private var requestOnce = false

    private class SubscriptionRequestedList<K, T> : SubscriptionList<K, T>() {
        var requested: Boolean = false
    }

    private fun collectReferences() {
        while (true) {
            val poll = refQueue.poll() ?: break
            if (poll is Subscription.SubscriptionReference<*, *>) {
                @Suppress("UNCHECKED_CAST")
                val ref = poll as Subscription.SubscriptionReference<K, T>
                val key = ref.key ?: continue
                Debug.Printf("UserPic: collecting reference for %s", key.toString())
                synchronized(lock) {
                    val list = entries[key]
                    if (list != null) {
                        list.removeByReference(ref)
                        if (list.isEmpty()) {
                            entries.remove(key)
                            requestHandler?.onRequestCancelled(key)
                            disposeOldData(list)
                        }
                    }
                }
            }
        }
        synchronized(lock) {
            Debug.Printf("UserPic: subscriptions = %d", entries.size)
        }
    }

    private fun disposeOldData(subscriptionList: SubscriptionList<K, T>) {
        val handler = disposeHandler ?: return
        val data = subscriptionList.getData() ?: return
        val exec = disposeExecutor
        if (exec != null) {
            exec.execute { handler.onDispose(data) }
        } else {
            handler.onDispose(data)
        }
    }

    override fun attachRequestHandler(requestHandler: RequestHandler<K>): ResultHandler<K, T> {
        synchronized(lock) {
            this.requestHandler = requestHandler
        }
        return this
    }

    override fun detachRequestHandler(requestHandler: RequestHandler<K>) {
        synchronized(lock) {
            if (this.requestHandler === requestHandler) {
                this.requestHandler = null
            }
        }
    }

    override fun onResultData(key: K, data: T) {
        val list: List<Subscription<K, T>>?
        collectReferences()
        synchronized(lock) {
            val entry = entries[key]
            if (entry != null) {
                entry.setData(data)
                entry.requested = false
                list = entry.getSubscriptions(false)
            } else {
                list = null
            }
        }
        if (list != null) {
            for (subscription in list) {
                subscription.onData(data)
            }
        }
    }

    override fun onResultError(key: K, error: Throwable) {
        val list: List<Subscription<K, T>>?
        collectReferences()
        synchronized(lock) {
            val entry = entries[key]
            if (entry != null) {
                entry.setError(error)
                entry.requested = false
                list = entry.getSubscriptions(false)
            } else {
                list = null
            }
        }
        if (list != null) {
            for (subscription in list) {
                subscription.onError(error)
            }
        }
    }

    override fun requestUpdate(key: K) {
        synchronized(lock) {
            val invalidateHandler = cacheInvalidateHandler
            if (invalidateHandler != null) {
                val exec = cacheInvalidateExecutor
                if (exec != null) {
                    exec.execute { invalidateHandler.requestUpdate(key) }
                } else {
                    invalidateHandler.requestUpdate(key)
                }
            }
            val entry = entries[key]
            val handler = requestHandler
            if (entry != null && handler != null) {
                if (handler is Refreshable<*>) {
                    @Suppress("UNCHECKED_CAST")
                    (handler as Refreshable<K>).requestUpdate(key)
                } else if (!requestOnce || !entry.requested) {
                    entry.requested = true
                    handler.onRequest(key)
                }
            }
        }
    }

    fun requestUpdateAll() {
        synchronized(lock) {
            for ((key, entry) in entries) {
                val handler = requestHandler
                if (entry != null && handler != null && (!requestOnce || !entry.requested)) {
                    entry.requested = true
                    handler.onRequest(key)
                }
            }
        }
    }

    fun requestUpdateSome(predicate: Predicate<K>) {
        val handler = requestHandler ?: return
        val keysToRequest: MutableSet<K>?
        synchronized(lock) {
            var keys: MutableSet<K>? = null
            for ((key, entry) in entries) {
                if (entry != null && predicate.apply(key) && (!requestOnce || !entry.requested)) {
                    entry.requested = true
                    if (keys == null) keys = HashSet()
                    keys!!.add(key)
                }
            }
            keysToRequest = keys
        }
        if (keysToRequest != null) {
            for (key in keysToRequest) {
                handler.onRequest(key)
            }
        }
    }

    fun setCacheInvalidateHandler(refreshable: Refreshable<K>, executor: Executor?): SubscriptionPool<K, T> {
        cacheInvalidateHandler = refreshable
        cacheInvalidateExecutor = executor
        return this
    }

    fun setDisposeHandler(disposeHandler: DisposeHandler<T>, executor: Executor?): SubscriptionPool<K, T> {
        this.disposeHandler = disposeHandler
        this.disposeExecutor = executor
        return this
    }

    fun setRequestOnce(requestOnce: Boolean): SubscriptionPool<K, T> {
        this.requestOnce = requestOnce
        return this
    }

    override fun subscribe(key: K, onData: Subscription.OnData<T>): Subscription<K, T> {
        return subscribe(key, null, onData, null)
    }

    override fun subscribe(key: K, onData: Subscription.OnData<T>, onError: Subscription.OnError?): Subscription<K, T> {
        return subscribe(key, null, onData, onError)
    }

    override fun subscribe(key: K, executor: Executor?, onData: Subscription.OnData<T>): Subscription<K, T> {
        return subscribe(key, executor, onData, null)
    }

    override fun subscribe(key: K, executor: Executor?, onData: Subscription.OnData<T>, onError: Subscription.OnError?): Subscription<K, T> {
        val subscription = Subscription(key, this, executor, onData, onError, refQueue)
        synchronized(lock) {
            var isNew = false
            var entry = entries[key]
            if (entry == null) {
                entry = SubscriptionRequestedList()
                entries[key] = entry
                isNew = true
            }
            entry.addSubscription(subscription)
            val error = entry.getError()
            if (error != null) {
                subscription.onError(error)
            } else {
                val data = entry.getData()
                if (data != null) {
                    subscription.onData(data)
                }
            }
            if (isNew && requestHandler != null) {
                entry.requested = true
                requestHandler!!.onRequest(key)
            }
        }
        collectReferences()
        return subscription
    }

    override fun unsubscribe(subscription: Subscription<K, T>) {
        val key = subscription.key
        synchronized(lock) {
            val entry = entries[key]
            if (entry != null) {
                entry.removeSubscription(subscription)
                if (entry.isEmpty()) {
                    entries.remove(key)
                    requestHandler?.onRequestCancelled(key)
                    disposeOldData(entry)
                }
            }
        }
        collectReferences()
    }

    fun withRequestHandler(requestHandler: RequestHandler<K>): SubscriptionPool<K, T> {
        synchronized(lock) {
            this.requestHandler = requestHandler
        }
        return this
    }
}
