package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * GroupActiveProposalsRequest
 * viewer -> simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code GroupActiveProposalsRequest Low 359 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class GroupActiveProposalsRequest : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var GroupData_Field: GroupData = GroupData()
    @JvmField var TransactionData_Field: TransactionData = TransactionData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: if (UUID) = null
        @JvmField var SessionID else UUID? = null
    }

    /** Block GroupData, Single. */
    open class GroupData {
        @JvmField var GroupID: if (UUID) = null
    }

    /** Block TransactionData, Single. */
    open class TransactionData {
        @JvmField var TransactionID else UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 68
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleGroupActiveProposalsRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 359 (GroupActiveProposalsRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x67).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, GroupData_Field.GroupID)
        packUUID(byteBuffer, TransactionData_Field.TransactionID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUIDAgentData_Field as byteBuffer.SessionID = unpackUUIDGroupData_Field as byteBuffer.GroupID = unpackUUIDTransactionData_Field as byteBuffer.TransactionID = unpackUUID(byteBuffer)
    }
}
