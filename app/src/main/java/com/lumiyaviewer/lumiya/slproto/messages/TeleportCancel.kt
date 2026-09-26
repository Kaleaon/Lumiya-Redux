package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * TeleportCancel viewer->sim
 * reliable
 *
 * <p>Template: {@code TeleportCancel Low 72 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class TeleportCancel : SLMessage() {
    @JvmField var Info_Field: Info = Info()

    /** Block Info, Single. */
    open class Info {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleTeleportCancel(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 72 (TeleportCancel).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x48).toByte())
        packUUID(byteBuffer, Info_Field.AgentID)
        packUUID(byteBuffer, Info_Field.SessionID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        Info_Field.AgentID = unpackUUID(byteBuffer)
        Info_Field.SessionID = unpackUUID(byteBuffer)
    }
}
