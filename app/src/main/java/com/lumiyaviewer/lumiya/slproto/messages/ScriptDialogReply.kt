package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ScriptDialogReply
 * viewer -> sim
 * reliable
 *
 * <p>Template: {@code ScriptDialogReply Low 191 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class ScriptDialogReply : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var Data_Field: Data = Data()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block Data, Single. */
    open class Data {
        @JvmField var ButtonIndex: Int = 0
        @JvmField var ButtonLabel: ByteArray? = null
        @JvmField var ChatChannel: Int = 0
        @JvmField var ObjectID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return Data_Field.ButtonLabel!!.size + 25 + 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleScriptDialogReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 191 (ScriptDialogReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xBF).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, Data_Field.ObjectID)
        packInt(byteBuffer, Data_Field.ChatChannel)
        packInt(byteBuffer, Data_Field.ButtonIndex)
        packVariable(byteBuffer, Data_Field.ButtonLabel, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        Data_Field.ObjectID = unpackUUID(byteBuffer)
        Data_Field.ChatChannel = unpackInt(byteBuffer)
        Data_Field.ButtonIndex = unpackInt(byteBuffer)
        Data_Field.ButtonLabel = unpackVariable(byteBuffer, 1)
    }
}
