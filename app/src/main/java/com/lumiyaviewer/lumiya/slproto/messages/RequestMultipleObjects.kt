package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * RequestMultipleObjects
 * viewer -> simulator
 * reliable
 * When the viewer gets a local_id/crc for an object that
 * it either doesn't have, or doesn't have the current version
 * of, it sends this upstream get get an update.
 * CacheMissType 0 => full object (viewer doesn't have it)
 * CacheMissType 1 => CRC mismatch only
 *
 * <p>Template: {@code RequestMultipleObjects Medium 3 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class RequestMultipleObjects : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val ObjectData_Fields = ArrayList<ObjectData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block ObjectData, Variable. */
    open class ObjectData {
        @JvmField var CacheMissType: Int = 0
        @JvmField var ID: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return (ObjectData_Fields.size * 5) + 35
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRequestMultipleObjects(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Medium 3 (RequestMultipleObjects).
        byteBuffer.put((0xFF).toByte())
        byteBuffer.put((0x03).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        byteBuffer.put((ObjectData_Fields.size.toByte()))
        for (objectData in ObjectData_Fields) {
            packByte(byteBuffer, (objectData.CacheMissType).toByte())
            packInt(byteBuffer, objectData.ID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val objectData = ObjectData()
            objectData.CacheMissType = unpackByte(byteBuffer).toInt() and 0xFF
            objectData.ID = unpackInt(byteBuffer)
            ObjectData_Fields.add(objectData)
        }
    }
}
