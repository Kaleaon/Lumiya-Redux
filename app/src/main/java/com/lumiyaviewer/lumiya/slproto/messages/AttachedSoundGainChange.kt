package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * AttachedSoundGainChange - Sent by simulator to viewer to change an attached sounds' volume
 *
 * <p>Template: {@code AttachedSoundGainChange Medium 14 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_attached_sound_gain_change()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class AttachedSoundGainChange : SLMessage() {
    @JvmField var DataBlock_Field: DataBlock = DataBlock()

    /** Block DataBlock, Single. */
    open class DataBlock {
        @JvmField var Gain: Float = 0f
        @JvmField var ObjectID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 22
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAttachedSoundGainChange(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Medium 14 (AttachedSoundGainChange).
        byteBuffer.put((0xFF).toByte())
        byteBuffer.put((0x0E).toByte())
        packUUID(byteBuffer, DataBlock_Field.ObjectID)
        packFloat(byteBuffer, DataBlock_Field.Gain)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        DataBlock_Field.ObjectID = unpackUUID(byteBuffer)
        DataBlock_Field.Gain = unpackFloat(byteBuffer)
    }
}
