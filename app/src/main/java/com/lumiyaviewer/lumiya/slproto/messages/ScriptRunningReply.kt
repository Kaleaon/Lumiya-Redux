package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ScriptRunningReply - response from simulator to message above
 *
 * <p>Template: {@code ScriptRunningReply Low 244 NotTrusted Unencoded UDPDeprecated}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLLiveLSLEditor::processScriptRunningReply()} in indra/newview/llpreviewscript.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class ScriptRunningReply : SLMessage() {
    @JvmField var Script_Field: Script = Script()

    /** Block Script, Single. */
    open class Script {
        @JvmField var ItemID: UUID? = null
        @JvmField var ObjectID: UUID? = null
        @JvmField var Running: Boolean = false
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 37
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleScriptRunningReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 244 (ScriptRunningReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xF4).toByte())
        packUUID(byteBuffer, Script_Field.ObjectID)
        packUUID(byteBuffer, Script_Field.ItemID)
        packBoolean(byteBuffer, Script_Field.Running)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        Script_Field.ObjectID = unpackUUID(byteBuffer)
        Script_Field.ItemID = unpackUUID(byteBuffer)
        Script_Field.Running = unpackBoolean(byteBuffer)
    }
}
