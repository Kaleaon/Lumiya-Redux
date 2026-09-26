package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ScriptAnswerYes
 * reliable
 *
 * <p>Template: {@code ScriptAnswerYes Low 132 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class ScriptAnswerYes : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var Data_Field: Data = Data()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block Data, Single. */
    open class Data {
        @JvmField var ItemID: UUID? = null
        @JvmField var Questions: Int = 0
        @JvmField var TaskID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 72
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleScriptAnswerYes(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 132 (ScriptAnswerYes).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x84).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, Data_Field.TaskID)
        packUUID(byteBuffer, Data_Field.ItemID)
        packInt(byteBuffer, Data_Field.Questions)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        Data_Field.TaskID = unpackUUID(byteBuffer)
        Data_Field.ItemID = unpackUUID(byteBuffer)
        Data_Field.Questions = unpackInt(byteBuffer)
    }
}
