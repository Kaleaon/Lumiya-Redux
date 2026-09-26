package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Script on simulator sends mail to another script
 *
 * <p>Template: {@code InternalScriptMail Medium 16 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class InternalScriptMail : SLMessage() {
    @JvmField var DataBlock_Field: DataBlock = DataBlock()

    /** Block DataBlock, Single. */
    open class DataBlock {
        @JvmField var Body: ByteArray? = null
        @JvmField var From: ByteArray? = null
        @JvmField var Subject: ByteArray? = null
        @JvmField var To: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return DataBlock_Field.From!!.size + 1 + 16 + 1 + DataBlock_Field.Subject!!.size + 2 + DataBlock_Field.Body!!.size + 2
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleInternalScriptMail(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Medium 16 (InternalScriptMail).
        byteBuffer.put((0xFF).toByte())
        byteBuffer.put((0x10).toByte())
        packVariable(byteBuffer, DataBlock_Field.From, 1)
        packUUID(byteBuffer, DataBlock_Field.To)
        packVariable(byteBuffer, DataBlock_Field.Subject, 1)
        packVariable(byteBuffer, DataBlock_Field.Body, 2)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        DataBlock_Field.From = unpackVariable(byteBuffer, 1)
        DataBlock_Field.To = unpackUUID(byteBuffer)
        DataBlock_Field.Subject = unpackVariable(byteBuffer, 1)
        DataBlock_Field.Body = unpackVariable(byteBuffer, 2)
    }
}
