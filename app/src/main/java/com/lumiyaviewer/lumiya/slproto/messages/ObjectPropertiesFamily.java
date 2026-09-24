package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * ObjectPropertiesFamily
 * Medium because potentially driven by mouse hover events.
 *
 * <p>Template: {@code ObjectPropertiesFamily Medium 10 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLSelectMgr::processObjectPropertiesFamily()} in indra/newview/llselectmgr.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class ObjectPropertiesFamily extends SLMessage {
    public ObjectData ObjectData_Field;

    /** Block ObjectData, Single. */
    public static class ObjectData {
        public int BaseMask; // U32
        public int Category; // U32 - LLCategory
        public byte[] Description; // Variable 1
        public int EveryoneMask; // U32
        public UUID GroupID; // LLUUID
        public int GroupMask; // U32
        public UUID LastOwnerID; // LLUUID
        public byte[] Name; // Variable 1
        public int NextOwnerMask; // U32
        public UUID ObjectID; // LLUUID
        public UUID OwnerID; // LLUUID
        public int OwnerMask; // U32
        public int OwnershipCost; // S32
        public int RequestFlags; // U32
        public int SalePrice; // S32
        public int SaleType; // U8 - > EForSale
    }

    public ObjectPropertiesFamily() {
        this.zeroCoded = true;
        this.ObjectData_Field = new ObjectData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.ObjectData_Field.Name.length + 102 + 1 + this.ObjectData_Field.Description.length + 2;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleObjectPropertiesFamily(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Medium 10 (ObjectPropertiesFamily).
        byteBuffer.put((byte) 0xFF);
        byteBuffer.put((byte) 0x0A);
        packInt(byteBuffer, this.ObjectData_Field.RequestFlags);
        packUUID(byteBuffer, this.ObjectData_Field.ObjectID);
        packUUID(byteBuffer, this.ObjectData_Field.OwnerID);
        packUUID(byteBuffer, this.ObjectData_Field.GroupID);
        packInt(byteBuffer, this.ObjectData_Field.BaseMask);
        packInt(byteBuffer, this.ObjectData_Field.OwnerMask);
        packInt(byteBuffer, this.ObjectData_Field.GroupMask);
        packInt(byteBuffer, this.ObjectData_Field.EveryoneMask);
        packInt(byteBuffer, this.ObjectData_Field.NextOwnerMask);
        packInt(byteBuffer, this.ObjectData_Field.OwnershipCost);
        packByte(byteBuffer, (byte) this.ObjectData_Field.SaleType);
        packInt(byteBuffer, this.ObjectData_Field.SalePrice);
        packInt(byteBuffer, this.ObjectData_Field.Category);
        packUUID(byteBuffer, this.ObjectData_Field.LastOwnerID);
        packVariable(byteBuffer, this.ObjectData_Field.Name, 1);
        packVariable(byteBuffer, this.ObjectData_Field.Description, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.ObjectData_Field.RequestFlags = unpackInt(byteBuffer);
        this.ObjectData_Field.ObjectID = unpackUUID(byteBuffer);
        this.ObjectData_Field.OwnerID = unpackUUID(byteBuffer);
        this.ObjectData_Field.GroupID = unpackUUID(byteBuffer);
        this.ObjectData_Field.BaseMask = unpackInt(byteBuffer);
        this.ObjectData_Field.OwnerMask = unpackInt(byteBuffer);
        this.ObjectData_Field.GroupMask = unpackInt(byteBuffer);
        this.ObjectData_Field.EveryoneMask = unpackInt(byteBuffer);
        this.ObjectData_Field.NextOwnerMask = unpackInt(byteBuffer);
        this.ObjectData_Field.OwnershipCost = unpackInt(byteBuffer);
        this.ObjectData_Field.SaleType = unpackByte(byteBuffer) & 0xFF;
        this.ObjectData_Field.SalePrice = unpackInt(byteBuffer);
        this.ObjectData_Field.Category = unpackInt(byteBuffer);
        this.ObjectData_Field.LastOwnerID = unpackUUID(byteBuffer);
        this.ObjectData_Field.Name = unpackVariable(byteBuffer, 1);
        this.ObjectData_Field.Description = unpackVariable(byteBuffer, 1);
    }
}
