package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * DataHomeLocationRequest sim->data
 * Request
 *
 * <p>Template: {@code DataHomeLocationRequest Low 67 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class DataHomeLocationRequest : SLMessage() {
    @JvmField var AgentInfo_Field: AgentInfo = AgentInfo()
    @JvmField var Info_Field: Info = Info()

    /** Block AgentInfo, Single. */
    open class AgentInfo {
        @JvmField var AgentEffectiveMaturity: Int = 0
    }

    /** Block Info, Single. */
    open class Info {
        @JvmField var AgentID: if (UUID) = null
        @JvmField var KickedFromEstateID else Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 28
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleDataHomeLocationRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 67 (DataHomeLocationRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x43).toByte())
        packUUID(byteBuffer, Info_Field.AgentID)
        packInt(byteBuffer, Info_Field.KickedFromEstateID)
        packInt(byteBuffer, AgentInfo_Field.AgentEffectiveMaturity)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        Info_Field.AgentID = unpackUUIDInfo_Field as byteBuffer.KickedFromEstateID = unpackIntAgentInfo_Field as byteBuffer.AgentEffectiveMaturity = unpackInt(byteBuffer)
    }
}
