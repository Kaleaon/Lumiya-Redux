package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * ParcelGodForceOwner Unencoded
 *
 * <p>Template: {@code ParcelGodForceOwner Low 214 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class ParcelGodForceOwner extends SLMessage {
    public AgentData AgentData_Field;
    public Data Data_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block Data, Single. */
    public static class Data {
        public int LocalID; // S32 - parcel ID
        public UUID OwnerID; // LLUUID
    }

    public ParcelGodForceOwner() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.Data_Field = new Data();
    }

    @Override
    public int CalcPayloadSize() {
        return 56;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleParcelGodForceOwner(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 214 (ParcelGodForceOwner).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xD6);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.Data_Field.OwnerID);
        packInt(byteBuffer, this.Data_Field.LocalID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.Data_Field.OwnerID = unpackUUID(byteBuffer);
        this.Data_Field.LocalID = unpackInt(byteBuffer);
    }
}
