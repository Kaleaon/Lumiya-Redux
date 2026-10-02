package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * Can only fit around 7 items per packet - that's the way it goes. At
 * least many bulk updates can be packed.
 * Only from dataserver->sim->viewer
 *
 * <p>Template: {@code BulkUpdateInventory Low 281 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code processBulkUpdateInventory()} in indra/newview/llinventorymodel.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class BulkUpdateInventory : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val FolderData_Fields = ArrayList<FolderData>()
    @JvmField val ItemData_Fields = ArrayList<ItemData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null // LLUUID
        @JvmField var TransactionID: UUID? = null // LLUUID
    }

    /** Block FolderData, Variable. */
    open class FolderData {
        @JvmField var FolderID: UUID? = null // LLUUID
        @JvmField var Name: ByteArray? = null // Variable 1
        @JvmField var ParentID: UUID? = null // LLUUID
        @JvmField var Type: Int = 0 // S8
    }

    /** Block ItemData, Variable. */
    open class ItemData {
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
        var i2 = 37
        for (entry in this.FolderData_Fields) {
            i2 = entry.Name.size + 34 + i2
        }
        val i = i2
        var i3 = i + 1
        for (entry in this.ItemData_Fields) {
            i3 = entry.Description.size + entry.Name.size + 133 + 1 + 4 + 4 + i3
        }
        return i3
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleBulkUpdateInventory(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 281 (BulkUpdateInventory).
        byteBuffer.putShort((short) 0xFFFF)
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x19).toByte())
        packUUID(byteBuffer, this.AgentData_Field.AgentID)
        packUUID(byteBuffer, this.AgentData_Field.TransactionID)
        byteBuffer.put((this.FolderData_Fields.size).toByte())
        for (folderData in this.FolderData_Fields) {
            packUUID(byteBuffer, folderData.FolderID)
            packUUID(byteBuffer, folderData.ParentID)
            packByte(byteBuffer, (folderData.Type).toByte())
            packVariable(byteBuffer, folderData.Name, 1)
        }
        byteBuffer.put((this.ItemData_Fields.size).toByte())
        for (itemData in this.ItemData_Fields) {
            packUUID(byteBuffer, itemData.ItemID)
            packInt(byteBuffer, itemData.CallbackID)
            packUUID(byteBuffer, itemData.FolderID)
            packUUID(byteBuffer, itemData.CreatorID)
            packUUID(byteBuffer, itemData.OwnerID)
            packUUID(byteBuffer, itemData.GroupID)
            packInt(byteBuffer, itemData.BaseMask)
            packInt(byteBuffer, itemData.OwnerMask)
            packInt(byteBuffer, itemData.GroupMask)
            packInt(byteBuffer, itemData.EveryoneMask)
            packInt(byteBuffer, itemData.NextOwnerMask)
            packBoolean(byteBuffer, itemData.GroupOwned)
            packUUID(byteBuffer, itemData.AssetID)
            packByte(byteBuffer, (itemData.Type).toByte())
            packByte(byteBuffer, (itemData.InvType).toByte())
            packInt(byteBuffer, itemData.Flags)
            packByte(byteBuffer, (itemData.SaleType).toByte())
            packInt(byteBuffer, itemData.SalePrice)
            packVariable(byteBuffer, itemData.Name, 1)
            packVariable(byteBuffer, itemData.Description, 1)
            packInt(byteBuffer, itemData.CreationDate)
            packInt(byteBuffer, itemData.CRC)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer)
        this.AgentData_Field.TransactionID = unpackUUID(byteBuffer)
        val i = byteBuffer.get().toInt() and 0xFF
        repeat(i) {
            val folderData = FolderData()
            folderData.FolderID = unpackUUID(byteBuffer)
            folderData.ParentID = unpackUUID(byteBuffer)
            folderData.Type = unpackByte(byteBuffer)
            folderData.Name = unpackVariable(byteBuffer, 1)
            this.FolderData_Fields.add(folderData)
        }
        val i3 = byteBuffer.get().toInt() and 0xFF
        repeat(i3) {
            val itemData = ItemData()
            itemData.ItemID = unpackUUID(byteBuffer)
            itemData.CallbackID = unpackInt(byteBuffer)
            itemData.FolderID = unpackUUID(byteBuffer)
            itemData.CreatorID = unpackUUID(byteBuffer)
            itemData.OwnerID = unpackUUID(byteBuffer)
            itemData.GroupID = unpackUUID(byteBuffer)
            itemData.BaseMask = unpackInt(byteBuffer)
            itemData.OwnerMask = unpackInt(byteBuffer)
            itemData.GroupMask = unpackInt(byteBuffer)
            itemData.EveryoneMask = unpackInt(byteBuffer)
            itemData.NextOwnerMask = unpackInt(byteBuffer)
            itemData.GroupOwned = unpackBoolean(byteBuffer)
            itemData.AssetID = unpackUUID(byteBuffer)
            itemData.Type = unpackByte(byteBuffer)
            itemData.InvType = unpackByte(byteBuffer)
            itemData.Flags = unpackInt(byteBuffer)
            itemData.SaleType = unpackByte(byteBuffer) & 0xFF
            itemData.SalePrice = unpackInt(byteBuffer)
            itemData.Name = unpackVariable(byteBuffer, 1)
            itemData.Description = unpackVariable(byteBuffer, 1)
            itemData.CreationDate = unpackInt(byteBuffer)
            itemData.CRC = unpackInt(byteBuffer)
            this.ItemData_Fields.add(itemData)
        }
    }
}
