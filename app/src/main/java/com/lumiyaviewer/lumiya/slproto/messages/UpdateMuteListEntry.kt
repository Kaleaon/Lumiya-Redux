package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * update/add someone in the mute list
 *
 * <p>Template: {@code UpdateMuteListEntry Low 263 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class UpdateMuteListEntry : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var MuteData_Field: MuteData = MuteData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block MuteData, Single. */
    open class MuteData {
        @JvmField var MuteFlags: Int = 0
        @JvmField var MuteID: UUID? = null
        @JvmField var MuteName: ByteArray? = null
        @JvmField var MuteType: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return MuteData_Field.MuteName!!.size + 17 + 4 + 4 + 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleUpdateMuteListEntry(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 263 (UpdateMuteListEntry).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x07).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, MuteData_Field.MuteID)
        packVariable(byteBuffer, MuteData_Field.MuteName, 1)
        packInt(byteBuffer, MuteData_Field.MuteType)
        packInt(byteBuffer, MuteData_Field.MuteFlags)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        MuteData_Field.MuteID = unpackUUID(byteBuffer)
        MuteData_Field.MuteName = unpackVariable(byteBuffer, 1)
        MuteData_Field.MuteType = unpackInt(byteBuffer)
        MuteData_Field.MuteFlags = unpackInt(byteBuffer)
    }
}
