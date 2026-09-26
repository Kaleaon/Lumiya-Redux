package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.net.Inet4Address
import java.nio.ByteBuffer
import java.util.UUID

/**
 * KickUser
 * *FIXME*
 * Kick off a logged-in user, such as when two people log in with the
 * same account name.
 * ROUTED dataserver -> userserver -> spaceserver -> simulator -> viewer
 * reliable, but that may not matter if a system component is quitting
 *
 * <p>Template: {@code KickUser Low 163 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_kick_user()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class KickUser : SLMessage() {
    @JvmField var TargetBlock_Field: TargetBlock = TargetBlock()
    @JvmField var UserInfo_Field: UserInfo = UserInfo()

    /** Block TargetBlock, Single. */
    open class TargetBlock {
        @JvmField var TargetIP: Inet4Address? = null
        @JvmField var TargetPort: Int = 0
    }

    /** Block UserInfo, Single. */
    open class UserInfo {
        @JvmField var AgentID: UUID? = null
        @JvmField var Reason: ByteArray? = null
        @JvmField var SessionID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return UserInfo_Field.Reason!!.size + 34 + 10
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleKickUser(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 163 (KickUser).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xA3).toByte())
        packIPAddress(byteBuffer, TargetBlock_Field.TargetIP)
        packShort(byteBuffer, TargetBlock_Field.TargetPort.toShort())
        packUUID(byteBuffer, UserInfo_Field.AgentID)
        packUUID(byteBuffer, UserInfo_Field.SessionID)
        packVariable(byteBuffer, UserInfo_Field.Reason, 2)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        TargetBlock_Field.TargetIP = unpackIPAddress(byteBuffer)
        TargetBlock_Field.TargetPort = unpackShort(byteBuffer).toInt() and 65535
        UserInfo_Field.AgentID = unpackUUID(byteBuffer)
        UserInfo_Field.SessionID = unpackUUID(byteBuffer)
        UserInfo_Field.Reason = unpackVariable(byteBuffer, 2)
    }
}
