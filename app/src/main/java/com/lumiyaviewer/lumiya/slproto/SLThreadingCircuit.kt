package com.lumiyaviewer.lumiya.slproto

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.auth.SLAuthReply
import java.io.IOException
import java.util.concurrent.BlockingQueue
import java.util.concurrent.Executor
import java.util.concurrent.LinkedBlockingQueue
import java.util.concurrent.TimeUnit

open class SLThreadingCircuit @Throws(IOException::class) constructor(
    sLGridConnection: SLGridConnection,
    sLCircuitInfo: SLCircuitInfo,
    sLAuthReply: SLAuthReply,
    sLCircuit: SLCircuit?
) : SLCircuit(sLGridConnection, sLCircuitInfo, sLAuthReply, sLCircuit), Executor {
    companion object {
        private const val DEFAULT_IDLE_INTERVAL: Int = 1000
    }

    private val queue: BlockingQueue<Runnable> = LinkedBlockingQueue()
    @Volatile
    private var workEnabled: Boolean = false
    private val workingRunnable: Runnable
    private val workingThread: Thread

    init {
        this.workingRunnable = Runnable {
            Debug.Printf("SLThreadingCircuit: working thread started.", *arrayOfNulls<Any>(0))
            while (this.workEnabled) {
                try {
                    val idleTimeout = getIdleInterval().toLong()
                    val runnable: Runnable? = this.queue.poll(idleTimeout, TimeUnit.MILLISECONDS)
                    if (runnable != null) {
                        runnable.run()
                    } else {
                        this.InvokeProcessIdle()
                    }
                } catch (e: InterruptedException) {
                }
            }
            Debug.Printf("SLThreadingCircuit: working thread exiting.", *arrayOfNulls<Any>(0))
        }
        this.workingThread = Thread(this.workingRunnable, "SLCircuit")
        this.workEnabled = true
        this.workingThread.start()
    }

    private fun stopThread() {
        this.workEnabled = false
        this.workingThread.interrupt()
    }

    override fun HandleMessage(message: SLMessage) {
        this.queue.offer(Runnable {
            message.Handle(this)
        })
    }

    override fun ProcessCloseCircuit() {
        stopThread()
    }

    override fun ProcessNetworkError() {
        stopThread()
    }

    override fun ProcessTimeout() {
        stopThread()
    }

    override fun execute(runnable: Runnable) {
        this.queue.offer(runnable)
    }
}
