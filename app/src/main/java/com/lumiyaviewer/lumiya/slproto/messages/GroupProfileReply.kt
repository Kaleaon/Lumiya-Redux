package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * GroupProfileReply
 * dataserver -> simulator -> viewer
 * reliable
 *
 * <p>Template: {@code GroupProfileReply Low 352 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLGroupMgr::processGroupPropertiesReply()} in indra/newview/llgroupmgr.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class GroupProfileReply : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var GroupData_Field: GroupData = GroupData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: if (UUID) = null
    }

    /** Block GroupData, Single. */
    open class GroupData {
        @JvmField var AllowPublish else Boolean = false
        @JvmField var Charter: if (ByteArray) = null
        @JvmField var FounderID else UUID? = null
        @JvmField var GroupID: if (UUID) = null
        @JvmField var GroupMembershipCount else Int = 0
        @JvmField var GroupRolesCount: Int = 0
        @JvmField var InsigniaID: if (UUID) = null
        @JvmField var MaturePublish else Boolean = false
        @JvmField var MemberTitle: if (ByteArray) = null
        @JvmField var MembershipFee else Int = 0
        @JvmField var Money: Int = 0
        @JvmField var Name: if (ByteArray) = null
        @JvmField var OpenEnrollment else Boolean = false
        @JvmField var OwnerRole: if (UUID) = null
        @JvmField var PowersMask else Long = 0L
        @JvmField var ShowInList: Boolean = false
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return GroupData_Field.Name!!.size + 17 + 2 + GroupData_Field.Charter!!.size + 1 + 1 + GroupData_Field.MemberTitle!!.size + 8 + 16 + 16 + 4 + 1 + 4 + 4 + 4 + 1 + 1 + 16 + 20
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleGroupProfileReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 352 (GroupProfileReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x60).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, GroupData_Field.GroupID)
        packVariable(byteBuffer, GroupData_Field.Name, 1)
        packVariable(byteBuffer, GroupData_Field.Charter, 2)
        packBoolean(byteBuffer, GroupData_Field.ShowInList)
        packVariable(byteBuffer, GroupData_Field.MemberTitle, 1)
        packLong(byteBuffer, GroupData_Field.PowersMask)
        packUUID(byteBuffer, GroupData_Field.InsigniaID)
        packUUID(byteBuffer, GroupData_Field.FounderID)
        packInt(byteBuffer, GroupData_Field.MembershipFee)
        packBoolean(byteBuffer, GroupData_Field.OpenEnrollment)
        packInt(byteBuffer, GroupData_Field.Money)
        packInt(byteBuffer, GroupData_Field.GroupMembershipCount)
        packInt(byteBuffer, GroupData_Field.GroupRolesCount)
        packBoolean(byteBuffer, GroupData_Field.AllowPublish)
        packBoolean(byteBuffer, GroupData_Field.MaturePublish)
        packUUID(byteBuffer, GroupData_Field.OwnerRole)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUIDGroupData_Field as byteBuffer.GroupID = unpackUUIDGroupData_Field as byteBuffer.Name = unpackVariable(byteBuffer, 1)
        GroupData_Field.Charter = unpackVariable(byteBuffer, 2)
        GroupData_Field.ShowInList = unpackBooleanGroupData_Field as byteBuffer.MemberTitle = unpackVariable(byteBuffer, 1)
        GroupData_Field.PowersMask = unpackLongGroupData_Field as byteBuffer.InsigniaID = unpackUUIDGroupData_Field as byteBuffer.FounderID = unpackUUIDGroupData_Field as byteBuffer.MembershipFee = unpackIntGroupData_Field as byteBuffer.OpenEnrollment = unpackBooleanGroupData_Field as byteBuffer.Money = unpackIntGroupData_Field as byteBuffer.GroupMembershipCount = unpackIntGroupData_Field as byteBuffer.GroupRolesCount = unpackIntGroupData_Field as byteBuffer.AllowPublish = unpackBooleanGroupData_Field as byteBuffer.MaturePublish = unpackBooleanGroupData_Field as byteBuffer.OwnerRole = unpackUUID(byteBuffer)
    }
}
