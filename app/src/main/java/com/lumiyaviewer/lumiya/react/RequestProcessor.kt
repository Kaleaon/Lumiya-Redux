package com.lumiyaviewer.lumiya.react

import java.util.concurrent.Executor

abstract class RequestProcessor<K, Tup, Tdown>(
    requestSource: RequestSource<K, Tup>,
    private val executor: Executor?
) : RequestHandler<K>, RequestSource<K, Tdown>, ResultHandler<K, Tdown>, Refreshable<K> {

    private val resultHandler: ResultHandler<K, Tup> = requestSource.attachRequestHandler(this)
    private var requestHandler: RequestHandler<K>? = null

    fun processRequestInternal(key: K) {
        val result = processRequest(key)
        if (result != null) {
            resultHandler.onResultData(key, result)
        }
        if (isRequestComplete(key, result) || requestHandler == null) {
            return
        }
        requestHandler!!.onRequest(key)
    }

    fun requestUpdateInternal(key: K) {
        requestHandler?.onRequest(key)
    }

    override fun attachRequestHandler(requestHandler: RequestHandler<K>): ResultHandler<K, Tdown> {
        this.requestHandler = requestHandler
        return this
    }

    override fun detachRequestHandler(requestHandler: RequestHandler<K>) {
        if (this.requestHandler === requestHandler) {
            this.requestHandler = null
        }
    }

    protected open fun isRequestComplete(key: K, result: Tup?): Boolean = result != null

    override fun onRequest(key: K) {
        val exec = executor
        if (exec != null) {
            exec.execute { processRequestInternal(key) }
        } else {
            processRequestInternal(key)
        }
    }

    override fun onRequestCancelled(key: K) {
        requestHandler?.onRequestCancelled(key)
    }

    override fun onResultData(key: K, data: Tdown) {
        val exec = executor
        if (exec != null) {
            exec.execute { resultHandler.onResultData(key, processResult(key, data)) }
        } else {
            resultHandler.onResultData(key, processResult(key, data))
        }
    }

    override fun onResultError(key: K, error: Throwable) {
        resultHandler.onResultError(key, error)
    }

    protected abstract fun processRequest(key: K): Tup?

    protected abstract fun processResult(key: K, data: Tdown): Tup

    override fun requestUpdate(key: K) {
        val exec = executor
        if (exec != null) {
            exec.execute { requestUpdateInternal(key) }
        } else {
            requestUpdateInternal(key)
        }
    }
}
