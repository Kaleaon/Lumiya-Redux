package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * GroupRoleChanges
 * viewer -> simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code GroupRoleChanges Low 342 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class GroupRoleChanges : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val RoleChange_Fields = ArrayList<RoleChange>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var GroupID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block RoleChange, Variable. */
    open class RoleChange {
        @JvmField var Change: Int = 0
        @JvmField var MemberID: UUID? = null
        @JvmField var RoleID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (RoleChange_Fields.size * 36) + 53
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleGroupRoleChanges(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 342 (GroupRoleChanges).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x56).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, AgentData_Field.GroupID)
        byteBuffer.put((RoleChange_Fields.size.toByte()))
        for (roleChange in RoleChange_Fields) {
            packUUID(byteBuffer, roleChange.RoleID)
            packUUID(byteBuffer, roleChange.MemberID)
            packInt(byteBuffer, roleChange.Change)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        AgentData_Field.GroupID = unpackUUID(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val roleChange = RoleChange()
            roleChange.RoleID = unpackUUID(byteBuffer)
            roleChange.MemberID = unpackUUID(byteBuffer)
            roleChange.Change = unpackInt(byteBuffer)
            RoleChange_Fields.add(roleChange)
        }
    }
}
