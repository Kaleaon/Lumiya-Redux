package com.lumiyaviewer.lumiya.react

import java.util.concurrent.Executor

interface Subscribable<K, T> {
    fun subscribe(key: K, onData: Subscription.OnData<T>): Subscription<K, T>
    fun subscribe(key: K, onData: Subscription.OnData<T>, onError: Subscription.OnError?): Subscription<K, T>
    fun subscribe(key: K, executor: Executor?, onData: Subscription.OnData<T>): Subscription<K, T>
    fun subscribe(key: K, executor: Executor?, onData: Subscription.OnData<T>, onError: Subscription.OnError?): Subscription<K, T>
}
