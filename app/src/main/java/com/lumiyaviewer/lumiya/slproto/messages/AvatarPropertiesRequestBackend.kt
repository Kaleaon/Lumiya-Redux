package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * AvatarPropertiesRequestBackend
 * simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code AvatarPropertiesRequestBackend Low 170 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class AvatarPropertiesRequestBackend : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var AvatarID: UUID? = null
        @JvmField var GodLevel: Int = 0
        @JvmField var WebProfilesDisabled: Boolean = false
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 38
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAvatarPropertiesRequestBackend(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 170 (AvatarPropertiesRequestBackend).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xAA).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.AvatarID)
        packByte(byteBuffer, (AgentData_Field.GodLevel).toByte())
        packBoolean(byteBuffer, AgentData_Field.WebProfilesDisabled)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.AvatarID = unpackUUID(byteBuffer)
        AgentData_Field.GodLevel = unpackByte(byteBuffer).toInt() and 0xFF
        AgentData_Field.WebProfilesDisabled = unpackBoolean(byteBuffer)
    }
}
