package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Reliable
 *
 * <p>Template: {@code GroupAccountDetailsRequest Low 355 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class GroupAccountDetailsRequest : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var MoneyData_Field: MoneyData = MoneyData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var GroupID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block MoneyData, Single. */
    open class MoneyData {
        @JvmField var CurrentInterval: Int = 0
        @JvmField var IntervalDays: Int = 0
        @JvmField var RequestID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 76
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleGroupAccountDetailsRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 355 (GroupAccountDetailsRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x63).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, AgentData_Field.GroupID)
        packUUID(byteBuffer, MoneyData_Field.RequestID)
        packInt(byteBuffer, MoneyData_Field.IntervalDays)
        packInt(byteBuffer, MoneyData_Field.CurrentInterval)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        AgentData_Field.GroupID = unpackUUID(byteBuffer)
        MoneyData_Field.RequestID = unpackUUID(byteBuffer)
        MoneyData_Field.IntervalDays = unpackInt(byteBuffer)
        MoneyData_Field.CurrentInterval = unpackInt(byteBuffer)
    }
}
