package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * AvatarPropertiesReply
 * dataserver -> simulator
 * simulator -> viewer
 * reliable
 *
 * <p>Template: {@code AvatarPropertiesReply Low 171 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLAvatarPropertiesProcessor::processAvatarLegacyPropertiesReply()} in indra/newview/llavatarpropertiesprocessor.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class AvatarPropertiesReply : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var PropertiesData_Field: PropertiesData = PropertiesData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var AvatarID: UUID? = null
    }

    /** Block PropertiesData, Single. */
    open class PropertiesData {
        @JvmField var AboutText: ByteArray? = null
        @JvmField var BornOn: ByteArray? = null
        @JvmField var CharterMember: ByteArray? = null
        @JvmField var FLAboutText: ByteArray? = null
        @JvmField var FLImageID: UUID? = null
        @JvmField var Flags: Int = 0
        @JvmField var ImageID: UUID? = null
        @JvmField var PartnerID: UUID? = null
        @JvmField var ProfileURL: ByteArray? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return PropertiesData_Field.AboutText!!.size + 50 + 1 + PropertiesData_Field.FLAboutText!!.size + 1 + PropertiesData_Field.BornOn!!.size + 1 + PropertiesData_Field.ProfileURL!!.size + 1 + PropertiesData_Field.CharterMember!!.size + 4 + 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAvatarPropertiesReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 171 (AvatarPropertiesReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xAB).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.AvatarID)
        packUUID(byteBuffer, PropertiesData_Field.ImageID)
        packUUID(byteBuffer, PropertiesData_Field.FLImageID)
        packUUID(byteBuffer, PropertiesData_Field.PartnerID)
        packVariable(byteBuffer, PropertiesData_Field.AboutText, 2)
        packVariable(byteBuffer, PropertiesData_Field.FLAboutText, 1)
        packVariable(byteBuffer, PropertiesData_Field.BornOn, 1)
        packVariable(byteBuffer, PropertiesData_Field.ProfileURL, 1)
        packVariable(byteBuffer, PropertiesData_Field.CharterMember, 1)
        packInt(byteBuffer, PropertiesData_Field.Flags)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.AvatarID = unpackUUID(byteBuffer)
        PropertiesData_Field.ImageID = unpackUUID(byteBuffer)
        PropertiesData_Field.FLImageID = unpackUUID(byteBuffer)
        PropertiesData_Field.PartnerID = unpackUUID(byteBuffer)
        PropertiesData_Field.AboutText = unpackVariable(byteBuffer, 2)
        PropertiesData_Field.FLAboutText = unpackVariable(byteBuffer, 1)
        PropertiesData_Field.BornOn = unpackVariable(byteBuffer, 1)
        PropertiesData_Field.ProfileURL = unpackVariable(byteBuffer, 1)
        PropertiesData_Field.CharterMember = unpackVariable(byteBuffer, 1)
        PropertiesData_Field.Flags = unpackInt(byteBuffer)
    }
}
