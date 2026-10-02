package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.UUID

/**
 * This message is sent from viewer -> simulator when the viewer wants
 * to rez an object out of inventory.
 *
 * <p>Template: {@code RezObject Low 293 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class RezObject : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var InventoryData_Field: InventoryData = InventoryData()
    @JvmField var RezData_Field: RezData = RezData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null // LLUUID
        @JvmField var GroupID: UUID? = null // LLUUID
        @JvmField var SessionID: UUID? = null // LLUUID
    }

    /** Block InventoryData, Single. */
    open class InventoryData {
        @JvmField var BaseMask: Int = 0 // U32 - permissions
        @JvmField var CRC: Int = 0 // U32
        @JvmField var CreationDate: Int = 0 // S32
        @JvmField var CreatorID: UUID? = null // LLUUID - permissions
        @JvmField var Description: ByteArray? = null // Variable 1
        @JvmField var EveryoneMask: Int = 0 // U32
        @JvmField var Flags: Int = 0 // U32
        @JvmField var FolderID: UUID? = null // LLUUID
        @JvmField var GroupID: UUID? = null // LLUUID
        @JvmField var GroupMask: Int = 0 // U32
        @JvmField var GroupOwned: Boolean = false // BOOL - permissions
        @JvmField var InvType: Int = 0 // S8
        @JvmField var ItemID: UUID? = null // LLUUID
        @JvmField var Name: ByteArray? = null // Variable 1
        @JvmField var NextOwnerMask: Int = 0 // U32
        @JvmField var OwnerID: UUID? = null // LLUUID - permissions
        @JvmField var OwnerMask: Int = 0 // U32 - permissions
        @JvmField var SalePrice: Int = 0 // S32
        @JvmField var SaleType: Int = 0 // U8
        @JvmField var TransactionID: UUID? = null // LLUUID
        @JvmField var Type: Int = 0 // S8
    }

    /** Block RezData, Single. */
    open class RezData {
        @JvmField var BypassRaycast: Int = 0 // U8
        @JvmField var EveryoneMask: Int = 0 // U32
        @JvmField var FromTaskID: UUID? = null // LLUUID
        @JvmField var GroupMask: Int = 0 // U32
        @JvmField var ItemFlags: Int = 0 // U32
        @JvmField var NextOwnerMask: Int = 0 // U32
        @JvmField var RayEnd: LLVector3? = null // LLVector3
        @JvmField var RayEndIsIntersection: Boolean = false // BOOL
        @JvmField var RayStart: LLVector3? = null // LLVector3
        @JvmField var RayTargetID: UUID? = null // LLUUID
        @JvmField var RemoveItem: Boolean = false // BOOL
        @JvmField var RezSelected: Boolean = false // BOOL
    }

    init {
        this.zeroCoded = true
        this.AgentData_Field = AgentData()
        this.RezData_Field = RezData()
        this.InventoryData_Field = InventoryData()
    }

    override fun CalcPayloadSize(): Int {
        return this.InventoryData_Field.Name.size + 129 + 1 + this.InventoryData_Field.Description.size + 4 + 4 + 128
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRezObject(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 293 (RezObject).
        byteBuffer.putShort((short) 0xFFFF)
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x25).toByte())
        packUUID(byteBuffer, this.AgentData_Field.AgentID)
        packUUID(byteBuffer, this.AgentData_Field.SessionID)
        packUUID(byteBuffer, this.AgentData_Field.GroupID)
        packUUID(byteBuffer, this.RezData_Field.FromTaskID)
        packByte(byteBuffer, (this.RezData_Field.BypassRaycast).toByte())
        packLLVector3(byteBuffer, this.RezData_Field.RayStart)
        packLLVector3(byteBuffer, this.RezData_Field.RayEnd)
        packUUID(byteBuffer, this.RezData_Field.RayTargetID)
        packBoolean(byteBuffer, this.RezData_Field.RayEndIsIntersection)
        packBoolean(byteBuffer, this.RezData_Field.RezSelected)
        packBoolean(byteBuffer, this.RezData_Field.RemoveItem)
        packInt(byteBuffer, this.RezData_Field.ItemFlags)
        packInt(byteBuffer, this.RezData_Field.GroupMask)
        packInt(byteBuffer, this.RezData_Field.EveryoneMask)
        packInt(byteBuffer, this.RezData_Field.NextOwnerMask)
        packUUID(byteBuffer, this.InventoryData_Field.ItemID)
        packUUID(byteBuffer, this.InventoryData_Field.FolderID)
        packUUID(byteBuffer, this.InventoryData_Field.CreatorID)
        packUUID(byteBuffer, this.InventoryData_Field.OwnerID)
        packUUID(byteBuffer, this.InventoryData_Field.GroupID)
        packInt(byteBuffer, this.InventoryData_Field.BaseMask)
        packInt(byteBuffer, this.InventoryData_Field.OwnerMask)
        packInt(byteBuffer, this.InventoryData_Field.GroupMask)
        packInt(byteBuffer, this.InventoryData_Field.EveryoneMask)
        packInt(byteBuffer, this.InventoryData_Field.NextOwnerMask)
        packBoolean(byteBuffer, this.InventoryData_Field.GroupOwned)
        packUUID(byteBuffer, this.InventoryData_Field.TransactionID)
        packByte(byteBuffer, (this.InventoryData_Field.Type).toByte())
        packByte(byteBuffer, (this.InventoryData_Field.InvType).toByte())
        packInt(byteBuffer, this.InventoryData_Field.Flags)
        packByte(byteBuffer, (this.InventoryData_Field.SaleType).toByte())
        packInt(byteBuffer, this.InventoryData_Field.SalePrice)
        packVariable(byteBuffer, this.InventoryData_Field.Name, 1)
        packVariable(byteBuffer, this.InventoryData_Field.Description, 1)
        packInt(byteBuffer, this.InventoryData_Field.CreationDate)
        packInt(byteBuffer, this.InventoryData_Field.CRC)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer)
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer)
        this.AgentData_Field.GroupID = unpackUUID(byteBuffer)
        this.RezData_Field.FromTaskID = unpackUUID(byteBuffer)
        this.RezData_Field.BypassRaycast = unpackByte(byteBuffer) & 0xFF
        this.RezData_Field.RayStart = unpackLLVector3(byteBuffer)
        this.RezData_Field.RayEnd = unpackLLVector3(byteBuffer)
        this.RezData_Field.RayTargetID = unpackUUID(byteBuffer)
        this.RezData_Field.RayEndIsIntersection = unpackBoolean(byteBuffer)
        this.RezData_Field.RezSelected = unpackBoolean(byteBuffer)
        this.RezData_Field.RemoveItem = unpackBoolean(byteBuffer)
        this.RezData_Field.ItemFlags = unpackInt(byteBuffer)
        this.RezData_Field.GroupMask = unpackInt(byteBuffer)
        this.RezData_Field.EveryoneMask = unpackInt(byteBuffer)
        this.RezData_Field.NextOwnerMask = unpackInt(byteBuffer)
        this.InventoryData_Field.ItemID = unpackUUID(byteBuffer)
        this.InventoryData_Field.FolderID = unpackUUID(byteBuffer)
        this.InventoryData_Field.CreatorID = unpackUUID(byteBuffer)
        this.InventoryData_Field.OwnerID = unpackUUID(byteBuffer)
        this.InventoryData_Field.GroupID = unpackUUID(byteBuffer)
        this.InventoryData_Field.BaseMask = unpackInt(byteBuffer)
        this.InventoryData_Field.OwnerMask = unpackInt(byteBuffer)
        this.InventoryData_Field.GroupMask = unpackInt(byteBuffer)
        this.InventoryData_Field.EveryoneMask = unpackInt(byteBuffer)
        this.InventoryData_Field.NextOwnerMask = unpackInt(byteBuffer)
        this.InventoryData_Field.GroupOwned = unpackBoolean(byteBuffer)
        this.InventoryData_Field.TransactionID = unpackUUID(byteBuffer)
        this.InventoryData_Field.Type = unpackByte(byteBuffer)
        this.InventoryData_Field.InvType = unpackByte(byteBuffer)
        this.InventoryData_Field.Flags = unpackInt(byteBuffer)
        this.InventoryData_Field.SaleType = unpackByte(byteBuffer) & 0xFF
        this.InventoryData_Field.SalePrice = unpackInt(byteBuffer)
        this.InventoryData_Field.Name = unpackVariable(byteBuffer, 1)
        this.InventoryData_Field.Description = unpackVariable(byteBuffer, 1)
        this.InventoryData_Field.CreationDate = unpackInt(byteBuffer)
        this.InventoryData_Field.CRC = unpackInt(byteBuffer)
    }
}
