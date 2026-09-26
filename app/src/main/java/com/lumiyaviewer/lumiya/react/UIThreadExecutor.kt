package com.lumiyaviewer.lumiya.react

import android.os.Handler
import android.os.Looper
import com.lumiyaviewer.lumiya.Debug
import java.util.concurrent.ConcurrentLinkedQueue
import java.util.concurrent.Executor
import java.util.concurrent.atomic.AtomicBoolean
import java.util.concurrent.locks.ReentrantLock

class UIThreadExecutor : Executor {
    private val lock = ReentrantLock()
    private val runnablePosted = AtomicBoolean(false)
    private val mainLooper: Looper = Looper.getMainLooper()
    private val handler = Handler(mainLooper)
    private val queue = ConcurrentLinkedQueue<Runnable>()

    private val queueRunnable = Runnable {
        try {
            lock.lock()
            runnablePosted.set(false)
            while (true) {
                val runnable = queue.poll() ?: return@Runnable
                try {
                    lock.unlock()
                    try {
                        runnable.run()
                    } catch (e: Exception) {
                        Debug.Warning(e)
                    }
                } finally {
                    lock.lock()
                }
            }
        } finally {
            lock.unlock()
        }
    }

    private val serialExecutor = Executor { runnable ->
        try {
            lock.lock()
            queue.add(runnable)
            if (!runnablePosted.getAndSet(true)) {
                handler.post(queueRunnable)
            }
        } finally {
            lock.unlock()
        }
    }

    private object InstanceHolder {
        @JvmField
        val Instance = UIThreadExecutor()
    }

    companion object {
        @JvmStatic
        fun getInstance(): Executor = InstanceHolder.Instance

        @JvmStatic
        fun getSerialInstance(): Executor = InstanceHolder.Instance.serialExecutor
    }

    override fun execute(runnable: Runnable) {
        try {
            lock.lock()
            if (Looper.myLooper() == mainLooper && queue.isEmpty()) {
                try {
                    lock.unlock()
                    try {
                        runnable.run()
                    } catch (e: Exception) {
                        Debug.Warning(e)
                    }
                } finally {
                    lock.lock()
                }
            } else {
                queue.add(runnable)
                if (!runnablePosted.getAndSet(true)) {
                    handler.post(queueRunnable)
                }
            }
        } finally {
            lock.unlock()
        }
    }
}
