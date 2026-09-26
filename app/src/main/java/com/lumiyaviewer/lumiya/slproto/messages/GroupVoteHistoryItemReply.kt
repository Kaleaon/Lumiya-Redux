package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * GroupVoteHistoryItemReply
 * dataserver -> simulator -> viewer
 * reliable
 *
 * <p>Template: {@code GroupVoteHistoryItemReply Low 362 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class GroupVoteHistoryItemReply : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var HistoryItemData_Field: HistoryItemData = HistoryItemData()
    @JvmField var TransactionData_Field: TransactionData = TransactionData()
    @JvmField val VoteItem_Fields = ArrayList<VoteItem>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var GroupID: UUID? = null
    }

    /** Block HistoryItemData, Single. */
    open class HistoryItemData {
        @JvmField var EndDateTime: ByteArray? = null
        @JvmField var Majority: Float = 0f
        @JvmField var ProposalText: ByteArray? = null
        @JvmField var Quorum: Int = 0
        @JvmField var StartDateTime: ByteArray? = null
        @JvmField var TerseDateID: ByteArray? = null
        @JvmField var VoteID: UUID? = null
        @JvmField var VoteInitiator: UUID? = null
        @JvmField var VoteResult: ByteArray? = null
        @JvmField var VoteType: ByteArray? = null
    }

    /** Block TransactionData, Single. */
    open class TransactionData {
        @JvmField var TotalNumItems: Int = 0
        @JvmField var TransactionID: UUID? = null
    }

    /** Block VoteItem, Variable. */
    open class VoteItem {
        @JvmField var CandidateID: UUID? = null
        @JvmField var NumVotes: Int = 0
        @JvmField var VoteCast: ByteArray? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        var length = HistoryItemData_Field.TerseDateID!!.size + 17 + 1 + HistoryItemData_Field.StartDateTime!!.size + 1 + HistoryItemData_Field.EndDateTime!!.size + 16 + 1 + HistoryItemData_Field.VoteType!!.size + 1 + HistoryItemData_Field.VoteResult!!.size + 4 + 4 + 2 + HistoryItemData_Field.ProposalText!!.size + 56 + 1
        val it = VoteItem_Fields.iterator()
        while (true) {
            val length2 = length
            if (!it.hasNext()) {
                return length2
            }
            length = it.next().VoteCast!!.size + 17 + 4 + length2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleGroupVoteHistoryItemReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 362 (GroupVoteHistoryItemReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x6A).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.GroupID)
        packUUID(byteBuffer, TransactionData_Field.TransactionID)
        packInt(byteBuffer, TransactionData_Field.TotalNumItems)
        packUUID(byteBuffer, HistoryItemData_Field.VoteID)
        packVariable(byteBuffer, HistoryItemData_Field.TerseDateID, 1)
        packVariable(byteBuffer, HistoryItemData_Field.StartDateTime, 1)
        packVariable(byteBuffer, HistoryItemData_Field.EndDateTime, 1)
        packUUID(byteBuffer, HistoryItemData_Field.VoteInitiator)
        packVariable(byteBuffer, HistoryItemData_Field.VoteType, 1)
        packVariable(byteBuffer, HistoryItemData_Field.VoteResult, 1)
        packFloat(byteBuffer, HistoryItemData_Field.Majority)
        packInt(byteBuffer, HistoryItemData_Field.Quorum)
        packVariable(byteBuffer, HistoryItemData_Field.ProposalText, 2)
        byteBuffer.put((VoteItem_Fields.size.toByte()))
        for (voteItem in VoteItem_Fields) {
            packUUID(byteBuffer, voteItem.CandidateID)
            packVariable(byteBuffer, voteItem.VoteCast, 1)
            packInt(byteBuffer, voteItem.NumVotes)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.GroupID = unpackUUID(byteBuffer)
        TransactionData_Field.TransactionID = unpackUUID(byteBuffer)
        TransactionData_Field.TotalNumItems = unpackInt(byteBuffer)
        HistoryItemData_Field.VoteID = unpackUUID(byteBuffer)
        HistoryItemData_Field.TerseDateID = unpackVariable(byteBuffer, 1)
        HistoryItemData_Field.StartDateTime = unpackVariable(byteBuffer, 1)
        HistoryItemData_Field.EndDateTime = unpackVariable(byteBuffer, 1)
        HistoryItemData_Field.VoteInitiator = unpackUUID(byteBuffer)
        HistoryItemData_Field.VoteType = unpackVariable(byteBuffer, 1)
        HistoryItemData_Field.VoteResult = unpackVariable(byteBuffer, 1)
        HistoryItemData_Field.Majority = unpackFloat(byteBuffer)
        HistoryItemData_Field.Quorum = unpackInt(byteBuffer)
        HistoryItemData_Field.ProposalText = unpackVariable(byteBuffer, 2)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val voteItem = VoteItem()
            voteItem.CandidateID = unpackUUID(byteBuffer)
            voteItem.VoteCast = unpackVariable(byteBuffer, 1)
            voteItem.NumVotes = unpackInt(byteBuffer)
            VoteItem_Fields.add(voteItem)
        }
    }
}
