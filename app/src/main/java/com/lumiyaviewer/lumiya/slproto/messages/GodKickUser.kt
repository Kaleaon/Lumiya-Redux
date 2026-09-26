package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * GodKickUser
 * When a god wants someone kicked
 * viewer -> sim
 * reliable
 *
 * <p>Template: {@code GodKickUser Low 165 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class GodKickUser : SLMessage() {
    @JvmField var UserInfo_Field: UserInfo = UserInfo()

    /** Block UserInfo, Single. */
    open class UserInfo {
        @JvmField var AgentID: UUID? = null
        @JvmField var GodID: UUID? = null
        @JvmField var GodSessionID: UUID? = null
        @JvmField var KickFlags: Int = 0
        @JvmField var Reason: ByteArray? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return UserInfo_Field.Reason!!.size + 54 + 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleGodKickUser(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 165 (GodKickUser).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xA5).toByte())
        packUUID(byteBuffer, UserInfo_Field.GodID)
        packUUID(byteBuffer, UserInfo_Field.GodSessionID)
        packUUID(byteBuffer, UserInfo_Field.AgentID)
        packInt(byteBuffer, UserInfo_Field.KickFlags)
        packVariable(byteBuffer, UserInfo_Field.Reason, 2)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        UserInfo_Field.GodID = unpackUUID(byteBuffer)
        UserInfo_Field.GodSessionID = unpackUUID(byteBuffer)
        UserInfo_Field.AgentID = unpackUUID(byteBuffer)
        UserInfo_Field.KickFlags = unpackInt(byteBuffer)
        UserInfo_Field.Reason = unpackVariable(byteBuffer, 2)
    }
}
