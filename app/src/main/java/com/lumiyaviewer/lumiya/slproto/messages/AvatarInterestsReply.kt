package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * AvatarInterestsReply
 *
 * <p>Template: {@code AvatarInterestsReply Low 172 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLAvatarPropertiesProcessor::processAvatarInterestsReply()} in indra/newview/llavatarpropertiesprocessor.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class AvatarInterestsReply : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var PropertiesData_Field: PropertiesData = PropertiesData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var AvatarID: UUID? = null
    }

    /** Block PropertiesData, Single. */
    open class PropertiesData {
        @JvmField var LanguagesText: ByteArray? = null
        @JvmField var SkillsMask: Int = 0
        @JvmField var SkillsText: ByteArray? = null
        @JvmField var WantToMask: Int = 0
        @JvmField var WantToText: ByteArray? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return PropertiesData_Field.WantToText!!.size + 5 + 4 + 1 + PropertiesData_Field.SkillsText!!.size + 1 + PropertiesData_Field.LanguagesText!!.size + 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAvatarInterestsReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 172 (AvatarInterestsReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xAC).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.AvatarID)
        packInt(byteBuffer, PropertiesData_Field.WantToMask)
        packVariable(byteBuffer, PropertiesData_Field.WantToText, 1)
        packInt(byteBuffer, PropertiesData_Field.SkillsMask)
        packVariable(byteBuffer, PropertiesData_Field.SkillsText, 1)
        packVariable(byteBuffer, PropertiesData_Field.LanguagesText, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.AvatarID = unpackUUID(byteBuffer)
        PropertiesData_Field.WantToMask = unpackInt(byteBuffer)
        PropertiesData_Field.WantToText = unpackVariable(byteBuffer, 1)
        PropertiesData_Field.SkillsMask = unpackInt(byteBuffer)
        PropertiesData_Field.SkillsText = unpackVariable(byteBuffer, 1)
        PropertiesData_Field.LanguagesText = unpackVariable(byteBuffer, 1)
    }
}
