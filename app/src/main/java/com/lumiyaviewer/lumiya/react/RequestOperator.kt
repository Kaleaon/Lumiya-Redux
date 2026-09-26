package com.lumiyaviewer.lumiya.react

import java.util.concurrent.Executor

abstract class RequestOperator<K, T> @JvmOverloads constructor(
    private val toHandler: RequestHandler<K>,
    private val resultHandler: ResultHandler<K, T>,
    private val executor: Executor? = null
) : RequestHandler<K> {

    override fun onRequest(key: K) {
        val exec = executor
        if (exec != null) {
            exec.execute {
                val result = processRequest(key)
                if (result != null) {
                    resultHandler.onResultData(key, result)
                } else {
                    toHandler.onRequest(key)
                }
            }
            return
        }
        val result = processRequest(key)
        if (result != null) {
            resultHandler.onResultData(key, result)
        } else {
            toHandler.onRequest(key)
        }
    }

    override fun onRequestCancelled(key: K) {
        val exec = executor
        if (exec != null) {
            exec.execute { toHandler.onRequestCancelled(key) }
        } else {
            toHandler.onRequestCancelled(key)
        }
    }

    protected abstract fun processRequest(key: K): T?
}
