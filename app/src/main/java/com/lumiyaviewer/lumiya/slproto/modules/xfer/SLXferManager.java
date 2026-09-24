package com.lumiyaviewer.lumiya.slproto.modules.xfer;

import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit;
import com.lumiyaviewer.lumiya.slproto.handler.SLMessageHandler;
import com.lumiyaviewer.lumiya.slproto.messages.SendXferPacket;
import com.lumiyaviewer.lumiya.slproto.modules.SLModule;
import com.lumiyaviewer.lumiya.slproto.modules.xfer.SLXfer;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

public class SLXferManager extends SLModule {
    private Map<String, Long> activeTransferIDs;
    private Map<Long, SLXfer> activeTransfers;
    private AtomicLong nextID;

    public SLXferManager(SLAgentCircuit agentCircuit) {
        super(agentCircuit);
        this.activeTransfers = Collections.synchronizedMap(new HashMap());
        this.activeTransferIDs = Collections.synchronizedMap(new HashMap());
        this.nextID = new AtomicLong(1L);
    }

    @SLMessageHandler
    public synchronized void HandleSendXferPacket(SendXferPacket sendXferPacket) {
        Long valueOf = Long.valueOf(sendXferPacket.XferID_Field.ID);
        SLXfer xfer = this.activeTransfers.get(valueOf);
        if (xfer != null) {
            xfer.HandleDataPacket(this, sendXferPacket);
            if (xfer.isCompleted()) {
                this.activeTransfers.remove(valueOf);
                this.activeTransferIDs.remove(xfer.getFilename());
                xfer.invokeListeners();
            }
        }
    }

    public synchronized void RequestXfer(String str, ELLPath ellPath, boolean z, SLXfer.SLXferCompletionListener xferCompletionListener, Object obj) {
        SLXfer xfer;
        Long l = this.activeTransferIDs.get(str);
        if (l != null && (xfer = this.activeTransfers.get(l)) != null) {
            xfer.addListener(xferCompletionListener, obj);
            return;
        }
        Long valueOf = Long.valueOf(this.nextID.incrementAndGet());
        this.activeTransferIDs.put(str, valueOf);
        SLXfer xfer2 = new SLXfer(valueOf.longValue(), str, ellPath, z);
        xfer2.addListener(xferCompletionListener, obj);
        this.activeTransfers.put(valueOf, xfer2);
        xfer2.StartTransfer(this);
    }
}
