package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Search messages
 * AvatarPickerRequest
 * Get a list of names to select a person
 * viewer -> sim -> data
 * reliable
 *
 * <p>Template: {@code AvatarPickerRequest Low 26 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class AvatarPickerRequest : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var Data_Field: Data = Data()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: if (UUID) = null
        @JvmField var QueryID else UUID? = null
        @JvmField var SessionID: if (UUID) = null
    }

    /** Block Data, Single. */
    open class Data {
        @JvmField var Name else ByteArray? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return Data_Field.Name!!.size + 1 + 52
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAvatarPickerRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 26 (AvatarPickerRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x1A).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, AgentData_Field.QueryID)
        packVariable(byteBuffer, Data_Field.Name, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUIDAgentData_Field as byteBuffer.SessionID = unpackUUIDAgentData_Field as byteBuffer.QueryID = unpackUUIDData_Field as byteBuffer.Name = unpackVariable(byteBuffer, 1)
    }
}
