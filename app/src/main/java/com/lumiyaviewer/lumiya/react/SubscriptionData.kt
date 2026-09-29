package com.lumiyaviewer.lumiya.react

import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.ui.common.loadmon.Loadable
import java.util.LinkedList
import java.util.concurrent.Executor
import java.util.concurrent.atomic.AtomicBoolean
import java.util.concurrent.atomic.AtomicInteger
import java.util.concurrent.atomic.AtomicReference
import javax.annotation.concurrent.ThreadSafe

@ThreadSafe
class SubscriptionData<K, T> @JvmOverloads constructor(
    private val executor: Executor?,
    private val onData: Subscription.OnData<T>? = null,
    private val onError: Subscription.OnError? = null
) : Subscription.OnData<T>, Subscription.OnError, Loadable, RefreshableOne, UnsubscribableOne {

    private val lock = Any()
    private val subscription = AtomicReference<Subscription<K, T>>()
    private var data: T? = null
    private var error: Throwable? = null
    private val loadableStatusListeners = LinkedList<Loadable.LoadableStatusListener>()
    private val inLoadableListeners = AtomicBoolean(false)
    private val listenersInvokeAgain = AtomicInteger(0)

    class DataNotReadyException : Exception {
        constructor(message: String) : super(message)
        constructor(message: String, cause: Throwable) : super(message, cause)
    }

    private fun invokeLoadableListeners() {
        if (inLoadableListeners.getAndSet(true)) {
            listenersInvokeAgain.incrementAndGet()
            return
        }
        do {
            val copyOf: ImmutableList<Loadable.LoadableStatusListener>
            synchronized(lock) {
                copyOf = ImmutableList.copyOf(loadableStatusListeners)
            }
            for (listener in copyOf) {
                listener.onLoadableStatusChange(this, getLoadableStatus())
            }
        } while (listenersInvokeAgain.getAndSet(0) != 0)
        inLoadableListeners.set(false)
    }

    override fun addLoadableStatusListener(listener: Loadable.LoadableStatusListener) {
        synchronized(lock) {
            loadableStatusListeners.add(listener)
        }
    }

    @Throws(DataNotReadyException::class)
    fun assertHasData() {
        get()
    }

    @Throws(DataNotReadyException::class)
    fun get(): T {
        synchronized(lock) {
            val d = data
            if (d == null) {
                val e = error
                if (e != null) {
                    throw DataNotReadyException(e.message ?: "", e)
                }
                throw DataNotReadyException("Data not ready")
            }
            return d
        }
    }

    fun getData(): T? {
        synchronized(lock) {
            return data
        }
    }

    fun getError(): Throwable? = error

    override fun getLoadableStatus(): Loadable.Status = when {
        subscription.get() == null -> Loadable.Status.Idle
        error != null -> Loadable.Status.Error
        data != null -> Loadable.Status.Loaded
        else -> Loadable.Status.Loading
    }

    fun hasData(): Boolean {
        synchronized(lock) {
            return data != null
        }
    }

    val isSubscribed: Boolean get() = subscription.get() != null

    override fun onData(data: T) {
        synchronized(lock) {
            this.data = data
            this.error = null
        }
        onData?.onData(data)
        invokeLoadableListeners()
    }

    override fun onError(error: Throwable) {
        synchronized(lock) {
            this.data = null
            this.error = error
        }
        onError?.onError(error)
        invokeLoadableListeners()
    }

    override fun requestRefresh() {
        subscription.get()?.requestRefresh()
    }

    fun subscribe(subscribable: Subscribable<K, T>, key: K) {
        val old = subscription.getAndSet(null)
        if (old != null) {
            old.unsubscribe()
            synchronized(lock) {
                data = null
                error = null
            }
        }
        subscription.set(subscribable.subscribe(key, executor, this, this))
        invokeLoadableListeners()
    }

    override fun unsubscribe() {
        val old = subscription.getAndSet(null)
        old?.unsubscribe()
        synchronized(lock) {
            data = null
            error = null
        }
        invokeLoadableListeners()
    }
}
