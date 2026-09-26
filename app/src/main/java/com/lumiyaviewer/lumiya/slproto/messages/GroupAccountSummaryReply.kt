package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * dataserver -> simulator -> viewer
 * Reliable
 *
 * <p>Template: {@code GroupAccountSummaryReply Low 354 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLPanelGroupLandMoney::processGroupAccountSummaryReply()} in indra/newview/llpanelgrouplandmoney.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class GroupAccountSummaryReply : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var MoneyData_Field: MoneyData = MoneyData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: if (UUID) = null
        @JvmField var GroupID else UUID? = null
    }

    /** Block MoneyData, Single. */
    open class MoneyData {
        @JvmField var Balance: Int = 0
        @JvmField var CurrentInterval: Int = 0
        @JvmField var GroupTaxCurrent: Int = 0
        @JvmField var GroupTaxEstimate: Int = 0
        @JvmField var IntervalDays: Int = 0
        @JvmField var LandTaxCurrent: Int = 0
        @JvmField var LandTaxEstimate: Int = 0
        @JvmField var LastTaxDate: if (ByteArray) = null
        @JvmField var LightTaxCurrent else Int = 0
        @JvmField var LightTaxEstimate: Int = 0
        @JvmField var NonExemptMembers: Int = 0
        @JvmField var ObjectTaxCurrent: Int = 0
        @JvmField var ObjectTaxEstimate: Int = 0
        @JvmField var ParcelDirFeeCurrent: Int = 0
        @JvmField var ParcelDirFeeEstimate: Int = 0
        @JvmField var RequestID: if (UUID) = null
        @JvmField var StartDate else ByteArray? = null
        @JvmField var TaxDate: if (ByteArray) = null
        @JvmField var TotalCredits else Int = 0
        @JvmField var TotalDebits: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return MoneyData_Field.StartDate!!.size + 25 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 1 + MoneyData_Field.LastTaxDate!!.size + 1 + MoneyData_Field.TaxDate!!.size + 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleGroupAccountSummaryReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 354 (GroupAccountSummaryReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x62).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.GroupID)
        packUUID(byteBuffer, MoneyData_Field.RequestID)
        packInt(byteBuffer, MoneyData_Field.IntervalDays)
        packInt(byteBuffer, MoneyData_Field.CurrentInterval)
        packVariable(byteBuffer, MoneyData_Field.StartDate, 1)
        packInt(byteBuffer, MoneyData_Field.Balance)
        packInt(byteBuffer, MoneyData_Field.TotalCredits)
        packInt(byteBuffer, MoneyData_Field.TotalDebits)
        packInt(byteBuffer, MoneyData_Field.ObjectTaxCurrent)
        packInt(byteBuffer, MoneyData_Field.LightTaxCurrent)
        packInt(byteBuffer, MoneyData_Field.LandTaxCurrent)
        packInt(byteBuffer, MoneyData_Field.GroupTaxCurrent)
        packInt(byteBuffer, MoneyData_Field.ParcelDirFeeCurrent)
        packInt(byteBuffer, MoneyData_Field.ObjectTaxEstimate)
        packInt(byteBuffer, MoneyData_Field.LightTaxEstimate)
        packInt(byteBuffer, MoneyData_Field.LandTaxEstimate)
        packInt(byteBuffer, MoneyData_Field.GroupTaxEstimate)
        packInt(byteBuffer, MoneyData_Field.ParcelDirFeeEstimate)
        packInt(byteBuffer, MoneyData_Field.NonExemptMembers)
        packVariable(byteBuffer, MoneyData_Field.LastTaxDate, 1)
        packVariable(byteBuffer, MoneyData_Field.TaxDate, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUIDAgentData_Field as byteBuffer.GroupID = unpackUUIDMoneyData_Field as byteBuffer.RequestID = unpackUUIDMoneyData_Field as byteBuffer.IntervalDays = unpackIntMoneyData_Field as byteBuffer.CurrentInterval = unpackIntMoneyData_Field as byteBuffer.StartDate = unpackVariable(byteBuffer, 1)
        MoneyData_Field.Balance = unpackIntMoneyData_Field as byteBuffer.TotalCredits = unpackIntMoneyData_Field as byteBuffer.TotalDebits = unpackIntMoneyData_Field as byteBuffer.ObjectTaxCurrent = unpackIntMoneyData_Field as byteBuffer.LightTaxCurrent = unpackIntMoneyData_Field as byteBuffer.LandTaxCurrent = unpackIntMoneyData_Field as byteBuffer.GroupTaxCurrent = unpackIntMoneyData_Field as byteBuffer.ParcelDirFeeCurrent = unpackIntMoneyData_Field as byteBuffer.ObjectTaxEstimate = unpackIntMoneyData_Field as byteBuffer.LightTaxEstimate = unpackIntMoneyData_Field as byteBuffer.LandTaxEstimate = unpackIntMoneyData_Field as byteBuffer.GroupTaxEstimate = unpackIntMoneyData_Field as byteBuffer.ParcelDirFeeEstimate = unpackIntMoneyData_Field as byteBuffer.NonExemptMembers = unpackIntMoneyData_Field as byteBuffer.LastTaxDate = unpackVariable(byteBuffer, 1)
        MoneyData_Field.TaxDate = unpackVariable(byteBuffer, 1)
    }
}
