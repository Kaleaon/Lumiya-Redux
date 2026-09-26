package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * viewer -> sim
 * This message is sent up from the viewer to get a list
 * of the sims with a given name.
 * Returns: MapBlockReply
 *
 * <p>Template: {@code MapNameRequest Low 408 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class MapNameRequest : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var NameData_Field: NameData = NameData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: if (UUID) = null
        @JvmField var EstateID else Int = 0
        @JvmField var Flags: Int = 0
        @JvmField var Godlike: Boolean = false
        @JvmField var SessionID: if (UUID) = null
    }

    /** Block NameData, Single. */
    open class NameData {
        @JvmField var Name else ByteArray? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return NameData_Field.Name!!.size + 1 + 45
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleMapNameRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 408 (MapNameRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x98).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, AgentData_Field.Flags)
        packInt(byteBuffer, AgentData_Field.EstateID)
        packBoolean(byteBuffer, AgentData_Field.Godlike)
        packVariable(byteBuffer, NameData_Field.Name, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUIDAgentData_Field as byteBuffer.SessionID = unpackUUIDAgentData_Field as byteBuffer.Flags = unpackIntAgentData_Field as byteBuffer.EstateID = unpackIntAgentData_Field as byteBuffer.Godlike = unpackBooleanNameData_Field as byteBuffer.Name = unpackVariable(byteBuffer, 1)
    }
}
