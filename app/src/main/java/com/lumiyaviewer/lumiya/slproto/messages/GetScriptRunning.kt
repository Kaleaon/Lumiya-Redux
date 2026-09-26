package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * GetScriptRunning - asks if a script is running or not. the simulator
 * responds with ScriptRunningReply
 *
 * <p>Template: {@code GetScriptRunning Low 243 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class GetScriptRunning : SLMessage() {
    @JvmField var Script_Field: Script = Script()

    /** Block Script, Single. */
    open class Script {
        @JvmField var ItemID: UUID? = null
        @JvmField var ObjectID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleGetScriptRunning(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 243 (GetScriptRunning).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xF3).toByte())
        packUUID(byteBuffer, Script_Field.ObjectID)
        packUUID(byteBuffer, Script_Field.ItemID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        Script_Field.ObjectID = unpackUUID(byteBuffer)
        Script_Field.ItemID = unpackUUID(byteBuffer)
    }
}
