package com.lumiyaviewer.lumiya.res.executors

import com.lumiyaviewer.lumiya.res.collections.WeakQueue
import java.util.Collections
import java.util.IdentityHashMap

class StartingExecutor @JvmOverloads constructor(
    private var maxConcurrentRequests: Int = 1
) {
    private val waitingRequests: WeakQueue<Startable> = WeakQueue()
    private val activeRequests: MutableSet<Startable> = Collections.newSetFromMap(IdentityHashMap())
    private val lock = Any()

    @Volatile
    private var paused = false

    private fun runQueue() {
        while (!paused) {
            val startable: Startable
            synchronized(lock) {
                if (activeRequests.size >= maxConcurrentRequests) return
                startable = waitingRequests.poll() ?: return
                activeRequests.add(startable)
            }
            startable.start()
        }
    }

    fun cancelRequest(startable: Startable) {
        synchronized(lock) {
            waitingRequests.remove(startable)
            activeRequests.remove(startable)
        }
        runQueue()
    }

    fun completeRequest(startable: Startable) {
        synchronized(lock) {
            activeRequests.remove(startable)
        }
        runQueue()
    }

    fun pause() {
        paused = true
    }

    fun queueRequest(startable: Startable) {
        synchronized(lock) {
            waitingRequests.add(startable)
        }
        runQueue()
    }

    fun setMaxConcurrentTasks(max: Int) {
        maxConcurrentRequests = max
    }

    fun unpause() {
        paused = false
        runQueue()
    }
}
