package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * UserInfoReply
 *
 * <p>Template: {@code UserInfoReply Low 400 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_user_info_reply()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class UserInfoReply : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var UserData_Field: UserData = UserData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
    }

    /** Block UserData, Single. */
    open class UserData {
        @JvmField var DirectoryVisibility: ByteArray? = null
        @JvmField var EMail: ByteArray? = null
        @JvmField var IMViaEMail: Boolean = false
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return UserData_Field.DirectoryVisibility!!.size + 2 + 2 + UserData_Field.EMail!!.size + 20
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleUserInfoReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 400 (UserInfoReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x90).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packBoolean(byteBuffer, UserData_Field.IMViaEMail)
        packVariable(byteBuffer, UserData_Field.DirectoryVisibility, 1)
        packVariable(byteBuffer, UserData_Field.EMail, 2)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        UserData_Field.IMViaEMail = unpackBoolean(byteBuffer)
        UserData_Field.DirectoryVisibility = unpackVariable(byteBuffer, 1)
        UserData_Field.EMail = unpackVariable(byteBuffer, 2)
    }
}
