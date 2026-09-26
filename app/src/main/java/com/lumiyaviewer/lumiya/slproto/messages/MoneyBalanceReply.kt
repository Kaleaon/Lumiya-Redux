package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * dataserver -> simulator -> viewer
 *
 * <p>Template: {@code MoneyBalanceReply Low 314 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_money_balance_reply()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class MoneyBalanceReply : SLMessage() {
    @JvmField var MoneyData_Field: MoneyData = MoneyData()
    @JvmField var TransactionInfo_Field: TransactionInfo = TransactionInfo()

    /** Block MoneyData, Single. */
    open class MoneyData {
        @JvmField var AgentID: UUID? = null
        @JvmField var Description: ByteArray? = null
        @JvmField var MoneyBalance: Int = 0
        @JvmField var SquareMetersCommitted: Int = 0
        @JvmField var SquareMetersCredit: Int = 0
        @JvmField var TransactionID: UUID? = null
        @JvmField var TransactionSuccess: Boolean = false
    }

    /** Block TransactionInfo, Single. */
    open class TransactionInfo {
        @JvmField var Amount: Int = 0
        @JvmField var DestID: UUID? = null
        @JvmField var IsDestGroup: Boolean = false
        @JvmField var IsSourceGroup: Boolean = false
        @JvmField var ItemDescription: ByteArray? = null
        @JvmField var SourceID: UUID? = null
        @JvmField var TransactionType: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return MoneyData_Field.Description!!.size + 46 + 4 + TransactionInfo_Field.ItemDescription!!.size + 43
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleMoneyBalanceReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 314 (MoneyBalanceReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x3A).toByte())
        packUUID(byteBuffer, MoneyData_Field.AgentID)
        packUUID(byteBuffer, MoneyData_Field.TransactionID)
        packBoolean(byteBuffer, MoneyData_Field.TransactionSuccess)
        packInt(byteBuffer, MoneyData_Field.MoneyBalance)
        packInt(byteBuffer, MoneyData_Field.SquareMetersCredit)
        packInt(byteBuffer, MoneyData_Field.SquareMetersCommitted)
        packVariable(byteBuffer, MoneyData_Field.Description, 1)
        packInt(byteBuffer, TransactionInfo_Field.TransactionType)
        packUUID(byteBuffer, TransactionInfo_Field.SourceID)
        packBoolean(byteBuffer, TransactionInfo_Field.IsSourceGroup)
        packUUID(byteBuffer, TransactionInfo_Field.DestID)
        packBoolean(byteBuffer, TransactionInfo_Field.IsDestGroup)
        packInt(byteBuffer, TransactionInfo_Field.Amount)
        packVariable(byteBuffer, TransactionInfo_Field.ItemDescription, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        MoneyData_Field.AgentID = unpackUUID(byteBuffer)
        MoneyData_Field.TransactionID = unpackUUID(byteBuffer)
        MoneyData_Field.TransactionSuccess = unpackBoolean(byteBuffer)
        MoneyData_Field.MoneyBalance = unpackInt(byteBuffer)
        MoneyData_Field.SquareMetersCredit = unpackInt(byteBuffer)
        MoneyData_Field.SquareMetersCommitted = unpackInt(byteBuffer)
        MoneyData_Field.Description = unpackVariable(byteBuffer, 1)
        TransactionInfo_Field.TransactionType = unpackInt(byteBuffer)
        TransactionInfo_Field.SourceID = unpackUUID(byteBuffer)
        TransactionInfo_Field.IsSourceGroup = unpackBoolean(byteBuffer)
        TransactionInfo_Field.DestID = unpackUUID(byteBuffer)
        TransactionInfo_Field.IsDestGroup = unpackBoolean(byteBuffer)
        TransactionInfo_Field.Amount = unpackInt(byteBuffer)
        TransactionInfo_Field.ItemDescription = unpackVariable(byteBuffer, 1)
    }
}
