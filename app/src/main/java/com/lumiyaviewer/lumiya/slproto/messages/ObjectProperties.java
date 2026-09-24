package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * ObjectProperties
 * Extended information such as creator, permissions, etc.
 * Medium because potentially driven by mouse hover events.
 *
 * <p>Template: {@code ObjectProperties Medium 9 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLSelectMgr::processObjectProperties()} in indra/newview/llselectmgr.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class ObjectProperties extends SLMessage {
    public ArrayList<ObjectData> ObjectData_Fields = new ArrayList<>();

    /** Block ObjectData, Variable. */
    public static class ObjectData {
        public int AggregatePermTextures; // U8
        public int AggregatePermTexturesOwner; // U8
        public int AggregatePerms; // U8
        public int BaseMask; // U32
        public int Category; // U32 - LLCategory
        public long CreationDate; // U64
        public UUID CreatorID; // LLUUID
        public byte[] Description; // Variable 1
        public int EveryoneMask; // U32
        public UUID FolderID; // LLUUID
        public UUID FromTaskID; // LLUUID
        public UUID GroupID; // LLUUID
        public int GroupMask; // U32
        public int InventorySerial; // S16
        public UUID ItemID; // LLUUID
        public UUID LastOwnerID; // LLUUID
        public byte[] Name; // Variable 1
        public int NextOwnerMask; // U32
        public UUID ObjectID; // LLUUID
        public UUID OwnerID; // LLUUID
        public int OwnerMask; // U32
        public int OwnershipCost; // S32
        public int SalePrice; // S32
        public int SaleType; // U8 - > EForSale
        public byte[] SitName; // Variable 1
        public byte[] TextureID; // Variable 1
        public byte[] TouchName; // Variable 1
    }

    public ObjectProperties() {
        this.zeroCoded = true;
    }

    @Override
    public int CalcPayloadSize() {
        int i = 3;
        Iterator<?> it = this.ObjectData_Fields.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            ObjectData objectData = (ObjectData) it.next();
            i = objectData.TextureID.length + objectData.Name.length + 175 + 1 + objectData.Description.length + 1 + objectData.TouchName.length + 1 + objectData.SitName.length + 1 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleObjectProperties(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Medium 9 (ObjectProperties).
        byteBuffer.put((byte) 0xFF);
        byteBuffer.put((byte) 0x09);
        byteBuffer.put((byte) this.ObjectData_Fields.size());
        for (ObjectData objectData : this.ObjectData_Fields) {
            packUUID(byteBuffer, objectData.ObjectID);
            packUUID(byteBuffer, objectData.CreatorID);
            packUUID(byteBuffer, objectData.OwnerID);
            packUUID(byteBuffer, objectData.GroupID);
            packLong(byteBuffer, objectData.CreationDate);
            packInt(byteBuffer, objectData.BaseMask);
            packInt(byteBuffer, objectData.OwnerMask);
            packInt(byteBuffer, objectData.GroupMask);
            packInt(byteBuffer, objectData.EveryoneMask);
            packInt(byteBuffer, objectData.NextOwnerMask);
            packInt(byteBuffer, objectData.OwnershipCost);
            packByte(byteBuffer, (byte) objectData.SaleType);
            packInt(byteBuffer, objectData.SalePrice);
            packByte(byteBuffer, (byte) objectData.AggregatePerms);
            packByte(byteBuffer, (byte) objectData.AggregatePermTextures);
            packByte(byteBuffer, (byte) objectData.AggregatePermTexturesOwner);
            packInt(byteBuffer, objectData.Category);
            packShort(byteBuffer, (short) objectData.InventorySerial);
            packUUID(byteBuffer, objectData.ItemID);
            packUUID(byteBuffer, objectData.FolderID);
            packUUID(byteBuffer, objectData.FromTaskID);
            packUUID(byteBuffer, objectData.LastOwnerID);
            packVariable(byteBuffer, objectData.Name, 1);
            packVariable(byteBuffer, objectData.Description, 1);
            packVariable(byteBuffer, objectData.TouchName, 1);
            packVariable(byteBuffer, objectData.SitName, 1);
            packVariable(byteBuffer, objectData.TextureID, 1);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            ObjectData objectData = new ObjectData();
            objectData.ObjectID = unpackUUID(byteBuffer);
            objectData.CreatorID = unpackUUID(byteBuffer);
            objectData.OwnerID = unpackUUID(byteBuffer);
            objectData.GroupID = unpackUUID(byteBuffer);
            objectData.CreationDate = unpackLong(byteBuffer);
            objectData.BaseMask = unpackInt(byteBuffer);
            objectData.OwnerMask = unpackInt(byteBuffer);
            objectData.GroupMask = unpackInt(byteBuffer);
            objectData.EveryoneMask = unpackInt(byteBuffer);
            objectData.NextOwnerMask = unpackInt(byteBuffer);
            objectData.OwnershipCost = unpackInt(byteBuffer);
            objectData.SaleType = unpackByte(byteBuffer) & 0xFF;
            objectData.SalePrice = unpackInt(byteBuffer);
            objectData.AggregatePerms = unpackByte(byteBuffer) & 0xFF;
            objectData.AggregatePermTextures = unpackByte(byteBuffer) & 0xFF;
            objectData.AggregatePermTexturesOwner = unpackByte(byteBuffer) & 0xFF;
            objectData.Category = unpackInt(byteBuffer);
            objectData.InventorySerial = unpackShort(byteBuffer);
            objectData.ItemID = unpackUUID(byteBuffer);
            objectData.FolderID = unpackUUID(byteBuffer);
            objectData.FromTaskID = unpackUUID(byteBuffer);
            objectData.LastOwnerID = unpackUUID(byteBuffer);
            objectData.Name = unpackVariable(byteBuffer, 1);
            objectData.Description = unpackVariable(byteBuffer, 1);
            objectData.TouchName = unpackVariable(byteBuffer, 1);
            objectData.SitName = unpackVariable(byteBuffer, 1);
            objectData.TextureID = unpackVariable(byteBuffer, 1);
            this.ObjectData_Fields.add(objectData);
        }
    }
}
