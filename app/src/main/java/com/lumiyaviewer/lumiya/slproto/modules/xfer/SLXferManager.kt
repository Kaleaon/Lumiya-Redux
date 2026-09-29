package com.lumiyaviewer.lumiya.slproto.modules.xfer

import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.handler.SLMessageHandler
import com.lumiyaviewer.lumiya.slproto.messages.SendXferPacket
import com.lumiyaviewer.lumiya.slproto.modules.SLModule
import java.util.Collections
import java.util.concurrent.atomic.AtomicLong

open class SLXferManager(agentCircuit: SLAgentCircuit) : SLModule(agentCircuit) {
    private val activeTransferIDs: MutableMap<String, Long> = Collections.synchronizedMap(HashMap())
    private val activeTransfers: MutableMap<Long, SLXfer> = Collections.synchronizedMap(HashMap())
    private val nextID: AtomicLong = AtomicLong(1L)

    @SLMessageHandler
    @Synchronized
    fun HandleSendXferPacket(sendXferPacket: SendXferPacket) {
        val valueOf = sendXferPacket.XferID_Field.ID
        val xfer = this.activeTransfers[valueOf]
        if (xfer != null) {
            xfer.HandleDataPacket(this, sendXferPacket)
            if (xfer.isCompleted()) {
                this.activeTransfers.remove(valueOf)
                this.activeTransferIDs.remove(xfer.getFilename())
                xfer.invokeListeners()
            }
        }
    }

    @Synchronized
    fun RequestXfer(str: String, ellPath: ELLPath, z: Boolean, xferCompletionListener: SLXfer.SLXferCompletionListener, obj: Any) {
        val l = this.activeTransferIDs[str]
        if (l != null) {
            val xfer = this.activeTransfers[l]
            if (xfer != null) {
                xfer.addListener(xferCompletionListener, obj)
                return
            }
        }
        val valueOf = this.nextID.incrementAndGet()
        this.activeTransferIDs[str] = valueOf
        val xfer2 = SLXfer(valueOf, str, ellPath, z)
        xfer2.addListener(xferCompletionListener, obj)
        this.activeTransfers[valueOf] = xfer2
        xfer2.StartTransfer(this)
    }
}
