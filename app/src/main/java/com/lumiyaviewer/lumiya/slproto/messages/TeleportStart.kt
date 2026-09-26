package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer

/**
 * TeleportStart sim->viewer
 * announce a successful teleport request to the viewer.
 *
 * <p>Template: {@code TeleportStart Low 73 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_teleport_start()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class TeleportStart : SLMessage() {
    @JvmField var Info_Field: Info = Info()

    /** Block Info, Single. */
    open class Info {
        @JvmField var TeleportFlags: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 8
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleTeleportStart(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 73 (TeleportStart).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x49).toByte())
        packInt(byteBuffer, Info_Field.TeleportFlags)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        Info_Field.TeleportFlags = unpackInt(byteBuffer)
    }
}
