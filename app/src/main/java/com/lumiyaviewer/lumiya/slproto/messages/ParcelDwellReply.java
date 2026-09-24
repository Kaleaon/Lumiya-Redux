package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * dataserver -> sim -> viewer
 * reliable
 *
 * <p>Template: {@code ParcelDwellReply Low 219 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLViewerParcelMgr::processParcelDwellReply()} in indra/newview/llviewerparcelmgr.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class ParcelDwellReply extends SLMessage {
    public AgentData AgentData_Field;
    public Data Data_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
    }

    /** Block Data, Single. */
    public static class Data {
        public float Dwell; // F32
        public int LocalID; // S32
        public UUID ParcelID; // LLUUID
    }

    public ParcelDwellReply() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.Data_Field = new Data();
    }

    @Override
    public int CalcPayloadSize() {
        return 44;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleParcelDwellReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 219 (ParcelDwellReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xDB);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packInt(byteBuffer, this.Data_Field.LocalID);
        packUUID(byteBuffer, this.Data_Field.ParcelID);
        packFloat(byteBuffer, this.Data_Field.Dwell);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.Data_Field.LocalID = unpackInt(byteBuffer);
        this.Data_Field.ParcelID = unpackUUID(byteBuffer);
        this.Data_Field.Dwell = unpackFloat(byteBuffer);
    }
}
