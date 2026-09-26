package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * AttachedSound - Sent by simulator to viewer to play sound attached with an object
 *
 * <p>Template: {@code AttachedSound Medium 13 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code null_message_callback()} in indra/llmessage/message.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class AttachedSound : SLMessage() {
    @JvmField var DataBlock_Field: DataBlock = DataBlock()

    /** Block DataBlock, Single. */
    open class DataBlock {
        @JvmField var Flags: Int = 0
        @JvmField var Gain: Float = 0f
        @JvmField var ObjectID: UUID? = null
        @JvmField var OwnerID: UUID? = null
        @JvmField var SoundID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 55
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAttachedSound(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Medium 13 (AttachedSound).
        byteBuffer.put((0xFF).toByte())
        byteBuffer.put((0x0D).toByte())
        packUUID(byteBuffer, DataBlock_Field.SoundID)
        packUUID(byteBuffer, DataBlock_Field.ObjectID)
        packUUID(byteBuffer, DataBlock_Field.OwnerID)
        packFloat(byteBuffer, DataBlock_Field.Gain)
        packByte(byteBuffer, (DataBlock_Field.Flags).toByte())
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        DataBlock_Field.SoundID = unpackUUID(byteBuffer)
        DataBlock_Field.ObjectID = unpackUUID(byteBuffer)
        DataBlock_Field.OwnerID = unpackUUID(byteBuffer)
        DataBlock_Field.Gain = unpackFloat(byteBuffer)
        DataBlock_Field.Flags = unpackByte(byteBuffer).toInt() and 0xFF
    }
}
