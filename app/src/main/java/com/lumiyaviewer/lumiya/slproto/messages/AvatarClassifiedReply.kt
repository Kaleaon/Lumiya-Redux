package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * AvatarClassifiedReply
 * dataserver -> simulator -> viewer
 * Send the header information for this avatar's classifieds
 * This fills in the tabs of the Classifieds panel.
 * reliable
 *
 * <p>Template: {@code AvatarClassifiedReply Low 42 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLAvatarPropertiesProcessor::processAvatarClassifiedsReply()} in indra/newview/llavatarpropertiesprocessor.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class AvatarClassifiedReply : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val Data_Fields = ArrayList<Data>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var TargetID: UUID? = null
    }

    /** Block Data, Variable. */
    open class Data {
        @JvmField var ClassifiedID: UUID? = null
        @JvmField var Name: ByteArray? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        var i = 37
        val it = Data_Fields.iterator()
        while (true) {
            val i2 = i
            if (!it.hasNext()) {
                return i2
            }
            i = it.next().Name!!.size + 17 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAvatarClassifiedReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 42 (AvatarClassifiedReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x2A).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.TargetID)
        byteBuffer.put((Data_Fields.size.toByte()))
        for (data in Data_Fields) {
            packUUID(byteBuffer, data.ClassifiedID)
            packVariable(byteBuffer, data.Name, 1)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.TargetID = unpackUUID(byteBuffer)
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val data = Data()
            data.ClassifiedID = unpackUUID(byteBuffer)
            data.Name = unpackVariable(byteBuffer, 1)
            Data_Fields.add(data)
        }
    }
}
