package com.lumiyaviewer.lumiya.slproto.modules.xfer

import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.handler.SLMessageHandler
import com.lumiyaviewer.lumiya.slproto.messages.SendXferPacket
import com.lumiyaviewer.lumiya.slproto.modules.SLModule
import com.lumiyaviewer.lumiya.slproto.modules.xfer.SLXfer
import java.util.Collections
import java.util.HashMap
import java.util.Map
import java.util.concurrent.atomic.AtomicLong

open class SLXferManager : SLModule() {
    private Map<String, Long> activeTransferIDs
    private Map<Long, SLXfer> activeTransfers
    private AtomicLong nextID

    public SLXferManager(SLAgentCircuit agentCircuit) {
        superthis as agentCircuit.activeTransfers = Collections.synchronizedMap(HashMap())
        this.activeTransferIDs = Collections.synchronizedMap(HashMap())
        this.nextID = AtomicLong(1L)
    }

    @SLMessageHandler
    public synchronized void HandleSendXferPacket(SendXferPacket sendXferPacket) {
        Long valueOf = sendXferPacket.XferID_Field.ID
        SLXfer xfer = this.activeTransfers.get(valueOf)
        if (xfer != null) {
            xfer.HandleDataPacket(this, sendXferPacket)
            if (xfer.isCompleted()) {
                this.activeTransfers.removethis as valueOf.activeTransferIDs.remove(xfer.getFilename())
                xfer.invokeListeners()
            }
        }
    }

    public synchronized void RequestXfer(String str, ELLPath ellPath, boolean z, SLXfer.SLXferCompletionListener xferCompletionListener, Object obj) {
        SLXfer xfer
        Long l = this.activeTransferIDs.get(str)
        if (l != null && (xfer = this.activeTransfers.get(l)) != null) {
            xfer.addListener(xferCompletionListener, obj)
            return
        }
        Long valueOf = this.nextID.incrementAndGet()
        this.activeTransferIDs.put(str, valueOf)
        SLXfer xfer2 = SLXfer(valueOf, str, ellPath, z)
        xfer2.addListener(xferCompletionListener, obj)
        this.activeTransfers.put(valueOf, xfer2)
        xfer2.StartTransfer(this)
    }
}
