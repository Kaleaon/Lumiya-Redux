package com.lumiyaviewer.lumiya.res.executors

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.res.collections.WeakQueue
import com.lumiyaviewer.lumiya.utils.HasPriority
import java.lang.ref.WeakReference
import java.util.concurrent.BlockingQueue
import java.util.concurrent.Callable
import java.util.concurrent.FutureTask
import java.util.concurrent.RunnableFuture
import java.util.concurrent.ThreadPoolExecutor
import java.util.concurrent.TimeUnit

open class WeakExecutor : ThreadPoolExecutor {

    private val usePriorities: Boolean

    private class ComparableFutureTask<T> : FutureTask<T>, Comparable<ComparableFutureTask<T>> {
        private val priority: Int

        private class WeakCallable<T>(callable: Callable<T>) : Callable<T> {
            private val callableRef = WeakReference(callable)

            override fun call(): T? {
                return callableRef.get()?.call()
            }
        }

        private class WeakRunnable(runnable: Runnable) : Runnable {
            private val runnableRef = WeakReference(runnable)

            override fun run() {
                runnableRef.get()?.run()
            }
        }

        constructor(runnable: Runnable, result: T) : super(WeakRunnable(runnable), result) {
            priority = if (runnable is HasPriority) runnable.priority else 0
        }

        constructor(callable: Callable<T>) : super(WeakCallable(callable)) {
            priority = if (callable is HasPriority) callable.priority else 0
        }

        override fun compareTo(other: ComparableFutureTask<T>): Int {
            if (other === this) return 0
            return priority - other.priority
        }
    }

    internal constructor(name: String, threads: Int) : super(
        threads, threads, 60L, TimeUnit.SECONDS,
        WeakQueue(),
        { runnable ->
            Thread(runnable, name).also {
                Debug.Printf("Creating thread %s got %d", name, it.id)
                it.priority = 4
            }
        }
    ) {
        usePriorities = false
        Debug.Printf("Executor for %s: maxThreads %d", name, threads)
        allowCoreThreadTimeOut(true)
    }

    constructor(name: String, threads: Int, blockingQueue: BlockingQueue<Runnable>) : super(
        threads, threads, 60L, TimeUnit.SECONDS,
        blockingQueue,
        { runnable ->
            Thread(runnable, name).also {
                Debug.Printf("Creating thread %s got %d", name, it.id)
                it.priority = 4
            }
        }
    ) {
        usePriorities = true
        Debug.Printf("Executor for %s: maxThreads %d", name, threads)
        allowCoreThreadTimeOut(true)
    }

    override fun <T> newTaskFor(runnable: Runnable, value: T): RunnableFuture<T> {
        return if (usePriorities) ComparableFutureTask(runnable, value) else super.newTaskFor(runnable, value)
    }

    override fun <T> newTaskFor(callable: Callable<T>): RunnableFuture<T> {
        return if (usePriorities) ComparableFutureTask(callable) else super.newTaskFor(callable)
    }
}
