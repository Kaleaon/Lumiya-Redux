package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Group messages
 * CreateGroupRequest
 * viewer -> simulator
 * reliable
 *
 * <p>Template: {@code CreateGroupRequest Low 339 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class CreateGroupRequest : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var GroupData_Field: GroupData = GroupData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block GroupData, Single. */
    open class GroupData {
        @JvmField var AllowPublish: Boolean = false
        @JvmField var Charter: ByteArray? = null
        @JvmField var InsigniaID: UUID? = null
        @JvmField var MaturePublish: Boolean = false
        @JvmField var MembershipFee: Int = 0
        @JvmField var Name: ByteArray? = null
        @JvmField var OpenEnrollment: Boolean = false
        @JvmField var ShowInList: Boolean = false
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return GroupData_Field.Name!!.size + 1 + 2 + GroupData_Field.Charter!!.size + 1 + 16 + 4 + 1 + 1 + 1 + 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleCreateGroupRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 339 (CreateGroupRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x53).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packVariable(byteBuffer, GroupData_Field.Name, 1)
        packVariable(byteBuffer, GroupData_Field.Charter, 2)
        packBoolean(byteBuffer, GroupData_Field.ShowInList)
        packUUID(byteBuffer, GroupData_Field.InsigniaID)
        packInt(byteBuffer, GroupData_Field.MembershipFee)
        packBoolean(byteBuffer, GroupData_Field.OpenEnrollment)
        packBoolean(byteBuffer, GroupData_Field.AllowPublish)
        packBoolean(byteBuffer, GroupData_Field.MaturePublish)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        GroupData_Field.Name = unpackVariable(byteBuffer, 1)
        GroupData_Field.Charter = unpackVariable(byteBuffer, 2)
        GroupData_Field.ShowInList = unpackBoolean(byteBuffer)
        GroupData_Field.InsigniaID = unpackUUID(byteBuffer)
        GroupData_Field.MembershipFee = unpackInt(byteBuffer)
        GroupData_Field.OpenEnrollment = unpackBoolean(byteBuffer)
        GroupData_Field.AllowPublish = unpackBoolean(byteBuffer)
        GroupData_Field.MaturePublish = unpackBoolean(byteBuffer)
    }
}
