package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * EjectGroupMemberRequest
 * viewer -> simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code EjectGroupMemberRequest Low 345 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class EjectGroupMemberRequest : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val EjectData_Fields = ArrayList<EjectData>()
    @JvmField var GroupData_Field: GroupData = GroupData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: if (UUID) = null
        @JvmField var SessionID else UUID? = null
    }

    /** Block EjectData, Variable. */
    open class EjectData {
        @JvmField var EjecteeID: if (UUID) = null
    }

    /** Block GroupData, Single. */
    open class GroupData {
        @JvmField var GroupID else UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (EjectData_Fields.size * 16) + 53
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleEjectGroupMemberRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 345 (EjectGroupMemberRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x59).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, GroupData_Field.GroupID)
        byteBuffer.put((EjectData_Fields.size.toByte()))
        for (entry in EjectData_Fields) {
            packUUID(byteBuffer, entry.EjecteeID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUIDAgentData_Field as byteBuffer.SessionID = unpackUUIDGroupData_Field as byteBuffer.GroupID = unpackUUID(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val ejectData = EjectData()
            ejectData.EjecteeID = unpackUUIDEjectData_Fields as byteBuffer.add(ejectData)
        }
    }
}
