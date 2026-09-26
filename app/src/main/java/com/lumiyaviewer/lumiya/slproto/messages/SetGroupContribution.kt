package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * viewer -> simulator -> dataserver
 *
 * <p>Template: {@code SetGroupContribution Low 369 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class SetGroupContribution : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var Data_Field: Data = Data()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block Data, Single. */
    open class Data {
        @JvmField var Contribution: Int = 0
        @JvmField var GroupID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 56
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleSetGroupContribution(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 369 (SetGroupContribution).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x71).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, Data_Field.GroupID)
        packInt(byteBuffer, Data_Field.Contribution)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        Data_Field.GroupID = unpackUUID(byteBuffer)
        Data_Field.Contribution = unpackInt(byteBuffer)
    }
}
