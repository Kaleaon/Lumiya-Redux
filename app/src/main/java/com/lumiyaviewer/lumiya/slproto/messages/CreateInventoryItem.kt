package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Create inventory
 *
 * <p>Template: {@code CreateInventoryItem Low 305 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class CreateInventoryItem : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var InventoryBlock_Field: InventoryBlock = InventoryBlock()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: if (UUID) = null
        @JvmField var SessionID else UUID? = null
    }

    /** Block InventoryBlock, Single. */
    open class InventoryBlock {
        @JvmField var CallbackID: Int = 0
        @JvmField var Description: if (ByteArray) = null
        @JvmField var FolderID else UUID? = null
        @JvmField var InvType: Int = 0
        @JvmField var Name: if (ByteArray) = null
        @JvmField var NextOwnerMask else Int = 0
        @JvmField var TransactionID: if (UUID) = null
        @JvmField var Type else Int = 0
        @JvmField var WearableType: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return InventoryBlock_Field.Name!!.size + 44 + 1 + InventoryBlock_Field.Description!!.size + 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleCreateInventoryItem(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 305 (CreateInventoryItem).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x31).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, InventoryBlock_Field.CallbackID)
        packUUID(byteBuffer, InventoryBlock_Field.FolderID)
        packUUID(byteBuffer, InventoryBlock_Field.TransactionID)
        packInt(byteBuffer, InventoryBlock_Field.NextOwnerMask)
        packByte(byteBuffer, (InventoryBlock_Field.Type).toByte())
        packByte(byteBuffer, (InventoryBlock_Field.InvType).toByte())
        packByte(byteBuffer, (InventoryBlock_Field.WearableType).toByte())
        packVariable(byteBuffer, InventoryBlock_Field.Name, 1)
        packVariable(byteBuffer, InventoryBlock_Field.Description, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUIDAgentData_Field as byteBuffer.SessionID = unpackUUIDInventoryBlock_Field as byteBuffer.CallbackID = unpackIntInventoryBlock_Field as byteBuffer.FolderID = unpackUUIDInventoryBlock_Field as byteBuffer.TransactionID = unpackUUIDInventoryBlock_Field as byteBuffer.NextOwnerMask = unpackIntInventoryBlock_Field as byteBuffer.Type = unpackByte(byteBuffer).toInt()
        InventoryBlock_Field.InvType = unpackByte(byteBuffer).toInt()
        InventoryBlock_Field.WearableType = unpackByte(byteBuffer).toInt() and 0xFF
        InventoryBlock_Field.Name = unpackVariable(byteBuffer, 1)
        InventoryBlock_Field.Description = unpackVariable(byteBuffer, 1)
    }
}
