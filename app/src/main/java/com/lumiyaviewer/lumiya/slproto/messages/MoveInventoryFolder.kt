package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * MoveInventoryFolder
 *
 * <p>Template: {@code MoveInventoryFolder Low 275 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class MoveInventoryFolder : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val InventoryData_Fields = ArrayList<InventoryData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
        @JvmField var Stamp: Boolean = false
    }

    /** Block InventoryData, Variable. */
    open class InventoryData {
        @JvmField var FolderID: UUID? = null
        @JvmField var ParentID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return (InventoryData_Fields.size * 32) + 38
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleMoveInventoryFolder(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 275 (MoveInventoryFolder).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x13).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packBoolean(byteBuffer, AgentData_Field.Stamp)
        byteBuffer.put((InventoryData_Fields.size.toByte()))
        for (inventoryData in InventoryData_Fields) {
            packUUID(byteBuffer, inventoryData.FolderID)
            packUUID(byteBuffer, inventoryData.ParentID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        AgentData_Field.Stamp = unpackBoolean(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val inventoryData = InventoryData()
            inventoryData.FolderID = unpackUUID(byteBuffer)
            inventoryData.ParentID = unpackUUID(byteBuffer)
            InventoryData_Fields.add(inventoryData)
        }
    }
}
