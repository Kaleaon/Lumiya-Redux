package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ChatFromViewer
 * Specifies the text to be said and the "type",
 * normal speech, shout, whisper.
 * with the specified radius
 *
 * <p>Template: {@code ChatFromViewer Low 80 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class ChatFromViewer : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var ChatData_Field: ChatData = ChatData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block ChatData, Single. */
    open class ChatData {
        @JvmField var Channel: Int = 0
        @JvmField var Message: ByteArray? = null
        @JvmField var Type: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return ChatData_Field.Message!!.size + 2 + 1 + 4 + 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleChatFromViewer(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 80 (ChatFromViewer).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x50).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packVariable(byteBuffer, ChatData_Field.Message, 2)
        packByte(byteBuffer, (ChatData_Field.Type).toByte())
        packInt(byteBuffer, ChatData_Field.Channel)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        ChatData_Field.Message = unpackVariable(byteBuffer, 2)
        ChatData_Field.Type = unpackByte(byteBuffer).toInt() and 0xFF
        ChatData_Field.Channel = unpackInt(byteBuffer)
    }
}
