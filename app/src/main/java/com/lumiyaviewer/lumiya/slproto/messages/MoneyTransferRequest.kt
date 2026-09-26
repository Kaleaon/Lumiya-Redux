package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Move money from one agent to another. Validation will happen at the
 * simulator, the dataserver will actually do the work. Dataserver
 * generates a MoneyBalance message in reply.  The simulator
 * will generate a MoneyTransferBackend in response to
 * viewer -> simulator -> dataserver
 *
 * <p>Template: {@code MoneyTransferRequest Low 311 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class MoneyTransferRequest : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var MoneyData_Field: MoneyData = MoneyData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block MoneyData, Single. */
    open class MoneyData {
        @JvmField var AggregatePermInventory: Int = 0
        @JvmField var AggregatePermNextOwner: Int = 0
        @JvmField var Amount: Int = 0
        @JvmField var Description: ByteArray? = null
        @JvmField var DestID: UUID? = null
        @JvmField var Flags: Int = 0
        @JvmField var SourceID: UUID? = null
        @JvmField var TransactionType: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return MoneyData_Field.Description!!.size + 44 + 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleMoneyTransferRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 311 (MoneyTransferRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x37).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, MoneyData_Field.SourceID)
        packUUID(byteBuffer, MoneyData_Field.DestID)
        packByte(byteBuffer, (MoneyData_Field.Flags).toByte())
        packInt(byteBuffer, MoneyData_Field.Amount)
        packByte(byteBuffer, (MoneyData_Field.AggregatePermNextOwner).toByte())
        packByte(byteBuffer, (MoneyData_Field.AggregatePermInventory).toByte())
        packInt(byteBuffer, MoneyData_Field.TransactionType)
        packVariable(byteBuffer, MoneyData_Field.Description, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        MoneyData_Field.SourceID = unpackUUID(byteBuffer)
        MoneyData_Field.DestID = unpackUUID(byteBuffer)
        MoneyData_Field.Flags = unpackByte(byteBuffer).toInt() and 0xFF
        MoneyData_Field.Amount = unpackInt(byteBuffer)
        MoneyData_Field.AggregatePermNextOwner = unpackByte(byteBuffer).toInt() and 0xFF
        MoneyData_Field.AggregatePermInventory = unpackByte(byteBuffer).toInt() and 0xFF
        MoneyData_Field.TransactionType = unpackInt(byteBuffer)
        MoneyData_Field.Description = unpackVariable(byteBuffer, 1)
    }
}
