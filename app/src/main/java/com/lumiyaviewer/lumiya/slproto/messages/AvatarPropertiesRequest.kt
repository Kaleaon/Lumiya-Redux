package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * AvatarPropertiesRequest
 * viewer -> simulator
 * reliable
 *
 * <p>Template: {@code AvatarPropertiesRequest Low 169 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class AvatarPropertiesRequest : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var AvatarID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 52
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAvatarPropertiesRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 169 (AvatarPropertiesRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xA9).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, AgentData_Field.AvatarID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        AgentData_Field.AvatarID = unpackUUID(byteBuffer)
    }
}
