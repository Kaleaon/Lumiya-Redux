package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * GroupRoleDataReply
 * All role data for this group
 * dataserver -> simulator -> agent
 *
 * <p>Template: {@code GroupRoleDataReply Low 372 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLGroupMgr::processGroupRoleDataReply()} in indra/newview/llgroupmgr.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class GroupRoleDataReply : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var GroupData_Field: GroupData = GroupData()
    @JvmField val RoleData_Fields = ArrayList<RoleData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
    }

    /** Block GroupData, Single. */
    open class GroupData {
        @JvmField var GroupID: UUID? = null
        @JvmField var RequestID: UUID? = null
        @JvmField var RoleCount: Int = 0
    }

    /** Block RoleData, Variable. */
    open class RoleData {
        @JvmField var Description: ByteArray? = null
        @JvmField var Members: Int = 0
        @JvmField var Name: ByteArray? = null
        @JvmField var Powers: Long = 0L
        @JvmField var RoleID: UUID? = null
        @JvmField var Title: ByteArray? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        var i = 57
        val it = RoleData_Fields.iterator()
        while (true) {
            val i2 = i
            if (!it.hasNext()) {
                return i2
            }
            val roleData = it.next()
            i = roleData.Description!!.size + roleData.Name!!.size + 17 + 1 + roleData.Title!!.size + 1 + 8 + 4 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleGroupRoleDataReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 372 (GroupRoleDataReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x74).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, GroupData_Field.GroupID)
        packUUID(byteBuffer, GroupData_Field.RequestID)
        packInt(byteBuffer, GroupData_Field.RoleCount)
        byteBuffer.put((RoleData_Fields.size.toByte()))
        for (roleData in RoleData_Fields) {
            packUUID(byteBuffer, roleData.RoleID)
            packVariable(byteBuffer, roleData.Name, 1)
            packVariable(byteBuffer, roleData.Title, 1)
            packVariable(byteBuffer, roleData.Description, 1)
            packLong(byteBuffer, roleData.Powers)
            packInt(byteBuffer, roleData.Members)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        GroupData_Field.GroupID = unpackUUID(byteBuffer)
        GroupData_Field.RequestID = unpackUUID(byteBuffer)
        GroupData_Field.RoleCount = unpackInt(byteBuffer)
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val roleData = RoleData()
            roleData.RoleID = unpackUUID(byteBuffer)
            roleData.Name = unpackVariable(byteBuffer, 1)
            roleData.Title = unpackVariable(byteBuffer, 1)
            roleData.Description = unpackVariable(byteBuffer, 1)
            roleData.Powers = unpackLong(byteBuffer)
            roleData.Members = unpackInt(byteBuffer)
            RoleData_Fields.add(roleData)
        }
    }
}
