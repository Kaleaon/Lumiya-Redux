package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Disabled feature response message
 *
 * <p>Template: {@code FeatureDisabled Low 19 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_feature_disabled_message()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class FeatureDisabled : SLMessage() {
    @JvmField var FailureInfo_Field: FailureInfo = FailureInfo()

    /** Block FailureInfo, Single. */
    open class FailureInfo {
        @JvmField var AgentID: UUID? = null
        @JvmField var ErrorMessage: ByteArray? = null
        @JvmField var TransactionID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return FailureInfo_Field.ErrorMessage!!.size + 1 + 16 + 16 + 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleFeatureDisabled(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 19 (FeatureDisabled).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x13).toByte())
        packVariable(byteBuffer, FailureInfo_Field.ErrorMessage, 1)
        packUUID(byteBuffer, FailureInfo_Field.AgentID)
        packUUID(byteBuffer, FailureInfo_Field.TransactionID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        FailureInfo_Field.ErrorMessage = unpackVariable(byteBuffer, 1)
        FailureInfo_Field.AgentID = unpackUUID(byteBuffer)
        FailureInfo_Field.TransactionID = unpackUUID(byteBuffer)
    }
}
