package com.lumiyaviewer.lumiya.react

import java.util.concurrent.Executor

class SubscriptionPoolUncached<K, T> : Subscribable<K, T> {
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
        @Suppress("UNCHECKED_CAST")
        return null as Subscription<K, T>
    }
}
