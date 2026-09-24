package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * ParcelDeedToGroup - deed a patch of land to a group
 * viewer -> sim
 * reliable
 *
 * <p>Template: {@code ParcelDeedToGroup Low 207 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class ParcelDeedToGroup extends SLMessage {
    public AgentData AgentData_Field;
    public Data Data_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block Data, Single. */
    public static class Data {
        public UUID GroupID; // LLUUID
        public int LocalID; // S32 - parcel id
    }

    public ParcelDeedToGroup() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.Data_Field = new Data();
    }

    @Override
    public int CalcPayloadSize() {
        return 56;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleParcelDeedToGroup(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 207 (ParcelDeedToGroup).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xCF);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.Data_Field.GroupID);
        packInt(byteBuffer, this.Data_Field.LocalID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.Data_Field.GroupID = unpackUUID(byteBuffer);
        this.Data_Field.LocalID = unpackInt(byteBuffer);
    }
}
