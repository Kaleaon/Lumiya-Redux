package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Cancels user relationship
 * Updates inventory for both users.
 * Stops agent tracking in userserver.
 * viewer -> userserver -> dataserver
 * reliable
 *
 * <p>Template: {@code TerminateFriendship Low 300 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code processTerminateFriendship()} in indra/newview/llcallingcard.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class TerminateFriendship : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var ExBlock_Field: ExBlock = ExBlock()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block ExBlock, Single. */
    open class ExBlock {
        @JvmField var OtherID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 52
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleTerminateFriendship(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 300 (TerminateFriendship).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x2C).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, ExBlock_Field.OtherID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        ExBlock_Field.OtherID = unpackUUID(byteBuffer)
    }
}
