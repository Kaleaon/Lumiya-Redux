package com.lumiyaviewer.lumiya.res

fun interface ResourceConsumer {
    @Suppress("FunctionName")
    fun OnResourceReady(resource: Any?, success: Boolean)
}
