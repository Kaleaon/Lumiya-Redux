package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * InviteGroupRequest
 * viewer -> simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code InviteGroupRequest Low 349 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class InviteGroupRequest : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var GroupData_Field: GroupData = GroupData()
    @JvmField val InviteData_Fields = ArrayList<InviteData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block GroupData, Single. */
    open class GroupData {
        @JvmField var GroupID: UUID? = null
    }

    /** Block InviteData, Variable. */
    open class InviteData {
        @JvmField var InviteeID: UUID? = null
        @JvmField var RoleID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (InviteData_Fields.size * 32) + 53
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleInviteGroupRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 349 (InviteGroupRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x5D).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, GroupData_Field.GroupID)
        byteBuffer.put((InviteData_Fields.size.toByte()))
        for (inviteData in InviteData_Fields) {
            packUUID(byteBuffer, inviteData.InviteeID)
            packUUID(byteBuffer, inviteData.RoleID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        GroupData_Field.GroupID = unpackUUID(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val inviteData = InviteData()
            inviteData.InviteeID = unpackUUID(byteBuffer)
            inviteData.RoleID = unpackUUID(byteBuffer)
            InviteData_Fields.add(inviteData)
        }
    }
}
