package com.lumiyaviewer.lumiya.react

fun interface Unsubscribable<K, T> {
    fun unsubscribe(subscription: Subscription<K, T>)
}
