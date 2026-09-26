package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * AvatarPickerReply
 * List of names to select a person
 * reliable
 *
 * <p>Template: {@code AvatarPickerReply Low 28 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLFloaterAvatarPicker::processAvatarPickerReply()} in indra/newview/llfloateravatarpicker.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class AvatarPickerReply : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val Data_Fields = ArrayList<Data>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var QueryID: UUID? = null
    }

    /** Block Data, Variable. */
    open class Data {
        @JvmField var AvatarID: UUID? = null
        @JvmField var FirstName: ByteArray? = null
        @JvmField var LastName: ByteArray? = null
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
            val data = it.next()
            i = data.LastName!!.size + data.FirstName!!.size + 17 + 1 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAvatarPickerReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 28 (AvatarPickerReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x1C).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.QueryID)
        byteBuffer.put((Data_Fields.size.toByte()))
        for (data in Data_Fields) {
            packUUID(byteBuffer, data.AvatarID)
            packVariable(byteBuffer, data.FirstName, 1)
            packVariable(byteBuffer, data.LastName, 1)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.QueryID = unpackUUID(byteBuffer)
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val data = Data()
            data.AvatarID = unpackUUID(byteBuffer)
            data.FirstName = unpackVariable(byteBuffer, 1)
            data.LastName = unpackVariable(byteBuffer, 1)
            Data_Fields.add(data)
        }
    }
}
