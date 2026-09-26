package com.lumiyaviewer.lumiya.react

fun interface DisposeHandler<T> {
    fun onDispose(value: T)
}
