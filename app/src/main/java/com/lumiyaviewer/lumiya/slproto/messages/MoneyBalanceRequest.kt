package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * viewer -> userserver -> dataserver
 * Reliable
 *
 * <p>Template: {@code MoneyBalanceRequest Low 313 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class MoneyBalanceRequest : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var MoneyData_Field: MoneyData = MoneyData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block MoneyData, Single. */
    open class MoneyData {
        @JvmField var TransactionID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 52
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleMoneyBalanceRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 313 (MoneyBalanceRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x39).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, MoneyData_Field.TransactionID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        MoneyData_Field.TransactionID = unpackUUID(byteBuffer)
    }
}
