package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * Tell the database some gestures are no longer active
 * viewer -> sim -> data
 *
 * <p>Template: {@code DeactivateGestures Low 317 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class DeactivateGestures : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val Data_Fields = ArrayList<Data>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var Flags: Int = 0
        @JvmField var SessionID: UUID? = null
    }

    /** Block Data, Variable. */
    open class Data {
        @JvmField var GestureFlags: Int = 0
        @JvmField var ItemID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (Data_Fields.size * 20) + 41
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleDeactivateGestures(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 317 (DeactivateGestures).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x3D).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, AgentData_Field.Flags)
        byteBuffer.put((Data_Fields.size.toByte()))
        for (data in Data_Fields) {
            packUUID(byteBuffer, data.ItemID)
            packInt(byteBuffer, data.GestureFlags)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        AgentData_Field.Flags = unpackInt(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val data = Data()
            data.ItemID = unpackUUID(byteBuffer)
            data.GestureFlags = unpackInt(byteBuffer)
            Data_Fields.add(data)
        }
    }
}
