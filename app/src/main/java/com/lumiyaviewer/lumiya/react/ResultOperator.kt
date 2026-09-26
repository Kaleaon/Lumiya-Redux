package com.lumiyaviewer.lumiya.react

import java.util.concurrent.Executor

abstract class ResultOperator<K, Tin, Tout> @JvmOverloads constructor(
    private val toHandler: ResultHandler<K, Tout>,
    private val executor: Executor? = null
) : ResultHandler<K, Tin> {

    protected abstract fun onData(data: Tin): Tout

    override fun onResultData(key: K, data: Tin) {
        val exec = executor
        if (exec != null) {
            exec.execute { toHandler.onResultData(key, onData(data)) }
        } else {
            toHandler.onResultData(key, onData(data))
        }
    }

    override fun onResultError(key: K, error: Throwable) {
        val exec = executor
        if (exec != null) {
            exec.execute { toHandler.onResultError(key, error) }
        } else {
            toHandler.onResultError(key, error)
        }
    }
}
