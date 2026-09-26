package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ParcelGodForceOwner Unencoded
 *
 * <p>Template: {@code ParcelGodForceOwner Low 214 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class ParcelGodForceOwner : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var Data_Field: Data = Data()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block Data, Single. */
    open class Data {
        @JvmField var LocalID: Int = 0
        @JvmField var OwnerID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 56
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleParcelGodForceOwner(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 214 (ParcelGodForceOwner).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xD6).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, Data_Field.OwnerID)
        packInt(byteBuffer, Data_Field.LocalID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        Data_Field.OwnerID = unpackUUID(byteBuffer)
        Data_Field.LocalID = unpackInt(byteBuffer)
    }
}
