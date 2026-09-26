package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * TeleportProgress sim->viewer
 * Tell the agent how the teleport is going.
 *
 * <p>Template: {@code TeleportProgress Low 66 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_teleport_progress()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class TeleportProgress : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var Info_Field: Info = Info()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
    }

    /** Block Info, Single. */
    open class Info {
        @JvmField var Message: ByteArray? = null
        @JvmField var TeleportFlags: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return Info_Field.Message!!.size + 5 + 20
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleTeleportProgress(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 66 (TeleportProgress).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x42).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packInt(byteBuffer, Info_Field.TeleportFlags)
        packVariable(byteBuffer, Info_Field.Message, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        Info_Field.TeleportFlags = unpackInt(byteBuffer)
        Info_Field.Message = unpackVariable(byteBuffer, 1)
    }
}
