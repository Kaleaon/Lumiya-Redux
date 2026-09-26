package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Save State
 * viewer->sim
 * requires administrative access
 *
 * <p>Template: {@code StateSave Low 127 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class StateSave : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var DataBlock_Field: DataBlock = DataBlock()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block DataBlock, Single. */
    open class DataBlock {
        @JvmField var Filename: ByteArray? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return DataBlock_Field.Filename!!.size + 1 + 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleStateSave(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 127 (StateSave).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x7F).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packVariable(byteBuffer, DataBlock_Field.Filename, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        DataBlock_Field.Filename = unpackVariable(byteBuffer, 1)
    }
}
