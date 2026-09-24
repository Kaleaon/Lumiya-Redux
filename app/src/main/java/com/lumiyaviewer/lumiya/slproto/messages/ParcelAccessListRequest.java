package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * viewer -> sim
 * ParcelAccessListRequest
 *
 * <p>Template: {@code ParcelAccessListRequest Low 215 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class ParcelAccessListRequest extends SLMessage {
    public AgentData AgentData_Field;
    public Data Data_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block Data, Single. */
    public static class Data {
        public int Flags; // U32
        public int LocalID; // S32
        public int SequenceID; // S32
    }

    public ParcelAccessListRequest() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.Data_Field = new Data();
    }

    @Override
    public int CalcPayloadSize() {
        return 48;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleParcelAccessListRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 215 (ParcelAccessListRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xD7);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.Data_Field.SequenceID);
        packInt(byteBuffer, this.Data_Field.Flags);
        packInt(byteBuffer, this.Data_Field.LocalID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.Data_Field.SequenceID = unpackInt(byteBuffer);
        this.Data_Field.Flags = unpackInt(byteBuffer);
        this.Data_Field.LocalID = unpackInt(byteBuffer);
    }
}
