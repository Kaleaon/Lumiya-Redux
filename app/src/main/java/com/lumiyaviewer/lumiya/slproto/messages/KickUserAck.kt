package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ack sent from the simulator up to the main database so that login
 * can continue.
 *
 * <p>Template: {@code KickUserAck Low 164 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class KickUserAck : SLMessage() {
    @JvmField var UserInfo_Field: UserInfo = UserInfo()

    /** Block UserInfo, Single. */
    open class UserInfo {
        @JvmField var Flags: Int = 0
        @JvmField var SessionID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 24
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleKickUserAck(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 164 (KickUserAck).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xA4).toByte())
        packUUID(byteBuffer, UserInfo_Field.SessionID)
        packInt(byteBuffer, UserInfo_Field.Flags)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        UserInfo_Field.SessionID = unpackUUID(byteBuffer)
        UserInfo_Field.Flags = unpackInt(byteBuffer)
    }
}
