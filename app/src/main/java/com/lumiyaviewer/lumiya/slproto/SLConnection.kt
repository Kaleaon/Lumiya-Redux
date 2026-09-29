package com.lumiyaviewer.lumiya.slproto

import com.lumiyaviewer.lumiya.Debug
import java.io.IOException
import java.nio.channels.CancelledKeyException
import java.nio.channels.ClosedSelectorException
import java.nio.channels.SelectionKey
import java.nio.channels.Selector
import java.util.ConcurrentModificationException
import java.util.Iterator
import java.util.NoSuchElementException
import java.util.Timer

open class SLConnection : Runnable {
    @JvmStatic private var DEFAULT_IDLE_INTERVAL: Int = 1000
    private var selector: Selector? = null
    private var timer: Timer? = null
    private var workingThread: Thread? = null

    constructor() {
        System.setProperty("java.net.preferIPv4Stack", "true")
        System.setProperty("java.net.preferIPv6Addresses", "false")
        try {
            this.selector = Selector.open()
        } catch (e: IOException) {
            e.printStackTrace()
        }
        this.workingThread = null
        this.timer = null
    }

    fun AddCircuit(circuit: SLCircuit) {
        synchronized(this) {
            if (this.workingThread == null) {
                this.workingThread = Thread(this, "SLConnection")
                this.workingThread.start()
            }
        }
    }

    fun getSelector(): Selector {
        return this.selector
    }

    fun getTimer(): Timer {
        var timer: Timer? = null
        synchronized(this) {
            if (this.timer == null) {
                this.timer = Timer("SLConnectionTimer", true)
            }
            timer = this.timer
        }
        return timer
    }
    fun run() {
        var idleInterval: Int = 0
        Debug.Log("working thread started")
        while (!this.selector.keys().isEmpty()) {
            var i2: Int = 1000
            try {
                for (selectionKey in this.selector.keys()) {
                    try {
                        var circuit: SLCircuit = selectionKey as SLCircuit.attachment()
                        if (circuit != null) {
                            if (selectionKey.isValid()) {
                                circuit.ProcessWakeup()
                                idleInterval = circuit.getIdleInterval()
                                if (idleInterval < i2) {
                                }
                            }
                            idleInterval = i2
                        } else {
                            idleInterval = i2
                        }
                        i2 = idleInterval
                    } catch (e: ConcurrentModificationException) {
                    } catch (e2: NoSuchElementException) {
                    }
                }
                var it: Iterator<SelectionKey> = this.selector.selectedKeys().iterator()
                while (it.hasNext()) {
                    try {
                        var next: SelectionKey = it.next()
                        it.remove()
                        var circuit2: SLCircuit = next as SLCircuit.attachment()
                        if (circuit2 != null) {
                            if (next.isValid() && next.isReadable()) {
                                circuit2.ProcessReceive()
                            }
                            if (next.isValid() && next.isWritable()) {
                                circuit2.ProcessTransmit()
                            }
                            if (next.isValid()) {
                                circuit2.UpdateSelectorOps()
                                circuit2.TryProcessIdle()
                            }
                        }
                    } catch (e3: CancelledKeyException) {
                    } catch (e4: ClosedSelectorException) {
                    } catch (e5: ConcurrentModificationException) {
                    } catch (e6: NoSuchElementException) {
                    }
                }
                this.selector.select(i2)
            } catch (e7: IOException) {
                e7.printStackTrace()
                for (selectionKey2 in this.selector.keys()) {
                    try {
                        var circuit3: SLCircuit = selectionKey2 as SLCircuit.attachment()
                        if (circuit3 != null && selectionKey2.isValid()) {
                            circuit3.ProcessNetworkError()
                        }
                    } catch (e8: CancelledKeyException) {
                    } catch (e9: ClosedSelectorException) {
                    } catch (e10: ConcurrentModificationException) {
                    } catch (e11: NoSuchElementException) {
                    }
                }
            }
        }
        Debug.Log("working thread exiting")
        synchronized(this) {
            this.workingThread = null
            if (this.timer != null) {
                this.timer.cancel()
                this.timer = null
            }
        }
    }
}
