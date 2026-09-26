package com.lumiyaviewer.lumiya.render

import com.lumiyaviewer.lumiya.Debug
import java.util.Queue
import java.util.concurrent.ConcurrentLinkedQueue
import java.util.concurrent.Executor

class SynchronousExecutor : Executor {
    private val queue: Queue<Runnable> = ConcurrentLinkedQueue()

    override fun execute(runnable: Runnable) {
        queue.add(runnable)
    }

    fun runQueuedTasks() {
        while (true) {
            val task = queue.poll() ?: return
            try {
                task.run()
            } catch (e: Exception) {
                Debug.Warning(e)
            }
        }
    }
}
