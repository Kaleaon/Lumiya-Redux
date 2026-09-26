package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * TeleportLandmarkRequest viewer->sim
 * teleport to landmark asset ID destination. use LLUUD::null for home.
 *
 * <p>Template: {@code TeleportLandmarkRequest Low 65 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class TeleportLandmarkRequest : SLMessage() {
    @JvmField var Info_Field: Info = Info()

    /** Block Info, Single. */
    open class Info {
        @JvmField var AgentID: UUID? = null
        @JvmField var LandmarkID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 52
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleTeleportLandmarkRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 65 (TeleportLandmarkRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x41).toByte())
        packUUID(byteBuffer, Info_Field.AgentID)
        packUUID(byteBuffer, Info_Field.SessionID)
        packUUID(byteBuffer, Info_Field.LandmarkID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        Info_Field.AgentID = unpackUUID(byteBuffer)
        Info_Field.SessionID = unpackUUID(byteBuffer)
        Info_Field.LandmarkID = unpackUUID(byteBuffer)
    }
}
