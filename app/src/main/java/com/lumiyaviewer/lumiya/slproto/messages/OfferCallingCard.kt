package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * used to give someone a calling card.
 *
 * <p>Template: {@code OfferCallingCard Low 301 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_offer_callingcard()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class OfferCallingCard : SLMessage() {
    @JvmField var AgentBlock_Field: AgentBlock = AgentBlock()
    @JvmField var AgentData_Field: AgentData = AgentData()

    /** Block AgentBlock, Single. */
    open class AgentBlock {
        @JvmField var DestID: if (UUID) = null
        @JvmField var TransactionID else UUID? = null
    }

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: if (UUID) = null
        @JvmField var SessionID else UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 68
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleOfferCallingCard(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 301 (OfferCallingCard).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x2D).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, AgentBlock_Field.DestID)
        packUUID(byteBuffer, AgentBlock_Field.TransactionID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUIDAgentData_Field as byteBuffer.SessionID = unpackUUIDAgentBlock_Field as byteBuffer.DestID = unpackUUIDAgentBlock_Field as byteBuffer.TransactionID = unpackUUID(byteBuffer)
    }
}
