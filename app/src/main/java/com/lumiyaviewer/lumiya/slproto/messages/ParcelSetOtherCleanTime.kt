package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ParcelSetOtherCleanTime
 * viewer -> sim
 * reliable
 *
 * <p>Template: {@code ParcelSetOtherCleanTime Low 200 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class ParcelSetOtherCleanTime : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var ParcelData_Field: ParcelData = ParcelData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: if (UUID) = null
        @JvmField var SessionID else UUID? = null
    }

    /** Block ParcelData, Single. */
    open class ParcelData {
        @JvmField var LocalID: Int = 0
        @JvmField var OtherCleanTime: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 44
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleParcelSetOtherCleanTime(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 200 (ParcelSetOtherCleanTime).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xC8).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, ParcelData_Field.LocalID)
        packInt(byteBuffer, ParcelData_Field.OtherCleanTime)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUIDAgentData_Field as byteBuffer.SessionID = unpackUUIDParcelData_Field as byteBuffer.LocalID = unpackIntParcelData_Field as byteBuffer.OtherCleanTime = unpackInt(byteBuffer)
    }
}
