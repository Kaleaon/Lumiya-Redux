package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * viewer -> sim
 * ParcelAccessListRequest
 *
 * <p>Template: {@code ParcelAccessListRequest Low 215 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class ParcelAccessListRequest : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var Data_Field: Data = Data()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block Data, Single. */
    open class Data {
        @JvmField var Flags: Int = 0
        @JvmField var LocalID: Int = 0
        @JvmField var SequenceID: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 48
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleParcelAccessListRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 215 (ParcelAccessListRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xD7).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, Data_Field.SequenceID)
        packInt(byteBuffer, Data_Field.Flags)
        packInt(byteBuffer, Data_Field.LocalID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        Data_Field.SequenceID = unpackInt(byteBuffer)
        Data_Field.Flags = unpackInt(byteBuffer)
        Data_Field.LocalID = unpackInt(byteBuffer)
    }
}
