package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * GroupProposalBallot
 * viewer -> simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code GroupProposalBallot Low 364 NotTrusted Unencoded UDPDeprecated}
 * (recovered/reference/message_template.msg).
 */
open class GroupProposalBallot : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var ProposalData_Field: ProposalData = ProposalData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block ProposalData, Single. */
    open class ProposalData {
        @JvmField var GroupID: UUID? = null
        @JvmField var ProposalID: UUID? = null
        @JvmField var VoteCast: ByteArray? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return ProposalData_Field.VoteCast!!.size + 33 + 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleGroupProposalBallot(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 364 (GroupProposalBallot).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x6C).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, ProposalData_Field.ProposalID)
        packUUID(byteBuffer, ProposalData_Field.GroupID)
        packVariable(byteBuffer, ProposalData_Field.VoteCast, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        ProposalData_Field.ProposalID = unpackUUID(byteBuffer)
        ProposalData_Field.GroupID = unpackUUID(byteBuffer)
        ProposalData_Field.VoteCast = unpackVariable(byteBuffer, 1)
    }
}
