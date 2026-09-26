package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Script on simulator asks dataserver if there are any email messages
 * waiting.
 *
 * <p>Template: {@code EmailMessageRequest Low 335 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class EmailMessageRequest : SLMessage() {
    @JvmField var DataBlock_Field: DataBlock = DataBlock()

    /** Block DataBlock, Single. */
    open class DataBlock {
        @JvmField var FromAddress: ByteArray? = null
        @JvmField var ObjectID: UUID? = null
        @JvmField var Subject: ByteArray? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return DataBlock_Field.FromAddress!!.size + 17 + 1 + DataBlock_Field.Subject!!.size + 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleEmailMessageRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 335 (EmailMessageRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x4F).toByte())
        packUUID(byteBuffer, DataBlock_Field.ObjectID)
        packVariable(byteBuffer, DataBlock_Field.FromAddress, 1)
        packVariable(byteBuffer, DataBlock_Field.Subject, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        DataBlock_Field.ObjectID = unpackUUID(byteBuffer)
        DataBlock_Field.FromAddress = unpackVariable(byteBuffer, 1)
        DataBlock_Field.Subject = unpackVariable(byteBuffer, 1)
    }
}
