package com.lumiyaviewer.lumiya.react

import java.util.concurrent.Executor

abstract class RequestFinalProcessor<K, T>(
    requestSource: RequestSource<K, T>,
    private val executor: Executor?
) : RequestHandler<K> {

    private val resultHandler: ResultHandler<K, T> = requestSource.attachRequestHandler(this)

    open fun cancelRequest(key: K) {}

    override fun onRequest(key: K) {
        val exec = executor
        if (exec != null) {
            exec.execute {
                try {
                    resultHandler.onResultData(key, processRequest(key))
                } catch (th: Throwable) {
                    resultHandler.onResultError(key, th)
                }
            }
            return
        }
        try {
            resultHandler.onResultData(key, processRequest(key))
        } catch (th: Throwable) {
            resultHandler.onResultError(key, th)
        }
    }

    override fun onRequestCancelled(key: K) {
        val exec = executor
        if (exec != null) {
            exec.execute { cancelRequest(key) }
        } else {
            cancelRequest(key)
        }
    }

    @Throws(Throwable::class)
    protected abstract fun processRequest(key: K): T
}
