package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * AvatarPropertiesUpdate
 * viewer -> simulator
 * reliable
 *
 * <p>Template: {@code AvatarPropertiesUpdate Low 174 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class AvatarPropertiesUpdate : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var PropertiesData_Field: PropertiesData = PropertiesData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block PropertiesData, Single. */
    open class PropertiesData {
        @JvmField var AboutText: ByteArray? = null
        @JvmField var AllowPublish: Boolean = false
        @JvmField var FLAboutText: ByteArray? = null
        @JvmField var FLImageID: UUID? = null
        @JvmField var ImageID: UUID? = null
        @JvmField var MaturePublish: Boolean = false
        @JvmField var ProfileURL: ByteArray? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return PropertiesData_Field.AboutText!!.size + 34 + 1 + PropertiesData_Field.FLAboutText!!.size + 1 + 1 + 1 + PropertiesData_Field.ProfileURL!!.size + 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAvatarPropertiesUpdate(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 174 (AvatarPropertiesUpdate).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xAE).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, PropertiesData_Field.ImageID)
        packUUID(byteBuffer, PropertiesData_Field.FLImageID)
        packVariable(byteBuffer, PropertiesData_Field.AboutText, 2)
        packVariable(byteBuffer, PropertiesData_Field.FLAboutText, 1)
        packBoolean(byteBuffer, PropertiesData_Field.AllowPublish)
        packBoolean(byteBuffer, PropertiesData_Field.MaturePublish)
        packVariable(byteBuffer, PropertiesData_Field.ProfileURL, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        PropertiesData_Field.ImageID = unpackUUID(byteBuffer)
        PropertiesData_Field.FLImageID = unpackUUID(byteBuffer)
        PropertiesData_Field.AboutText = unpackVariable(byteBuffer, 2)
        PropertiesData_Field.FLAboutText = unpackVariable(byteBuffer, 1)
        PropertiesData_Field.AllowPublish = unpackBoolean(byteBuffer)
        PropertiesData_Field.MaturePublish = unpackBoolean(byteBuffer)
        PropertiesData_Field.ProfileURL = unpackVariable(byteBuffer, 1)
    }
}
