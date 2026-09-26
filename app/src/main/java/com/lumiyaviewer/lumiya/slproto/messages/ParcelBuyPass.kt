package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ParcelBuyPass - purchase a temporary access pass
 * viewer -> sim
 * reliable
 *
 * <p>Template: {@code ParcelBuyPass Low 206 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class ParcelBuyPass : SLMessage() {
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
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 40
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleParcelBuyPass(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 206 (ParcelBuyPass).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xCE).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, ParcelData_Field.LocalID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        ParcelData_Field.LocalID = unpackInt(byteBuffer)
    }
}
