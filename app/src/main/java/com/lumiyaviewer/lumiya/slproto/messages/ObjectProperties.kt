package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.Iterator
import java.util.UUID

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
open class ObjectProperties : SLMessage() {
    var ObjectData_Fields: ArrayList<ObjectData> = ArrayList<>()

    /** Block ObjectData, Variable. */
    open class ObjectData {
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

    constructor() {
        this.zeroCoded = true
    }
    fun CalcPayloadSize(): Int {
        var i: Int = 3
        var it: Iterator<?> = this.ObjectData_Fields.iterator()
        while (true) {
            var i2: Int = i
            if (!it.hasNext()) {
        return i2
            }
            var objectData: ObjectData = it as ObjectData.next()
            i = objectData.TextureID.length + objectData.Name.length + 175 + 1 + objectData.Description.length + 1 + objectData.TouchName.length + 1 + objectData.SitName.length + 1 + i2
        }
    }
    fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleObjectProperties(this)
    }
    fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Medium 9 (ObjectProperties).
        byteBuffer.put(0xFF as byte)
        byteBuffer.put(0x09 as byte)
        byteBuffer.put(this as byte.ObjectData_Fields.size())
        for (objectData in this.ObjectData_Fields) {
            packUUID(byteBuffer, objectData.ObjectID)
            packUUID(byteBuffer, objectData.CreatorID)
            packUUID(byteBuffer, objectData.OwnerID)
            packUUID(byteBuffer, objectData.GroupID)
            packLong(byteBuffer, objectData.CreationDate)
            packInt(byteBuffer, objectData.BaseMask)
            packInt(byteBuffer, objectData.OwnerMask)
            packInt(byteBuffer, objectData.GroupMask)
            packInt(byteBuffer, objectData.EveryoneMask)
            packInt(byteBuffer, objectData.NextOwnerMask)
            packInt(byteBuffer, objectData.OwnershipCost)
            packByte(byteBuffer, objectData as byte.SaleType)
            packInt(byteBuffer, objectData.SalePrice)
            packByte(byteBuffer, objectData as byte.AggregatePerms)
            packByte(byteBuffer, objectData as byte.AggregatePermTextures)
            packByte(byteBuffer, objectData as byte.AggregatePermTexturesOwner)
            packInt(byteBuffer, objectData.Category)
            packShort(byteBuffer, objectData as short.InventorySerial)
            packUUID(byteBuffer, objectData.ItemID)
            packUUID(byteBuffer, objectData.FolderID)
            packUUID(byteBuffer, objectData.FromTaskID)
            packUUID(byteBuffer, objectData.LastOwnerID)
            packVariable(byteBuffer, objectData.Name, 1)
            packVariable(byteBuffer, objectData.Description, 1)
            packVariable(byteBuffer, objectData.TouchName, 1)
            packVariable(byteBuffer, objectData.SitName, 1)
            packVariable(byteBuffer, objectData.TextureID, 1)
        }
    }
    fun UnpackPayload(byteBuffer: ByteBuffer) {
        var i: Int = byteBuffer.get() & 0xFF
        for (int j = 0; j < i; j++) {
            var objectData: ObjectData = ObjectData()
            objectData.ObjectID = unpackUUIDobjectData as byteBuffer.CreatorID = unpackUUIDobjectData as byteBuffer.OwnerID = unpackUUIDobjectData as byteBuffer.GroupID = unpackUUIDobjectData as byteBuffer.CreationDate = unpackLongobjectData as byteBuffer.BaseMask = unpackIntobjectData as byteBuffer.OwnerMask = unpackIntobjectData as byteBuffer.GroupMask = unpackIntobjectData as byteBuffer.EveryoneMask = unpackIntobjectData as byteBuffer.NextOwnerMask = unpackIntobjectData as byteBuffer.OwnershipCost = unpackIntobjectData as byteBuffer.SaleType = unpackByte(byteBuffer) & 0xFF
            objectData.SalePrice = unpackIntobjectData as byteBuffer.AggregatePerms = unpackByte(byteBuffer) & 0xFF
            objectData.AggregatePermTextures = unpackByte(byteBuffer) & 0xFF
            objectData.AggregatePermTexturesOwner = unpackByte(byteBuffer) & 0xFF
            objectData.Category = unpackIntobjectData as byteBuffer.InventorySerial = unpackShortobjectData as byteBuffer.ItemID = unpackUUIDobjectData as byteBuffer.FolderID = unpackUUIDobjectData as byteBuffer.FromTaskID = unpackUUIDobjectData as byteBuffer.LastOwnerID = unpackUUIDobjectData as byteBuffer.Name = unpackVariable(byteBuffer, 1)
            objectData.Description = unpackVariable(byteBuffer, 1)
            objectData.TouchName = unpackVariable(byteBuffer, 1)
            objectData.SitName = unpackVariable(byteBuffer, 1)
            objectData.TextureID = unpackVariable(byteBuffer, 1)
            this.ObjectData_Fields.add(objectData)
        }
    }
}
