package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ChatFromSimulator
 * Chat text to appear on a user's screen
 * Position is region local.
 * Viewer can optionally use position to animate
 * If audible is CHAT_NOT_AUDIBLE, message will not be valid
 *
 * <p>Template: {@code ChatFromSimulator Low 139 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_chat_from_simulator()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class ChatFromSimulator : SLMessage() {
    @JvmField var ChatData_Field: ChatData = ChatData()

    /** Block ChatData, Single. */
    open class ChatData {
        @JvmField var Audible: Int = 0
        @JvmField var ChatType: Int = 0
        @JvmField var FromName: ByteArray? = null
        @JvmField var Message: ByteArray? = null
        @JvmField var OwnerID: UUID? = null
        @JvmField var Position: LLVector3? = null
        @JvmField var SourceID: UUID? = null
        @JvmField var SourceType: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return ChatData_Field.FromName!!.size + 1 + 16 + 16 + 1 + 1 + 1 + 12 + 2 + ChatData_Field.Message!!.size + 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleChatFromSimulator(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 139 (ChatFromSimulator).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x8B).toByte())
        packVariable(byteBuffer, ChatData_Field.FromName, 1)
        packUUID(byteBuffer, ChatData_Field.SourceID)
        packUUID(byteBuffer, ChatData_Field.OwnerID)
        packByte(byteBuffer, (ChatData_Field.SourceType).toByte())
        packByte(byteBuffer, (ChatData_Field.ChatType).toByte())
        packByte(byteBuffer, (ChatData_Field.Audible).toByte())
        packLLVector3(byteBuffer, ChatData_Field.Position)
        packVariable(byteBuffer, ChatData_Field.Message, 2)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        ChatData_Field.FromName = unpackVariable(byteBuffer, 1)
        ChatData_Field.SourceID = unpackUUID(byteBuffer)
        ChatData_Field.OwnerID = unpackUUID(byteBuffer)
        ChatData_Field.SourceType = unpackByte(byteBuffer).toInt() and 0xFF
        ChatData_Field.ChatType = unpackByte(byteBuffer).toInt() and 0xFF
        ChatData_Field.Audible = unpackByte(byteBuffer).toInt() and 0xFF
        ChatData_Field.Position = unpackLLVector3(byteBuffer)
        ChatData_Field.Message = unpackVariable(byteBuffer, 2)
    }
}
