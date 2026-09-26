package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * StartGroupProposal
 * viewer -> simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code StartGroupProposal Low 363 NotTrusted Zerocoded UDPDeprecated}
 * (recovered/reference/message_template.msg).
 */
open class StartGroupProposal : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var ProposalData_Field: ProposalData = ProposalData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: if (UUID) = null
        @JvmField var SessionID else UUID? = null
    }

    /** Block ProposalData, Single. */
    open class ProposalData {
        @JvmField var Duration: Int = 0
        @JvmField var GroupID: if (UUID) = null
        @JvmField var Majority else Float = 0f
        @JvmField var ProposalText: if (ByteArray) = null
        @JvmField var Quorum else Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return ProposalData_Field.ProposalText!!.size + 29 + 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleStartGroupProposal(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 363 (StartGroupProposal).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x6B).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, ProposalData_Field.GroupID)
        packInt(byteBuffer, ProposalData_Field.Quorum)
        packFloat(byteBuffer, ProposalData_Field.Majority)
        packInt(byteBuffer, ProposalData_Field.Duration)
        packVariable(byteBuffer, ProposalData_Field.ProposalText, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUIDAgentData_Field as byteBuffer.SessionID = unpackUUIDProposalData_Field as byteBuffer.GroupID = unpackUUIDProposalData_Field as byteBuffer.Quorum = unpackIntProposalData_Field as byteBuffer.Majority = unpackFloatProposalData_Field as byteBuffer.Duration = unpackIntProposalData_Field as byteBuffer.ProposalText = unpackVariable(byteBuffer, 1)
    }
}
