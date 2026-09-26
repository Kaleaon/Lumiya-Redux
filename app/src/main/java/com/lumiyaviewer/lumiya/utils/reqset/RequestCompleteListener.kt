package com.lumiyaviewer.lumiya.utils.reqset

fun interface RequestCompleteListener<T> {
    fun onRequestComplete(result: T)
}
