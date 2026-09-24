package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * RezSingleAttachmentFromInv
 *
 * <p>Template: {@code RezSingleAttachmentFromInv Low 395 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class RezSingleAttachmentFromInv extends SLMessage {
    public AgentData AgentData_Field;
    public ObjectData ObjectData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block ObjectData, Single. */
    public static class ObjectData {
        public int AttachmentPt; // U8 - 0 for default
        public byte[] Description; // Variable 1
        public int EveryoneMask; // U32
        public int GroupMask; // U32
        public int ItemFlags; // U32
        public UUID ItemID; // LLUUID
        public byte[] Name; // Variable 1
        public int NextOwnerMask; // U32
        public UUID OwnerID; // LLUUID
    }

    public RezSingleAttachmentFromInv() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.ObjectData_Field = new ObjectData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.ObjectData_Field.Name.length + 50 + 1 + this.ObjectData_Field.Description.length + 36;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleRezSingleAttachmentFromInv(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 395 (RezSingleAttachmentFromInv).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x8B);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.ObjectData_Field.ItemID);
        packUUID(byteBuffer, this.ObjectData_Field.OwnerID);
        packByte(byteBuffer, (byte) this.ObjectData_Field.AttachmentPt);
        packInt(byteBuffer, this.ObjectData_Field.ItemFlags);
        packInt(byteBuffer, this.ObjectData_Field.GroupMask);
        packInt(byteBuffer, this.ObjectData_Field.EveryoneMask);
        packInt(byteBuffer, this.ObjectData_Field.NextOwnerMask);
        packVariable(byteBuffer, this.ObjectData_Field.Name, 1);
        packVariable(byteBuffer, this.ObjectData_Field.Description, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.ObjectData_Field.ItemID = unpackUUID(byteBuffer);
        this.ObjectData_Field.OwnerID = unpackUUID(byteBuffer);
        this.ObjectData_Field.AttachmentPt = unpackByte(byteBuffer) & 0xFF;
        this.ObjectData_Field.ItemFlags = unpackInt(byteBuffer);
        this.ObjectData_Field.GroupMask = unpackInt(byteBuffer);
        this.ObjectData_Field.EveryoneMask = unpackInt(byteBuffer);
        this.ObjectData_Field.NextOwnerMask = unpackInt(byteBuffer);
        this.ObjectData_Field.Name = unpackVariable(byteBuffer, 1);
        this.ObjectData_Field.Description = unpackVariable(byteBuffer, 1);
    }
}
