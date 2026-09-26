package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * For sim to request update/create.
 * DO NOT ALLOW THIS FROM THE VIEWER.
 *
 * <p>Template: {@code UpdateCreateInventoryItem Low 267 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code processUpdateCreateInventoryItem()} in indra/newview/llinventorymodel.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class UpdateCreateInventoryItem : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val InventoryData_Fields = ArrayList<InventoryData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null // LLUUID
        @JvmField var SimApproved: Boolean = false // BOOL
        @JvmField var TransactionID: UUID? = null // LLUUID
    }

    /** Block InventoryData, Variable. */
    open class InventoryData {
        @JvmField var AssetID: UUID? = null // LLUUID
        @JvmField var BaseMask: Int = 0 // U32 - permissions
        @JvmField var CRC: Int = 0 // U32
        @JvmField var CallbackID: Int = 0 // U32 - Async Response
        @JvmField var CreationDate: Int = 0 // S32
        @JvmField var CreatorID: UUID? = null // LLUUID - permissions
        @JvmField var Description: ByteArray? = null // Variable 1
        @JvmField var EveryoneMask: Int = 0 // U32 - permissions
        @JvmField var Flags: Int = 0 // U32
        @JvmField var FolderID: UUID? = null // LLUUID
        @JvmField var GroupID: UUID? = null // LLUUID - permissions
        @JvmField var GroupMask: Int = 0 // U32 - permissions
        @JvmField var GroupOwned: Boolean = false // BOOL - permissions
        @JvmField var InvType: Int = 0 // S8
        @JvmField var ItemID: UUID? = null // LLUUID
        @JvmField var Name: ByteArray? = null // Variable 1
        @JvmField var NextOwnerMask: Int = 0 // U32 - permissions
        @JvmField var OwnerID: UUID? = null // LLUUID - permissions
        @JvmField var OwnerMask: Int = 0 // U32 - permissions
        @JvmField var SalePrice: Int = 0 // S32
        @JvmField var SaleType: Int = 0 // U8
        @JvmField var Type: Int = 0 // S8
    }

    init {
        this.zeroCoded = true
        this.AgentData_Field = AgentData()
    }

    override fun CalcPayloadSize(): Int {
        var i = 38
        for (entry in this.InventoryData_Fields) {
            i = entry.Description.size + entry.Name.size + 133 + 1 + 4 + 4 + i
        }
        return i
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleUpdateCreateInventoryItem(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 267 (UpdateCreateInventoryItem).
        byteBuffer.putShort((short) 0xFFFF)
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x0B).toByte())
        packUUID(byteBuffer, this.AgentData_Field.AgentID)
        packBoolean(byteBuffer, this.AgentData_Field.SimApproved)
        packUUID(byteBuffer, this.AgentData_Field.TransactionID)
        byteBuffer.put((this.InventoryData_Fields.size).toByte())
        for (inventoryData in this.InventoryData_Fields) {
            packUUID(byteBuffer, inventoryData.ItemID)
            packUUID(byteBuffer, inventoryData.FolderID)
            packInt(byteBuffer, inventoryData.CallbackID)
            packUUID(byteBuffer, inventoryData.CreatorID)
            packUUID(byteBuffer, inventoryData.OwnerID)
            packUUID(byteBuffer, inventoryData.GroupID)
            packInt(byteBuffer, inventoryData.BaseMask)
            packInt(byteBuffer, inventoryData.OwnerMask)
            packInt(byteBuffer, inventoryData.GroupMask)
            packInt(byteBuffer, inventoryData.EveryoneMask)
            packInt(byteBuffer, inventoryData.NextOwnerMask)
            packBoolean(byteBuffer, inventoryData.GroupOwned)
            packUUID(byteBuffer, inventoryData.AssetID)
            packByte(byteBuffer, (inventoryData.Type).toByte())
            packByte(byteBuffer, (inventoryData.InvType).toByte())
            packInt(byteBuffer, inventoryData.Flags)
            packByte(byteBuffer, (inventoryData.SaleType).toByte())
            packInt(byteBuffer, inventoryData.SalePrice)
            packVariable(byteBuffer, inventoryData.Name, 1)
            packVariable(byteBuffer, inventoryData.Description, 1)
            packInt(byteBuffer, inventoryData.CreationDate)
            packInt(byteBuffer, inventoryData.CRC)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer)
        this.AgentData_Field.SimApproved = unpackBoolean(byteBuffer)
        this.AgentData_Field.TransactionID = unpackUUID(byteBuffer)
        val i = byteBuffer.get().toInt() and 0xFF
        repeat(i) {
            val inventoryData = InventoryData()
            inventoryData.ItemID = unpackUUID(byteBuffer)
            inventoryData.FolderID = unpackUUID(byteBuffer)
            inventoryData.CallbackID = unpackInt(byteBuffer)
            inventoryData.CreatorID = unpackUUID(byteBuffer)
            inventoryData.OwnerID = unpackUUID(byteBuffer)
            inventoryData.GroupID = unpackUUID(byteBuffer)
            inventoryData.BaseMask = unpackInt(byteBuffer)
            inventoryData.OwnerMask = unpackInt(byteBuffer)
            inventoryData.GroupMask = unpackInt(byteBuffer)
            inventoryData.EveryoneMask = unpackInt(byteBuffer)
            inventoryData.NextOwnerMask = unpackInt(byteBuffer)
            inventoryData.GroupOwned = unpackBoolean(byteBuffer)
            inventoryData.AssetID = unpackUUID(byteBuffer)
            inventoryData.Type = unpackByte(byteBuffer)
            inventoryData.InvType = unpackByte(byteBuffer)
            inventoryData.Flags = unpackInt(byteBuffer)
            inventoryData.SaleType = unpackByte(byteBuffer) & 0xFF
            inventoryData.SalePrice = unpackInt(byteBuffer)
            inventoryData.Name = unpackVariable(byteBuffer, 1)
            inventoryData.Description = unpackVariable(byteBuffer, 1)
            inventoryData.CreationDate = unpackInt(byteBuffer)
            inventoryData.CRC = unpackInt(byteBuffer)
            this.InventoryData_Fields.add(inventoryData)
        }
    }
}

