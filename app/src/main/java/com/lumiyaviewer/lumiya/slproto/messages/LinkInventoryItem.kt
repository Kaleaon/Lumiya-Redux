package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Link inventory
 *
 * <p>Template: {@code LinkInventoryItem Low 426 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class LinkInventoryItem : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var InventoryBlock_Field: InventoryBlock = InventoryBlock()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block InventoryBlock, Single. */
    open class InventoryBlock {
        @JvmField var CallbackID: Int = 0
        @JvmField var Description: ByteArray? = null
        @JvmField var FolderID: UUID? = null
        @JvmField var InvType: Int = 0
        @JvmField var Name: ByteArray? = null
        @JvmField var OldItemID: UUID? = null
        @JvmField var TransactionID: UUID? = null
        @JvmField var Type: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return InventoryBlock_Field.Name!!.size + 55 + 1 + InventoryBlock_Field.Description!!.size + 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleLinkInventoryItem(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 426 (LinkInventoryItem).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0xAA).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, InventoryBlock_Field.CallbackID)
        packUUID(byteBuffer, InventoryBlock_Field.FolderID)
        packUUID(byteBuffer, InventoryBlock_Field.TransactionID)
        packUUID(byteBuffer, InventoryBlock_Field.OldItemID)
        packByte(byteBuffer, (InventoryBlock_Field.Type).toByte())
        packByte(byteBuffer, (InventoryBlock_Field.InvType).toByte())
        packVariable(byteBuffer, InventoryBlock_Field.Name, 1)
        packVariable(byteBuffer, InventoryBlock_Field.Description, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        InventoryBlock_Field.CallbackID = unpackInt(byteBuffer)
        InventoryBlock_Field.FolderID = unpackUUID(byteBuffer)
        InventoryBlock_Field.TransactionID = unpackUUID(byteBuffer)
        InventoryBlock_Field.OldItemID = unpackUUID(byteBuffer)
        InventoryBlock_Field.Type = unpackByte(byteBuffer).toInt()
        InventoryBlock_Field.InvType = unpackByte(byteBuffer).toInt()
        InventoryBlock_Field.Name = unpackVariable(byteBuffer, 1)
        InventoryBlock_Field.Description = unpackVariable(byteBuffer, 1)
    }
}
