package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ScriptQuestion
 * reliable
 *
 * <p>Template: {@code ScriptQuestion Low 188 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_script_question()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class ScriptQuestion : SLMessage() {
    @JvmField var Data_Field: Data = Data()

    /** Block Data, Single. */
    open class Data {
        @JvmField var ItemID: UUID? = null
        @JvmField var ObjectName: ByteArray? = null
        @JvmField var ObjectOwner: ByteArray? = null
        @JvmField var Questions: Int = 0
        @JvmField var TaskID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return Data_Field.ObjectName!!.size + 33 + 1 + Data_Field.ObjectOwner!!.size + 4 + 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleScriptQuestion(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 188 (ScriptQuestion).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xBC).toByte())
        packUUID(byteBuffer, Data_Field.TaskID)
        packUUID(byteBuffer, Data_Field.ItemID)
        packVariable(byteBuffer, Data_Field.ObjectName, 1)
        packVariable(byteBuffer, Data_Field.ObjectOwner, 1)
        packInt(byteBuffer, Data_Field.Questions)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        Data_Field.TaskID = unpackUUID(byteBuffer)
        Data_Field.ItemID = unpackUUID(byteBuffer)
        Data_Field.ObjectName = unpackVariable(byteBuffer, 1)
        Data_Field.ObjectOwner = unpackVariable(byteBuffer, 1)
        Data_Field.Questions = unpackInt(byteBuffer)
    }
}
