package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * Reliable
 *
 * <p>Template: {@code GroupAccountTransactionsReply Low 358 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLPanelGroupLandMoney::processGroupAccountTransactionsReply()} in indra/newview/llpanelgrouplandmoney.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class GroupAccountTransactionsReply : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val HistoryData_Fields = ArrayList<HistoryData>()
    @JvmField var MoneyData_Field: MoneyData = MoneyData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var GroupID: UUID? = null
    }

    /** Block HistoryData, Variable. */
    open class HistoryData {
        @JvmField var Amount: Int = 0
        @JvmField var Item: ByteArray? = null
        @JvmField var Time: ByteArray? = null
        @JvmField var Type: Int = 0
        @JvmField var User: ByteArray? = null
    }

    /** Block MoneyData, Single. */
    open class MoneyData {
        @JvmField var CurrentInterval: Int = 0
        @JvmField var IntervalDays: Int = 0
        @JvmField var RequestID: UUID? = null
        @JvmField var StartDate: ByteArray? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        var length = MoneyData_Field.StartDate!!.size + 25 + 36 + 1
        val it = HistoryData_Fields.iterator()
        while (true) {
            val length2 = length
            if (!it.hasNext()) {
                return length2
            }
            val historyData = it.next()
            length = historyData.Item!!.size + historyData.Time!!.size + 1 + 1 + historyData.User!!.size + 4 + 1 + 4 + length2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleGroupAccountTransactionsReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 358 (GroupAccountTransactionsReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x66).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.GroupID)
        packUUID(byteBuffer, MoneyData_Field.RequestID)
        packInt(byteBuffer, MoneyData_Field.IntervalDays)
        packInt(byteBuffer, MoneyData_Field.CurrentInterval)
        packVariable(byteBuffer, MoneyData_Field.StartDate, 1)
        byteBuffer.put((HistoryData_Fields.size.toByte()))
        for (historyData in HistoryData_Fields) {
            packVariable(byteBuffer, historyData.Time, 1)
            packVariable(byteBuffer, historyData.User, 1)
            packInt(byteBuffer, historyData.Type)
            packVariable(byteBuffer, historyData.Item, 1)
            packInt(byteBuffer, historyData.Amount)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.GroupID = unpackUUID(byteBuffer)
        MoneyData_Field.RequestID = unpackUUID(byteBuffer)
        MoneyData_Field.IntervalDays = unpackInt(byteBuffer)
        MoneyData_Field.CurrentInterval = unpackInt(byteBuffer)
        MoneyData_Field.StartDate = unpackVariable(byteBuffer, 1)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val historyData = HistoryData()
            historyData.Time = unpackVariable(byteBuffer, 1)
            historyData.User = unpackVariable(byteBuffer, 1)
            historyData.Type = unpackInt(byteBuffer)
            historyData.Item = unpackVariable(byteBuffer, 1)
            historyData.Amount = unpackInt(byteBuffer)
            HistoryData_Fields.add(historyData)
        }
    }
}
