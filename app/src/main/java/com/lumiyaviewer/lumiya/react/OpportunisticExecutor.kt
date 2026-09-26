package com.lumiyaviewer.lumiya.react

import com.lumiyaviewer.lumiya.Debug
import java.util.LinkedList
import java.util.concurrent.Executor
import java.util.concurrent.locks.ReentrantLock

class OpportunisticExecutor(name: String) : Executor {
    private val queue: LinkedList<Runnable> = LinkedList()
    private val lock = ReentrantLock()
    private val notEmpty = lock.newCondition()
    private val runOnceRunnables: MutableSet<Runnable> = HashSet()

    private val worker = Runnable {
        while (true) {
            val runnable: Runnable
            try {
                lock.lock()
                try {
                    var r = queue.poll()
                    if (r == null && runOnceRunnables.isNotEmpty()) {
                        val it = runOnceRunnables.iterator()
                        if (it.hasNext()) {
                            r = it.next()
                            it.remove()
                        }
                    }
                    while (r == null) {
                        notEmpty.await()
                        r = queue.poll()
                    }
                    runnable = r
                } catch (e: InterruptedException) {
                    Thread.currentThread().interrupt()
                    return@Runnable
                } finally {
                    lock.unlock()
                }
                try {
                    runnable.run()
                } catch (e: Exception) {
                    Debug.Warning(e)
                }
            } catch (e: Exception) {
                Debug.Warning(e)
            }
        }
    }

    private val thread: Thread = Thread(worker, name).also { it.start() }

    inner class RunOnceExecutor internal constructor() : Executor {
        override fun execute(runnable: Runnable) {
            try {
                lock.lock()
                runOnceRunnables.add(runnable)
                notEmpty.signalAll()
            } finally {
                lock.unlock()
            }
        }
    }

    override fun execute(runnable: Runnable) {
        try {
            lock.lock()
            if (Thread.currentThread().id == thread.id && queue.isEmpty()) {
                lock.unlock()
                try {
                    runnable.run()
                } catch (e: Exception) {
                    Debug.Warning(e)
                }
                lock.lock()
            } else {
                queue.offer(runnable)
                notEmpty.signalAll()
            }
        } finally {
            lock.unlock()
        }
    }

    fun getRunOnceExecutor(): RunOnceExecutor = RunOnceExecutor()
}
