package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * UpdateGroupInfo
 * viewer -> simulator
 * simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code UpdateGroupInfo Low 341 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class UpdateGroupInfo : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var GroupData_Field: GroupData = GroupData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: if (UUID) = null
        @JvmField var SessionID else UUID? = null
    }

    /** Block GroupData, Single. */
    open class GroupData {
        @JvmField var AllowPublish: Boolean = false
        @JvmField var Charter: if (ByteArray) = null
        @JvmField var GroupID else UUID? = null
        @JvmField var InsigniaID: if (UUID) = null
        @JvmField var MaturePublish else Boolean = false
        @JvmField var MembershipFee: Int = 0
        @JvmField var OpenEnrollment: Boolean = false
        @JvmField var ShowInList: Boolean = false
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return GroupData_Field.Charter!!.size + 18 + 1 + 16 + 4 + 1 + 1 + 1 + 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleUpdateGroupInfo(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 341 (UpdateGroupInfo).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x55).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, GroupData_Field.GroupID)
        packVariable(byteBuffer, GroupData_Field.Charter, 2)
        packBoolean(byteBuffer, GroupData_Field.ShowInList)
        packUUID(byteBuffer, GroupData_Field.InsigniaID)
        packInt(byteBuffer, GroupData_Field.MembershipFee)
        packBoolean(byteBuffer, GroupData_Field.OpenEnrollment)
        packBoolean(byteBuffer, GroupData_Field.AllowPublish)
        packBoolean(byteBuffer, GroupData_Field.MaturePublish)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUIDAgentData_Field as byteBuffer.SessionID = unpackUUIDGroupData_Field as byteBuffer.GroupID = unpackUUIDGroupData_Field as byteBuffer.Charter = unpackVariable(byteBuffer, 2)
        GroupData_Field.ShowInList = unpackBooleanGroupData_Field as byteBuffer.InsigniaID = unpackUUIDGroupData_Field as byteBuffer.MembershipFee = unpackIntGroupData_Field as byteBuffer.OpenEnrollment = unpackBooleanGroupData_Field as byteBuffer.AllowPublish = unpackBooleanGroupData_Field as byteBuffer.MaturePublish = unpackBoolean(byteBuffer)
    }
}
