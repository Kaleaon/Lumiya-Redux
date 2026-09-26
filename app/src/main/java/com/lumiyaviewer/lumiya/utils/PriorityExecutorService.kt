package com.lumiyaviewer.lumiya.utils

import java.util.Comparator
import java.util.concurrent.BlockingQueue
import java.util.concurrent.ThreadFactory
import java.util.concurrent.ThreadPoolExecutor
import java.util.concurrent.TimeUnit

class PriorityExecutorService(
    name: String,
    numThreads: Int,
    numBins: Int,
    onExecutionCompleteListener: OnExecutionCompleteListener?
) {
    private val queue: PriorityBinQueue<Runnable> = PriorityBinQueue(numBins)
    private val exe: ThreadPoolExecutor = ExecutorWithListener(
        name, numThreads, numThreads, 10L, TimeUnit.SECONDS, queue, onExecutionCompleteListener
    )

    private class ComparePriority : Comparator<Runnable> {
        override fun compare(a: Runnable, b: Runnable): Int {
            val pa = if (a is HasPriority) a.priority else 0
            val pb = if (b is HasPriority) b.priority else 0
            return pa - pb
        }
    }

    private class ExecutorWithListener(
        name: String,
        corePoolSize: Int,
        maximumPoolSize: Int,
        keepAliveTime: Long,
        unit: TimeUnit,
        workQueue: BlockingQueue<Runnable>,
        private val onExecutionCompleteListener: OnExecutionCompleteListener?
    ) : ThreadPoolExecutor(
        corePoolSize, maximumPoolSize, keepAliveTime, unit, workQueue,
        ThreadFactory { runnable -> Thread(runnable, name) }
    ) {
        override fun afterExecute(r: Runnable?, t: Throwable?) {
            onExecutionCompleteListener?.onExecutionComplete(r, t)
        }
    }

    fun interface OnExecutionCompleteListener {
        fun onExecutionComplete(runnable: Runnable?, throwable: Throwable?)
    }

    fun cancel(runnable: Runnable) {
        queue.remove(runnable)
    }

    fun execute(runnable: Runnable) {
        exe.execute(runnable)
    }

    val numThreads: Int
        get() = exe.corePoolSize

    val numWaitingTasks: Int
        get() = exe.queue.size + exe.activeCount

    val isShutdown: Boolean
        get() = exe.isShutdown

    fun setNumThreads(numThreads: Int) {
        if (numThreads == exe.corePoolSize || numThreads <= 0) return
        exe.corePoolSize = numThreads
        exe.maximumPoolSize = numThreads
    }

    fun shutdownNow() {
        exe.shutdownNow()
    }

    fun updatePriority(runnable: Runnable) {
        queue.updatePriority(runnable)
    }
}
