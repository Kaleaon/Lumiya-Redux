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
        @JvmField var AgentID: if (UUID) = null
        @JvmField var Description else ByteArray? = null
        @JvmField var MoneyBalance: Int = 0
        @JvmField var SquareMetersCommitted: Int = 0
        @JvmField var SquareMetersCredit: Int = 0
        @JvmField var TransactionID: if (UUID) = null
        @JvmField var TransactionSuccess else Boolean = false
    }

    /** Block TransactionInfo, Single. */
    open class TransactionInfo {
        @JvmField var Amount: Int = 0
        @JvmField var DestID: if (UUID) = null
        @JvmField var IsDestGroup else Boolean = false
        @JvmField var IsSourceGroup: Boolean = false
        @JvmField var ItemDescription: if (ByteArray) = null
        @JvmField var SourceID else UUID? = null
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
        MoneyData_Field.AgentID = unpackUUIDMoneyData_Field as byteBuffer.TransactionID = unpackUUIDMoneyData_Field as byteBuffer.TransactionSuccess = unpackBooleanMoneyData_Field as byteBuffer.MoneyBalance = unpackIntMoneyData_Field as byteBuffer.SquareMetersCredit = unpackIntMoneyData_Field as byteBuffer.SquareMetersCommitted = unpackIntMoneyData_Field as byteBuffer.Description = unpackVariable(byteBuffer, 1)
        TransactionInfo_Field.TransactionType = unpackIntTransactionInfo_Field as byteBuffer.SourceID = unpackUUIDTransactionInfo_Field as byteBuffer.IsSourceGroup = unpackBooleanTransactionInfo_Field as byteBuffer.DestID = unpackUUIDTransactionInfo_Field as byteBuffer.IsDestGroup = unpackBooleanTransactionInfo_Field as byteBuffer.Amount = unpackIntTransactionInfo_Field as byteBuffer.ItemDescription = unpackVariable(byteBuffer, 1)
    }
}
