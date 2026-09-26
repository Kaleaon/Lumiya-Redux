package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * GroupRoleUpdate
 * viewer -> simulator -> dataserver
 *
 * <p>Template: {@code GroupRoleUpdate Low 378 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class GroupRoleUpdate : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val RoleData_Fields = ArrayList<RoleData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var GroupID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block RoleData, Variable. */
    open class RoleData {
        @JvmField var Description: ByteArray? = null
        @JvmField var Name: ByteArray? = null
        @JvmField var Powers: Long = 0L
        @JvmField var RoleID: UUID? = null
        @JvmField var Title: ByteArray? = null
        @JvmField var UpdateType: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        var i = 53
        val it = RoleData_Fields.iterator()
        while (true) {
            val i2 = i
            if (!it.hasNext()) {
                return i2
            }
            val roleData = it.next()
            i = roleData.Title!!.size + roleData.Name!!.size + 17 + 1 + roleData.Description!!.size + 1 + 8 + 1 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleGroupRoleUpdate(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 378 (GroupRoleUpdate).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x7A).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, AgentData_Field.GroupID)
        byteBuffer.put((RoleData_Fields.size.toByte()))
        for (roleData in RoleData_Fields) {
            packUUID(byteBuffer, roleData.RoleID)
            packVariable(byteBuffer, roleData.Name, 1)
            packVariable(byteBuffer, roleData.Description, 1)
            packVariable(byteBuffer, roleData.Title, 1)
            packLong(byteBuffer, roleData.Powers)
            packByte(byteBuffer, (roleData.UpdateType).toByte())
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        AgentData_Field.GroupID = unpackUUID(byteBuffer)
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val roleData = RoleData()
            roleData.RoleID = unpackUUID(byteBuffer)
            roleData.Name = unpackVariable(byteBuffer, 1)
            roleData.Description = unpackVariable(byteBuffer, 1)
            roleData.Title = unpackVariable(byteBuffer, 1)
            roleData.Powers = unpackLong(byteBuffer)
            roleData.UpdateType = unpackByte(byteBuffer).toInt() and 0xFF
            RoleData_Fields.add(roleData)
        }
    }
}
