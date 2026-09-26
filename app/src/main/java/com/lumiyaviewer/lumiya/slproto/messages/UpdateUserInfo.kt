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
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block UserData, Single. */
    open class UserData {
        @JvmField var DirectoryVisibility: ByteArray? = null
        @JvmField var IMViaEMail: Boolean = false
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
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        UserData_Field.IMViaEMail = unpackBoolean(byteBuffer)
        UserData_Field.DirectoryVisibility = unpackVariable(byteBuffer, 1)
    }
}
