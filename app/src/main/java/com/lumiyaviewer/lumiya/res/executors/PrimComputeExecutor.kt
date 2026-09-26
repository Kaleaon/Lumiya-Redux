package com.lumiyaviewer.lumiya.res.executors

import java.util.concurrent.locks.ReentrantLock

class PrimComputeExecutor private constructor() : WeakExecutor("PrimCompute", 1) {
    private val pauseLock = ReentrantLock()
    private val unpaused = pauseLock.newCondition()
    private var isPaused = false

    private object InstanceHolder {
        @JvmField
        val Instance = PrimComputeExecutor()
    }

    companion object {
        @JvmStatic
        fun getInstance(): PrimComputeExecutor = InstanceHolder.Instance
    }

    override fun beforeExecute(thread: Thread, runnable: Runnable) {
        super.beforeExecute(thread, runnable)
        pauseLock.lock()
        try {
            while (isPaused) {
                try {
                    unpaused.await()
                } catch (e: InterruptedException) {
                    thread.interrupt()
                    return
                }
            }
        } finally {
            pauseLock.unlock()
        }
    }

    fun pause() {
        pauseLock.lock()
        try {
            isPaused = true
        } finally {
            pauseLock.unlock()
        }
    }

    fun resume() {
        pauseLock.lock()
        try {
            isPaused = false
            unpaused.signalAll()
        } finally {
            pauseLock.unlock()
        }
    }
}
