package com.lumiyaviewer.lumiya.react

import java.util.concurrent.Executor

abstract class RequestForwarder<Kup, Tup, Kdown, Tdown>(
    requestSource: RequestSource<Kup, Tup>,
    private val subscribable: Subscribable<Kdown, Tdown>,
    private val executor: Executor?
) : RequestHandler<Kup> {

    private val resultHandler: ResultHandler<Kup, Tup> = requestSource.attachRequestHandler(this)
    private val lock = Any()
    private val subscriptions: MutableMap<Kup, DownstreamSubscription> = HashMap()

    inner class DownstreamSubscription internal constructor(
        val key: Kup,
        downstreamKey: Kdown
    ) : Subscription.OnData<Tdown>, Subscription.OnError, UnsubscribableOne {
        private val subscription: Subscription<Kdown, Tdown> =
            subscribable.subscribe(downstreamKey, executor, this, this)

        override fun onData(data: Tdown) {
            val exec = executor
            if (exec != null) {
                exec.execute { processResultInternal(key, data) }
            } else {
                processResultInternal(key, data)
            }
        }

        override fun onError(error: Throwable) {
            resultHandler.onResultError(key, error)
        }

        override fun unsubscribe() {
            subscription.unsubscribe()
        }
    }

    fun processRequestInternal(key: Kup) {
        val downstreamSubscription = DownstreamSubscription(key, getDownstreamKey(key))
        val old: DownstreamSubscription?
        synchronized(lock) {
            old = subscriptions.put(key, downstreamSubscription)
        }
        old?.unsubscribe()
    }

    fun processResultInternal(key: Kup, data: Tdown?) {
        resultHandler.onResultData(key, processResult(data))
    }

    protected abstract fun getDownstreamKey(key: Kup): Kdown

    override fun onRequest(key: Kup) {
        val exec = executor
        if (exec != null) {
            exec.execute { processRequestInternal(key) }
        } else {
            processRequestInternal(key)
        }
    }

    override fun onRequestCancelled(key: Kup) {
        val remove: DownstreamSubscription?
        synchronized(lock) {
            remove = subscriptions.remove(key)
        }
        remove?.unsubscribe()
    }

    protected abstract fun processResult(data: Tdown?): Tup
}
