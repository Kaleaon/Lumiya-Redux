package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * Reliable
 *
 * <p>Template: {@code GroupAccountDetailsReply Low 356 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLPanelGroupLandMoney::processGroupAccountDetailsReply()} in indra/newview/llpanelgrouplandmoney.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class GroupAccountDetailsReply : SLMessage() {
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
        @JvmField var Description: ByteArray? = null
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
            length = it.next().Description!!.size + 1 + 4 + length2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleGroupAccountDetailsReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 356 (GroupAccountDetailsReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x64).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.GroupID)
        packUUID(byteBuffer, MoneyData_Field.RequestID)
        packInt(byteBuffer, MoneyData_Field.IntervalDays)
        packInt(byteBuffer, MoneyData_Field.CurrentInterval)
        packVariable(byteBuffer, MoneyData_Field.StartDate, 1)
        byteBuffer.put((HistoryData_Fields.size.toByte()))
        for (historyData in HistoryData_Fields) {
            packVariable(byteBuffer, historyData.Description, 1)
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
            historyData.Description = unpackVariable(byteBuffer, 1)
            historyData.Amount = unpackInt(byteBuffer)
            HistoryData_Fields.add(historyData)
        }
    }
}
