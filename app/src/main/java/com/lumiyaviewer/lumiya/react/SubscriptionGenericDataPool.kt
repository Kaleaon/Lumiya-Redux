package com.lumiyaviewer.lumiya.react

import java.util.concurrent.Executor

abstract class SubscriptionGenericDataPool<K, T> : Subscribable<K, T>, Unsubscribable<K, T> {
    private val lock = Any()
    private var canContainNulls = false

    private fun invokeSubscription(subscription: Subscription<K, T>, data: T?, error: Throwable?) {
        if (error != null) {
            subscription.onError(error)
        } else if (data != null || canContainNulls) {
            @Suppress("UNCHECKED_CAST")
            subscription.onData(data as T)
        }
    }

    protected abstract fun getExistingSubscriptions(key: K): SubscriptionList<K, T>?

    protected abstract fun getSubscriptions(key: K): SubscriptionList<K, T>

    open fun setCanContainNulls(canContainNulls: Boolean): SubscriptionGenericDataPool<K, T> {
        this.canContainNulls = canContainNulls
        return this
    }

    fun setData(key: K, data: T?) {
        setData(key, data, null)
    }

    fun setData(key: K, data: T?, error: Throwable?) {
        val subscriptions: List<Subscription<K, T>>?
        synchronized(lock) {
            val list = getSubscriptions(key)
            if (error != null) {
                list.setError(error)
            } else {
                list.setData(data)
            }
            subscriptions = list.getSubscriptions(true)
        }
        if (subscriptions != null) {
            for (subscription in subscriptions) {
                invokeSubscription(subscription, data, error)
            }
        }
    }

    fun setError(key: K, error: Throwable) {
        setData(key, null, error)
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
        val error: Throwable?
        val data: T?
        val subscription = Subscription(key, this, executor, onData, onError, null)
        synchronized(lock) {
            val subscriptions = getSubscriptions(key)
            subscriptions.addSubscription(subscription)
            error = subscriptions.getError()
            data = subscriptions.getData()
        }
        invokeSubscription(subscription, data, error)
        return subscription
    }

    override fun unsubscribe(subscription: Subscription<K, T>) {
        val key = subscription.key
        synchronized(lock) {
            val existing = getExistingSubscriptions(key)
            existing?.removeSubscription(subscription)
        }
    }
}
