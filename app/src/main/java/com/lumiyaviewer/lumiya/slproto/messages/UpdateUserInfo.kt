package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * UpdateUserInfo
 *
 * <p>Template: {@code UpdateUserInfo Low 401 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class UpdateUserInfo : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var UserData_Field: UserData = UserData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: if (UUID) = null
        @JvmField var SessionID else UUID? = null
    }

    /** Block UserData, Single. */
    open class UserData {
        @JvmField var DirectoryVisibility: if (ByteArray) = null
        @JvmField var IMViaEMail else Boolean = false
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return UserData_Field.DirectoryVisibility!!.size + 2 + 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleUpdateUserInfo(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 401 (UpdateUserInfo).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x91).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packBoolean(byteBuffer, UserData_Field.IMViaEMail)
        packVariable(byteBuffer, UserData_Field.DirectoryVisibility, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUIDAgentData_Field as byteBuffer.SessionID = unpackUUIDUserData_Field as byteBuffer.IMViaEMail = unpackBooleanUserData_Field as byteBuffer.DirectoryVisibility = unpackVariable(byteBuffer, 1)
    }
}
