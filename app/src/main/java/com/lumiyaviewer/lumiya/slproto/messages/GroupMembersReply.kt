package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * GroupMembersReply
 * list of uuids for the group members
 * dataserver -> simulator
 * reliable
 *
 * <p>Template: {@code GroupMembersReply Low 367 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLGroupMgr::processGroupMembersReply()} in indra/newview/llgroupmgr.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class GroupMembersReply : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var GroupData_Field: GroupData = GroupData()
    @JvmField val MemberData_Fields = ArrayList<MemberData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
    }

    /** Block GroupData, Single. */
    open class GroupData {
        @JvmField var GroupID: UUID? = null
        @JvmField var MemberCount: Int = 0
        @JvmField var RequestID: UUID? = null
    }

    /** Block MemberData, Variable. */
    open class MemberData {
        @JvmField var AgentID: UUID? = null
        @JvmField var AgentPowers: Long = 0L
        @JvmField var Contribution: Int = 0
        @JvmField var IsOwner: Boolean = false
        @JvmField var OnlineStatus: ByteArray? = null
        @JvmField var Title: ByteArray? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        var i = 57
        val it = MemberData_Fields.iterator()
        while (true) {
            val i2 = i
            if (!it.hasNext()) {
                return i2
            }
            val memberData = it.next()
            i = memberData.Title!!.size + memberData.OnlineStatus!!.size + 21 + 8 + 1 + 1 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleGroupMembersReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 367 (GroupMembersReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x6F).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, GroupData_Field.GroupID)
        packUUID(byteBuffer, GroupData_Field.RequestID)
        packInt(byteBuffer, GroupData_Field.MemberCount)
        byteBuffer.put((MemberData_Fields.size.toByte()))
        for (memberData in MemberData_Fields) {
            packUUID(byteBuffer, memberData.AgentID)
            packInt(byteBuffer, memberData.Contribution)
            packVariable(byteBuffer, memberData.OnlineStatus, 1)
            packLong(byteBuffer, memberData.AgentPowers)
            packVariable(byteBuffer, memberData.Title, 1)
            packBoolean(byteBuffer, memberData.IsOwner)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        GroupData_Field.GroupID = unpackUUID(byteBuffer)
        GroupData_Field.RequestID = unpackUUID(byteBuffer)
        GroupData_Field.MemberCount = unpackInt(byteBuffer)
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val memberData = MemberData()
            memberData.AgentID = unpackUUID(byteBuffer)
            memberData.Contribution = unpackInt(byteBuffer)
            memberData.OnlineStatus = unpackVariable(byteBuffer, 1)
            memberData.AgentPowers = unpackLong(byteBuffer)
            memberData.Title = unpackVariable(byteBuffer, 1)
            memberData.IsOwner = unpackBoolean(byteBuffer)
            MemberData_Fields.add(memberData)
        }
    }
}
