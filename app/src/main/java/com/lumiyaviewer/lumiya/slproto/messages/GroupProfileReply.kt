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
        @JvmField var AgentID: UUID? = null
    }

    /** Block GroupData, Single. */
    open class GroupData {
        @JvmField var AllowPublish: Boolean = false
        @JvmField var Charter: ByteArray? = null
        @JvmField var FounderID: UUID? = null
        @JvmField var GroupID: UUID? = null
        @JvmField var GroupMembershipCount: Int = 0
        @JvmField var GroupRolesCount: Int = 0
        @JvmField var InsigniaID: UUID? = null
        @JvmField var MaturePublish: Boolean = false
        @JvmField var MemberTitle: ByteArray? = null
        @JvmField var MembershipFee: Int = 0
        @JvmField var Money: Int = 0
        @JvmField var Name: ByteArray? = null
        @JvmField var OpenEnrollment: Boolean = false
        @JvmField var OwnerRole: UUID? = null
        @JvmField var PowersMask: Long = 0L
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
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        GroupData_Field.GroupID = unpackUUID(byteBuffer)
        GroupData_Field.Name = unpackVariable(byteBuffer, 1)
        GroupData_Field.Charter = unpackVariable(byteBuffer, 2)
        GroupData_Field.ShowInList = unpackBoolean(byteBuffer)
        GroupData_Field.MemberTitle = unpackVariable(byteBuffer, 1)
        GroupData_Field.PowersMask = unpackLong(byteBuffer)
        GroupData_Field.InsigniaID = unpackUUID(byteBuffer)
        GroupData_Field.FounderID = unpackUUID(byteBuffer)
        GroupData_Field.MembershipFee = unpackInt(byteBuffer)
        GroupData_Field.OpenEnrollment = unpackBoolean(byteBuffer)
        GroupData_Field.Money = unpackInt(byteBuffer)
        GroupData_Field.GroupMembershipCount = unpackInt(byteBuffer)
        GroupData_Field.GroupRolesCount = unpackInt(byteBuffer)
        GroupData_Field.AllowPublish = unpackBoolean(byteBuffer)
        GroupData_Field.MaturePublish = unpackBoolean(byteBuffer)
        GroupData_Field.OwnerRole = unpackUUID(byteBuffer)
    }
}
