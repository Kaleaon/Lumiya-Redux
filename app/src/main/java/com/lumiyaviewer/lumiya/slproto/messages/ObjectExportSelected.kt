package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * Export selected objects
 * viewer->sim
 *
 * <p>Template: {@code ObjectExportSelected Low 123 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class ObjectExportSelected : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val ObjectData_Fields = ArrayList<ObjectData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var RequestID: UUID? = null
        @JvmField var VolumeDetail: Int = 0
    }

    /** Block ObjectData, Variable. */
    open class ObjectData {
        @JvmField var ObjectID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return (ObjectData_Fields.size * 16) + 39
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleObjectExportSelected(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 123 (ObjectExportSelected).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x7B).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.RequestID)
        packShort(byteBuffer, AgentData_Field.VolumeDetail.toShort())
        byteBuffer.put((ObjectData_Fields.size.toByte()))
        for (entry in ObjectData_Fields) {
            packUUID(byteBuffer, entry.ObjectID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.RequestID = unpackUUID(byteBuffer)
        AgentData_Field.VolumeDetail = unpackShort(byteBuffer).toInt()
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val objectData = ObjectData()
            objectData.ObjectID = unpackUUID(byteBuffer)
            ObjectData_Fields.add(objectData)
        }
    }
}
