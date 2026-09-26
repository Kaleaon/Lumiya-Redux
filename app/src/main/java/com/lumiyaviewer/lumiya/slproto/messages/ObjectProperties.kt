package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
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
    @JvmField val ObjectData_Fields = ArrayList<ObjectData>()

    /** Block ObjectData, Variable. */
    open class ObjectData {
        @JvmField var AggregatePermTextures: Int = 0 // U8
        @JvmField var AggregatePermTexturesOwner: Int = 0 // U8
        @JvmField var AggregatePerms: Int = 0 // U8
        @JvmField var BaseMask: Int = 0 // U32
        @JvmField var Category: Int = 0 // U32 - LLCategory
        @JvmField var CreationDate: Long = 0L // U64
        @JvmField var CreatorID: UUID? = null // LLUUID
        @JvmField var Description: ByteArray? = null // Variable 1
        @JvmField var EveryoneMask: Int = 0 // U32
        @JvmField var FolderID: UUID? = null // LLUUID
        @JvmField var FromTaskID: UUID? = null // LLUUID
        @JvmField var GroupID: UUID? = null // LLUUID
        @JvmField var GroupMask: Int = 0 // U32
        @JvmField var InventorySerial: Int = 0 // S16
        @JvmField var ItemID: UUID? = null // LLUUID
        @JvmField var LastOwnerID: UUID? = null // LLUUID
        @JvmField var Name: ByteArray? = null // Variable 1
        @JvmField var NextOwnerMask: Int = 0 // U32
        @JvmField var ObjectID: UUID? = null // LLUUID
        @JvmField var OwnerID: UUID? = null // LLUUID
        @JvmField var OwnerMask: Int = 0 // U32
        @JvmField var OwnershipCost: Int = 0 // S32
        @JvmField var SalePrice: Int = 0 // S32
        @JvmField var SaleType: Int = 0 // U8 - > EForSale
        @JvmField var SitName: ByteArray? = null // Variable 1
        @JvmField var TextureID: ByteArray? = null // Variable 1
        @JvmField var TouchName: ByteArray? = null // Variable 1
    }

    init {
        this.zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        var i = 3
        for (entry in this.ObjectData_Fields) {
            i = entry.TextureID.size + entry.Name.size + 175 + 1 + entry.Description.size + 1 + entry.TouchName.size + 1 + entry.SitName.size + 1 + i
        }
        return i
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleObjectProperties(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Medium 9 (ObjectProperties).
        byteBuffer.put((0xFF).toByte())
        byteBuffer.put((0x09).toByte())
        byteBuffer.put((this.ObjectData_Fields.size).toByte())
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
            packByte(byteBuffer, (objectData.SaleType).toByte())
            packInt(byteBuffer, objectData.SalePrice)
            packByte(byteBuffer, (objectData.AggregatePerms).toByte())
            packByte(byteBuffer, (objectData.AggregatePermTextures).toByte())
            packByte(byteBuffer, (objectData.AggregatePermTexturesOwner).toByte())
            packInt(byteBuffer, objectData.Category)
            packShort(byteBuffer, (short) objectData.InventorySerial)
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

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        val i = byteBuffer.get().toInt() and 0xFF
        repeat(i) {
            val objectData = ObjectData()
            objectData.ObjectID = unpackUUID(byteBuffer)
            objectData.CreatorID = unpackUUID(byteBuffer)
            objectData.OwnerID = unpackUUID(byteBuffer)
            objectData.GroupID = unpackUUID(byteBuffer)
            objectData.CreationDate = unpackLong(byteBuffer)
            objectData.BaseMask = unpackInt(byteBuffer)
            objectData.OwnerMask = unpackInt(byteBuffer)
            objectData.GroupMask = unpackInt(byteBuffer)
            objectData.EveryoneMask = unpackInt(byteBuffer)
            objectData.NextOwnerMask = unpackInt(byteBuffer)
            objectData.OwnershipCost = unpackInt(byteBuffer)
            objectData.SaleType = unpackByte(byteBuffer) & 0xFF
            objectData.SalePrice = unpackInt(byteBuffer)
            objectData.AggregatePerms = unpackByte(byteBuffer) & 0xFF
            objectData.AggregatePermTextures = unpackByte(byteBuffer) & 0xFF
            objectData.AggregatePermTexturesOwner = unpackByte(byteBuffer) & 0xFF
            objectData.Category = unpackInt(byteBuffer)
            objectData.InventorySerial = unpackShort(byteBuffer)
            objectData.ItemID = unpackUUID(byteBuffer)
            objectData.FolderID = unpackUUID(byteBuffer)
            objectData.FromTaskID = unpackUUID(byteBuffer)
            objectData.LastOwnerID = unpackUUID(byteBuffer)
            objectData.Name = unpackVariable(byteBuffer, 1)
            objectData.Description = unpackVariable(byteBuffer, 1)
            objectData.TouchName = unpackVariable(byteBuffer, 1)
            objectData.SitName = unpackVariable(byteBuffer, 1)
            objectData.TextureID = unpackVariable(byteBuffer, 1)
            this.ObjectData_Fields.add(objectData)
        }
    }
}

