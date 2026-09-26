package com.lumiyaviewer.lumiya.react

fun interface Refreshable<K> {
    fun requestUpdate(key: K)
}
