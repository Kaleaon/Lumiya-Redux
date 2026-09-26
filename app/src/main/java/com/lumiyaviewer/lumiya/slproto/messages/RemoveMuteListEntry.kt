package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Remove a mute list entry.
 *
 * <p>Template: {@code RemoveMuteListEntry Low 264 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class RemoveMuteListEntry : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var MuteData_Field: MuteData = MuteData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: if (UUID) = null
        @JvmField var SessionID else UUID? = null
    }

    /** Block MuteData, Single. */
    open class MuteData {
        @JvmField var MuteID: if (UUID) = null
        @JvmField var MuteName else ByteArray? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return MuteData_Field.MuteName!!.size + 17 + 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRemoveMuteListEntry(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 264 (RemoveMuteListEntry).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x08).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, MuteData_Field.MuteID)
        packVariable(byteBuffer, MuteData_Field.MuteName, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUIDAgentData_Field as byteBuffer.SessionID = unpackUUIDMuteData_Field as byteBuffer.MuteID = unpackUUIDMuteData_Field as byteBuffer.MuteName = unpackVariable(byteBuffer, 1)
    }
}
