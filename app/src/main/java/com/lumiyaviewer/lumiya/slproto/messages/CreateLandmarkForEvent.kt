package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * give agent a landmark for an event.
 *
 * <p>Template: {@code CreateLandmarkForEvent Low 306 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class CreateLandmarkForEvent : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var EventData_Field: EventData = EventData()
    @JvmField var InventoryBlock_Field: InventoryBlock = InventoryBlock()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block EventData, Single. */
    open class EventData {
        @JvmField var EventID: Int = 0
    }

    /** Block InventoryBlock, Single. */
    open class InventoryBlock {
        @JvmField var FolderID: UUID? = null
        @JvmField var Name: ByteArray? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return InventoryBlock_Field.Name!!.size + 17 + 40
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleCreateLandmarkForEvent(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 306 (CreateLandmarkForEvent).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x32).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, EventData_Field.EventID)
        packUUID(byteBuffer, InventoryBlock_Field.FolderID)
        packVariable(byteBuffer, InventoryBlock_Field.Name, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        EventData_Field.EventID = unpackInt(byteBuffer)
        InventoryBlock_Field.FolderID = unpackUUID(byteBuffer)
        InventoryBlock_Field.Name = unpackVariable(byteBuffer, 1)
    }
}
