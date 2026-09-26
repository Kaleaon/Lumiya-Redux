package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * GroupActiveProposalItemReply
 * dataserver -> simulator -> viewer
 * reliable
 *
 * <p>Template: {@code GroupActiveProposalItemReply Low 360 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class GroupActiveProposalItemReply : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val ProposalData_Fields = ArrayList<ProposalData>()
    @JvmField var TransactionData_Field: TransactionData = TransactionData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var GroupID: UUID? = null
    }

    /** Block ProposalData, Variable. */
    open class ProposalData {
        @JvmField var AlreadyVoted: Boolean = false
        @JvmField var EndDateTime: ByteArray? = null
        @JvmField var Majority: Float = 0f
        @JvmField var ProposalText: ByteArray? = null
        @JvmField var Quorum: Int = 0
        @JvmField var StartDateTime: ByteArray? = null
        @JvmField var TerseDateID: ByteArray? = null
        @JvmField var VoteCast: ByteArray? = null
        @JvmField var VoteID: UUID? = null
        @JvmField var VoteInitiator: UUID? = null
    }

    /** Block TransactionData, Single. */
    open class TransactionData {
        @JvmField var TotalNumItems: Int = 0
        @JvmField var TransactionID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        var i = 57
        val it = ProposalData_Fields.iterator()
        while (true) {
            val i2 = i
            if (!it.hasNext()) {
                return i2
            }
            val proposalData = it.next()
            i = proposalData.ProposalText!!.size + proposalData.TerseDateID!!.size + 33 + 1 + proposalData.StartDateTime!!.size + 1 + proposalData.EndDateTime!!.size + 1 + 1 + proposalData.VoteCast!!.size + 4 + 4 + 1 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleGroupActiveProposalItemReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 360 (GroupActiveProposalItemReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x68).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.GroupID)
        packUUID(byteBuffer, TransactionData_Field.TransactionID)
        packInt(byteBuffer, TransactionData_Field.TotalNumItems)
        byteBuffer.put((ProposalData_Fields.size.toByte()))
        for (proposalData in ProposalData_Fields) {
            packUUID(byteBuffer, proposalData.VoteID)
            packUUID(byteBuffer, proposalData.VoteInitiator)
            packVariable(byteBuffer, proposalData.TerseDateID, 1)
            packVariable(byteBuffer, proposalData.StartDateTime, 1)
            packVariable(byteBuffer, proposalData.EndDateTime, 1)
            packBoolean(byteBuffer, proposalData.AlreadyVoted)
            packVariable(byteBuffer, proposalData.VoteCast, 1)
            packFloat(byteBuffer, proposalData.Majority)
            packInt(byteBuffer, proposalData.Quorum)
            packVariable(byteBuffer, proposalData.ProposalText, 1)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.GroupID = unpackUUID(byteBuffer)
        TransactionData_Field.TransactionID = unpackUUID(byteBuffer)
        TransactionData_Field.TotalNumItems = unpackInt(byteBuffer)
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val proposalData = ProposalData()
            proposalData.VoteID = unpackUUID(byteBuffer)
            proposalData.VoteInitiator = unpackUUID(byteBuffer)
            proposalData.TerseDateID = unpackVariable(byteBuffer, 1)
            proposalData.StartDateTime = unpackVariable(byteBuffer, 1)
            proposalData.EndDateTime = unpackVariable(byteBuffer, 1)
            proposalData.AlreadyVoted = unpackBoolean(byteBuffer)
            proposalData.VoteCast = unpackVariable(byteBuffer, 1)
            proposalData.Majority = unpackFloat(byteBuffer)
            proposalData.Quorum = unpackInt(byteBuffer)
            proposalData.ProposalText = unpackVariable(byteBuffer, 1)
            ProposalData_Fields.add(proposalData)
        }
    }
}
