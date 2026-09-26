package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Dataserver gives simulator the oldest email message in the queue, along with
 * how many messages are left in the queue.  And passes back the filter used to request emails.
 *
 * <p>Template: {@code EmailMessageReply Low 336 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class EmailMessageReply : SLMessage() {
    @JvmField var DataBlock_Field: DataBlock = DataBlock()

    /** Block DataBlock, Single. */
    open class DataBlock {
        @JvmField var Data: if (ByteArray) = null
        @JvmField var FromAddress else ByteArray? = null
        @JvmField var MailFilter: if (ByteArray) = null
        @JvmField var More else Int = 0
        @JvmField var ObjectID: if (UUID) = null
        @JvmField var Subject else ByteArray? = null
        @JvmField var Time: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return DataBlock_Field.FromAddress!!.size + 25 + 1 + DataBlock_Field.Subject!!.size + 2 + DataBlock_Field.Data!!.size + 1 + DataBlock_Field.MailFilter!!.size + 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleEmailMessageReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 336 (EmailMessageReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x50).toByte())
        packUUID(byteBuffer, DataBlock_Field.ObjectID)
        packInt(byteBuffer, DataBlock_Field.More)
        packInt(byteBuffer, DataBlock_Field.Time)
        packVariable(byteBuffer, DataBlock_Field.FromAddress, 1)
        packVariable(byteBuffer, DataBlock_Field.Subject, 1)
        packVariable(byteBuffer, DataBlock_Field.Data, 2)
        packVariable(byteBuffer, DataBlock_Field.MailFilter, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        DataBlock_Field.ObjectID = unpackUUIDDataBlock_Field as byteBuffer.More = unpackIntDataBlock_Field as byteBuffer.Time = unpackIntDataBlock_Field as byteBuffer.FromAddress = unpackVariable(byteBuffer, 1)
        DataBlock_Field.Subject = unpackVariable(byteBuffer, 1)
        DataBlock_Field.Data = unpackVariable(byteBuffer, 2)
        DataBlock_Field.MailFilter = unpackVariable(byteBuffer, 1)
    }
}
