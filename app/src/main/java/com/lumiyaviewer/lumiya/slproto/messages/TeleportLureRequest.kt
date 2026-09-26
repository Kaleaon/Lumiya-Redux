package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * TeleportLureRequest viewer->sim
 * Message from target of lure to begin the teleport process on the
 * local simulator.
 *
 * <p>Template: {@code TeleportLureRequest Low 71 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class TeleportLureRequest : SLMessage() {
    @JvmField var Info_Field: Info = Info()

    /** Block Info, Single. */
    open class Info {
        @JvmField var AgentID: UUID? = null
        @JvmField var LureID: UUID? = null
        @JvmField var SessionID: UUID? = null
        @JvmField var TeleportFlags: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 56
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleTeleportLureRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 71 (TeleportLureRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x47).toByte())
        packUUID(byteBuffer, Info_Field.AgentID)
        packUUID(byteBuffer, Info_Field.SessionID)
        packUUID(byteBuffer, Info_Field.LureID)
        packInt(byteBuffer, Info_Field.TeleportFlags)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        Info_Field.AgentID = unpackUUID(byteBuffer)
        Info_Field.SessionID = unpackUUID(byteBuffer)
        Info_Field.LureID = unpackUUID(byteBuffer)
        Info_Field.TeleportFlags = unpackInt(byteBuffer)
    }
}
