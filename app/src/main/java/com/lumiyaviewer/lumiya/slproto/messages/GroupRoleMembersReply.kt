package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * GroupRoleMembersReply
 * All role::member pairs for this group.
 * dataserver -> simulator -> agent
 *
 * <p>Template: {@code GroupRoleMembersReply Low 374 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLGroupMgr::processGroupRoleMembersReply()} in indra/newview/llgroupmgr.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class GroupRoleMembersReply : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val MemberData_Fields = ArrayList<MemberData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var GroupID: UUID? = null
        @JvmField var RequestID: UUID? = null
        @JvmField var TotalPairs: Int = 0
    }

    /** Block MemberData, Variable. */
    open class MemberData {
        @JvmField var MemberID: UUID? = null
        @JvmField var RoleID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (MemberData_Fields.size * 32) + 57
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleGroupRoleMembersReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 374 (GroupRoleMembersReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x76).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.GroupID)
        packUUID(byteBuffer, AgentData_Field.RequestID)
        packInt(byteBuffer, AgentData_Field.TotalPairs)
        byteBuffer.put((MemberData_Fields.size.toByte()))
        for (memberData in MemberData_Fields) {
            packUUID(byteBuffer, memberData.RoleID)
            packUUID(byteBuffer, memberData.MemberID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.GroupID = unpackUUID(byteBuffer)
        AgentData_Field.RequestID = unpackUUID(byteBuffer)
        AgentData_Field.TotalPairs = unpackInt(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val memberData = MemberData()
            memberData.RoleID = unpackUUID(byteBuffer)
            memberData.MemberID = unpackUUID(byteBuffer)
            MemberData_Fields.add(memberData)
        }
    }
}
