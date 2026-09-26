package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.UUID

/**
 * end uuid to name lookup
 * Simulator to Simulator Messages
 * ChatPass
 * Chat message transmission to neighbors
 * Chat is region local to receiving simulator.
 * Type is one of CHAT_TYPE_NORMAL, _WHISPER, _SHOUT
 *
 * <p>Template: {@code ChatPass Low 239 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class ChatPass : SLMessage() {
    @JvmField var ChatData_Field: ChatData = ChatData()

    /** Block ChatData, Single. */
    open class ChatData {
        @JvmField var Channel: Int = 0
        @JvmField var ID: UUID? = null
        @JvmField var Message: ByteArray? = null
        @JvmField var Name: ByteArray? = null
        @JvmField var OwnerID: UUID? = null
        @JvmField var Position: LLVector3? = null
        @JvmField var Radius: Float = 0f
        @JvmField var SimAccess: Int = 0
        @JvmField var SourceType: Int = 0
        @JvmField var Type: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return ChatData_Field.Name!!.size + 49 + 1 + 1 + 4 + 1 + 2 + ChatData_Field.Message!!.size + 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleChatPass(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 239 (ChatPass).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xEF).toByte())
        packInt(byteBuffer, ChatData_Field.Channel)
        packLLVector3(byteBuffer, ChatData_Field.Position)
        packUUID(byteBuffer, ChatData_Field.ID)
        packUUID(byteBuffer, ChatData_Field.OwnerID)
        packVariable(byteBuffer, ChatData_Field.Name, 1)
        packByte(byteBuffer, (ChatData_Field.SourceType).toByte())
        packByte(byteBuffer, (ChatData_Field.Type).toByte())
        packFloat(byteBuffer, ChatData_Field.Radius)
        packByte(byteBuffer, (ChatData_Field.SimAccess).toByte())
        packVariable(byteBuffer, ChatData_Field.Message, 2)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        ChatData_Field.Channel = unpackInt(byteBuffer)
        ChatData_Field.Position = unpackLLVector3(byteBuffer)
        ChatData_Field.ID = unpackUUID(byteBuffer)
        ChatData_Field.OwnerID = unpackUUID(byteBuffer)
        ChatData_Field.Name = unpackVariable(byteBuffer, 1)
        ChatData_Field.SourceType = unpackByte(byteBuffer).toInt() and 0xFF
        ChatData_Field.Type = unpackByte(byteBuffer).toInt() and 0xFF
        ChatData_Field.Radius = unpackFloat(byteBuffer)
        ChatData_Field.SimAccess = unpackByte(byteBuffer).toInt() and 0xFF
        ChatData_Field.Message = unpackVariable(byteBuffer, 2)
    }
}
