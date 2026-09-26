package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * EstateCovenantReply
 * sim -> viewer
 * reliable
 *
 * <p>Template: {@code EstateCovenantReply Low 204 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_covenant_reply()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class EstateCovenantReply : SLMessage() {
    @JvmField var Data_Field: Data = Data()

    /** Block Data, Single. */
    open class Data {
        @JvmField var CovenantID: UUID? = null
        @JvmField var CovenantTimestamp: Int = 0
        @JvmField var EstateName: ByteArray? = null
        @JvmField var EstateOwnerID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return Data_Field.EstateName!!.size + 21 + 16 + 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleEstateCovenantReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 204 (EstateCovenantReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xCC).toByte())
        packUUID(byteBuffer, Data_Field.CovenantID)
        packInt(byteBuffer, Data_Field.CovenantTimestamp)
        packVariable(byteBuffer, Data_Field.EstateName, 1)
        packUUID(byteBuffer, Data_Field.EstateOwnerID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        Data_Field.CovenantID = unpackUUID(byteBuffer)
        Data_Field.CovenantTimestamp = unpackInt(byteBuffer)
        Data_Field.EstateName = unpackVariable(byteBuffer, 1)
        Data_Field.EstateOwnerID = unpackUUID(byteBuffer)
    }
}
