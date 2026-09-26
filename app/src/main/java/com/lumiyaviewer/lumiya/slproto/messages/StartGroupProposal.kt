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
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block ProposalData, Single. */
    open class ProposalData {
        @JvmField var Duration: Int = 0
        @JvmField var GroupID: UUID? = null
        @JvmField var Majority: Float = 0f
        @JvmField var ProposalText: ByteArray? = null
        @JvmField var Quorum: Int = 0
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
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        ProposalData_Field.GroupID = unpackUUID(byteBuffer)
        ProposalData_Field.Quorum = unpackInt(byteBuffer)
        ProposalData_Field.Majority = unpackFloat(byteBuffer)
        ProposalData_Field.Duration = unpackInt(byteBuffer)
        ProposalData_Field.ProposalText = unpackVariable(byteBuffer, 1)
    }
}
