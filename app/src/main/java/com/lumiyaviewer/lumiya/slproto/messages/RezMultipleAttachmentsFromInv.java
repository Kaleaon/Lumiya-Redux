package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * RezMultipleAttachmentsFromInv
 *
 * <p>Template: {@code RezMultipleAttachmentsFromInv Low 396 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class RezMultipleAttachmentsFromInv extends SLMessage {
    public AgentData AgentData_Field;
    public HeaderData HeaderData_Field;
    public ArrayList<ObjectData> ObjectData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block HeaderData, Single. */
    public static class HeaderData {
        public UUID CompoundMsgID; // LLUUID - All messages a single "compound msg" must have the same id
        public boolean FirstDetachAll; // BOOL
        public int TotalObjects; // U8
    }

    /** Block ObjectData, Variable. */
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

    public RezMultipleAttachmentsFromInv() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.HeaderData_Field = new HeaderData();
    }

    @Override
    public int CalcPayloadSize() {
        int i = 55;
        Iterator<?> it = this.ObjectData_Fields.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            ObjectData objectData = (ObjectData) it.next();
            i = objectData.Description.length + objectData.Name.length + 50 + 1 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleRezMultipleAttachmentsFromInv(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 396 (RezMultipleAttachmentsFromInv).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x8C);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.HeaderData_Field.CompoundMsgID);
        packByte(byteBuffer, (byte) this.HeaderData_Field.TotalObjects);
        packBoolean(byteBuffer, this.HeaderData_Field.FirstDetachAll);
        byteBuffer.put((byte) this.ObjectData_Fields.size());
        for (ObjectData objectData : this.ObjectData_Fields) {
            packUUID(byteBuffer, objectData.ItemID);
            packUUID(byteBuffer, objectData.OwnerID);
            packByte(byteBuffer, (byte) objectData.AttachmentPt);
            packInt(byteBuffer, objectData.ItemFlags);
            packInt(byteBuffer, objectData.GroupMask);
            packInt(byteBuffer, objectData.EveryoneMask);
            packInt(byteBuffer, objectData.NextOwnerMask);
            packVariable(byteBuffer, objectData.Name, 1);
            packVariable(byteBuffer, objectData.Description, 1);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.HeaderData_Field.CompoundMsgID = unpackUUID(byteBuffer);
        this.HeaderData_Field.TotalObjects = unpackByte(byteBuffer) & 0xFF;
        this.HeaderData_Field.FirstDetachAll = unpackBoolean(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            ObjectData objectData = new ObjectData();
            objectData.ItemID = unpackUUID(byteBuffer);
            objectData.OwnerID = unpackUUID(byteBuffer);
            objectData.AttachmentPt = unpackByte(byteBuffer) & 0xFF;
            objectData.ItemFlags = unpackInt(byteBuffer);
            objectData.GroupMask = unpackInt(byteBuffer);
            objectData.EveryoneMask = unpackInt(byteBuffer);
            objectData.NextOwnerMask = unpackInt(byteBuffer);
            objectData.Name = unpackVariable(byteBuffer, 1);
            objectData.Description = unpackVariable(byteBuffer, 1);
            this.ObjectData_Fields.add(objectData);
        }
    }
}
