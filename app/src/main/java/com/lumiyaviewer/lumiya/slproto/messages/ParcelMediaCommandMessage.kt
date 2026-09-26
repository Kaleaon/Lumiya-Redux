package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer

/**
 * ParcelMediaCommandMessage
 * Sends a parcel media command
 *
 * <p>Template: {@code ParcelMediaCommandMessage Low 419 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code parcelMediaCommandMessageHandler()} in indra/newview/llviewerparcelmedia.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class ParcelMediaCommandMessage : SLMessage() {
    @JvmField var CommandBlock_Field: CommandBlock = CommandBlock()

    /** Block CommandBlock, Single. */
    open class CommandBlock {
        @JvmField var Command: Int = 0
        @JvmField var Flags: Int = 0
        @JvmField var Time: Float = 0f
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 16
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleParcelMediaCommandMessage(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 419 (ParcelMediaCommandMessage).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0xA3).toByte())
        packInt(byteBuffer, CommandBlock_Field.Flags)
        packInt(byteBuffer, CommandBlock_Field.Command)
        packFloat(byteBuffer, CommandBlock_Field.Time)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        CommandBlock_Field.Flags = unpackInt(byteBuffer)
        CommandBlock_Field.Command = unpackInt(byteBuffer)
        CommandBlock_Field.Time = unpackFloat(byteBuffer)
    }
}
