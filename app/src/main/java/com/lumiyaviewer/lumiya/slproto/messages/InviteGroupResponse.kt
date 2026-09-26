package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * InviteGroupResponse
 * simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code InviteGroupResponse Low 350 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class InviteGroupResponse : SLMessage() {
    @JvmField var InviteData_Field: InviteData = InviteData()

    /** Block InviteData, Single. */
    open class InviteData {
        @JvmField var AgentID: UUID? = null
        @JvmField var GroupID: UUID? = null
        @JvmField var InviteeID: UUID? = null
        @JvmField var MembershipFee: Int = 0
        @JvmField var RoleID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 72
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleInviteGroupResponse(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 350 (InviteGroupResponse).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x5E).toByte())
        packUUID(byteBuffer, InviteData_Field.AgentID)
        packUUID(byteBuffer, InviteData_Field.InviteeID)
        packUUID(byteBuffer, InviteData_Field.GroupID)
        packUUID(byteBuffer, InviteData_Field.RoleID)
        packInt(byteBuffer, InviteData_Field.MembershipFee)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        InviteData_Field.AgentID = unpackUUID(byteBuffer)
        InviteData_Field.InviteeID = unpackUUID(byteBuffer)
        InviteData_Field.GroupID = unpackUUID(byteBuffer)
        InviteData_Field.RoleID = unpackUUID(byteBuffer)
        InviteData_Field.MembershipFee = unpackInt(byteBuffer)
    }
}
