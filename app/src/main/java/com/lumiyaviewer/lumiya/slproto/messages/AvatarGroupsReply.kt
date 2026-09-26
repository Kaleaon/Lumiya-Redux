package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * AvatarGroupsReply
 * dataserver -> simulator
 * simulator -> viewer
 * reliable
 *
 * <p>Template: {@code AvatarGroupsReply Low 173 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLAvatarPropertiesProcessor::processAvatarGroupsReply()} in indra/newview/llavatarpropertiesprocessor.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class AvatarGroupsReply : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val GroupData_Fields = ArrayList<GroupData>()
    @JvmField var NewGroupData_Field: NewGroupData = NewGroupData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var AvatarID: UUID? = null
    }

    /** Block GroupData, Variable. */
    open class GroupData {
        @JvmField var AcceptNotices: Boolean = false
        @JvmField var GroupID: UUID? = null
        @JvmField var GroupInsigniaID: UUID? = null
        @JvmField var GroupName: ByteArray? = null
        @JvmField var GroupPowers: Long = 0L
        @JvmField var GroupTitle: ByteArray? = null
    }

    /** Block NewGroupData, Single. */
    open class NewGroupData {
        @JvmField var ListInProfile: Boolean = false
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        var i = 37
        val it = GroupData_Fields.iterator()
        while (true) {
            val i2 = i
            if (!it.hasNext()) {
                return i2 + 1
            }
            val groupData = it.next()
            i = groupData.GroupName!!.size + groupData.GroupTitle!!.size + 10 + 16 + 1 + 16 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAvatarGroupsReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 173 (AvatarGroupsReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xAD).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.AvatarID)
        byteBuffer.put((GroupData_Fields.size.toByte()))
        for (groupData in GroupData_Fields) {
            packLong(byteBuffer, groupData.GroupPowers)
            packBoolean(byteBuffer, groupData.AcceptNotices)
            packVariable(byteBuffer, groupData.GroupTitle, 1)
            packUUID(byteBuffer, groupData.GroupID)
            packVariable(byteBuffer, groupData.GroupName, 1)
            packUUID(byteBuffer, groupData.GroupInsigniaID)
        }
        packBoolean(byteBuffer, NewGroupData_Field.ListInProfile)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.AvatarID = unpackUUID(byteBuffer)
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val groupData = GroupData()
            groupData.GroupPowers = unpackLong(byteBuffer)
            groupData.AcceptNotices = unpackBoolean(byteBuffer)
            groupData.GroupTitle = unpackVariable(byteBuffer, 1)
            groupData.GroupID = unpackUUID(byteBuffer)
            groupData.GroupName = unpackVariable(byteBuffer, 1)
            groupData.GroupInsigniaID = unpackUUID(byteBuffer)
            GroupData_Fields.add(groupData)
        }
        NewGroupData_Field.ListInProfile = unpackBoolean(byteBuffer)
    }
}
