package com.lumiyaviewer.lumiya.slproto

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.auth.SLAuthReply
import java.io.IOException
import java.util.concurrent.BlockingQueue
import java.util.concurrent.Executor
import java.util.concurrent.LinkedBlockingQueue
import java.util.concurrent.TimeUnit

open class SLThreadingCircuit : SLCircuit(), Executor {
    @JvmStatic private var DEFAULT_IDLE_INTERVAL: Int = 1000
    private var queue: BlockingQueue<Runnable> = null
    private var workEnabled: Boolean = false
    private var workingRunnable: Runnable = null
    private var workingThread: Thread = null

    public SLThreadingCircuit(SLGridConnection sLGridConnection, SLCircuitInfo sLCircuitInfo, SLAuthReply sLAuthReply, SLCircuit sLCircuit) throws IOException {
        super(sLGridConnection, sLCircuitInfo, sLAuthReply, sLCircuit)
        this.workingRunnable = Runnable() {
            fun run() {
                Debug.Printf("SLThreadingCircuit: working thread started.", arrayOfNulls<Object>(0))
                while (SLThreadingCircuit.this.workEnabled) {
                    try {
                        var runnable: Runnable = SLThreadingCircuit as Runnable.this.queue.poll(1000L, TimeUnit.MILLISECONDS)
                        if (runnable != null) {
                            runnable.run()
                        } else {
                            SLThreadingCircuit.this.InvokeProcessIdle()
                        }
                    } catch (e: InterruptedException) {
                    }
                }
                Debug.Printf("SLThreadingCircuit: working thread exiting.", arrayOfNulls<Object>(0))
            }
        }
        this.workingThread = Thread(this.workingRunnable, "SLCircuit")
        this.queue = LinkedBlockingQueue()
        this.workEnabled = true
        this.workingThread.start()
    }

    private fun stopThread() {
        this.workEnabled = false
        this.workingThread.interrupt()
    }
    fun HandleMessage(sLMessage: final SLMessage) {
        this.queue.offer(Runnable() {
            private /* synthetic */ void $m$0() {
                SLThreadingCircuit.this.m146lambda$com_lumiyaviewer_lumiya_slproto_SLThreadingCircuit_1833(sLMessage as SLMessage)
            }
            fun run() {
                $m$0()
            }
        })
    }
    fun ProcessCloseCircuit() {
        stopThread()
    }
    fun ProcessNetworkError() {
        stopThread()
    }
    fun ProcessTimeout() {
        stopThread()
    }
    fun execute(runnable: Runnable) {
        this.queue.offer(runnable)
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_SLThreadingCircuit_1833, reason: not valid java name */
    /* synthetic */ void m146lambda$com_lumiyaviewer_lumiya_slproto_SLThreadingCircuit_1833(SLMessage sLMessage) {
        sLMessage.Handle(this)
    }
}
