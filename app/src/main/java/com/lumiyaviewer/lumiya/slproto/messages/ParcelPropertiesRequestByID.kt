package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ParcelPropertiesRequestByID
 * viewer -> sim
 * reliable
 *
 * <p>Template: {@code ParcelPropertiesRequestByID Low 197 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class ParcelPropertiesRequestByID : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var ParcelData_Field: ParcelData = ParcelData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block ParcelData, Single. */
    open class ParcelData {
        @JvmField var LocalID: Int = 0
        @JvmField var SequenceID: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 44
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleParcelPropertiesRequestByID(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 197 (ParcelPropertiesRequestByID).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xC5).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, ParcelData_Field.SequenceID)
        packInt(byteBuffer, ParcelData_Field.LocalID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        ParcelData_Field.SequenceID = unpackInt(byteBuffer)
        ParcelData_Field.LocalID = unpackInt(byteBuffer)
    }
}
