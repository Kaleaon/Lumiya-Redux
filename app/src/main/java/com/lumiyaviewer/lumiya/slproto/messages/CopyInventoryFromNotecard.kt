package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * Inventory update messages
 * UDP DEPRECATED - Now a viewer capability.
 *
 * <p>Template: {@code CopyInventoryFromNotecard Low 265 NotTrusted Zerocoded UDPDeprecated}
 * (recovered/reference/message_template.msg).
 */
open class CopyInventoryFromNotecard : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val InventoryData_Fields = ArrayList<InventoryData>()
    @JvmField var NotecardData_Field: NotecardData = NotecardData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block InventoryData, Variable. */
    open class InventoryData {
        @JvmField var FolderID: UUID? = null
        @JvmField var ItemID: UUID? = null
    }

    /** Block NotecardData, Single. */
    open class NotecardData {
        @JvmField var NotecardItemID: UUID? = null
        @JvmField var ObjectID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return (InventoryData_Fields.size * 32) + 69
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleCopyInventoryFromNotecard(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 265 (CopyInventoryFromNotecard).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x09).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, NotecardData_Field.NotecardItemID)
        packUUID(byteBuffer, NotecardData_Field.ObjectID)
        byteBuffer.put((InventoryData_Fields.size.toByte()))
        for (inventoryData in InventoryData_Fields) {
            packUUID(byteBuffer, inventoryData.ItemID)
            packUUID(byteBuffer, inventoryData.FolderID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        NotecardData_Field.NotecardItemID = unpackUUID(byteBuffer)
        NotecardData_Field.ObjectID = unpackUUID(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val inventoryData = InventoryData()
            inventoryData.ItemID = unpackUUID(byteBuffer)
            inventoryData.FolderID = unpackUUID(byteBuffer)
            InventoryData_Fields.add(inventoryData)
        }
    }
}
