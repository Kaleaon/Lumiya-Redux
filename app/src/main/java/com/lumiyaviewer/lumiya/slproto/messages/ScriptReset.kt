package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ScriptReset - causes a script to reset
 *
 * <p>Template: {@code ScriptReset Low 246 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class ScriptReset : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var Script_Field: Script = Script()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block Script, Single. */
    open class Script {
        @JvmField var ItemID: UUID? = null
        @JvmField var ObjectID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 68
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleScriptReset(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 246 (ScriptReset).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xF6).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, Script_Field.ObjectID)
        packUUID(byteBuffer, Script_Field.ItemID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        Script_Field.ObjectID = unpackUUID(byteBuffer)
        Script_Field.ItemID = unpackUUID(byteBuffer)
    }
}
