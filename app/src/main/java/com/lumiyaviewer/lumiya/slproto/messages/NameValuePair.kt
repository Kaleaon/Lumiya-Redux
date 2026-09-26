package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * Name Value Pair messages
 * NameValuePair - if the specific task exists on simulator, add or replace this name value pair
 *
 * <p>Template: {@code NameValuePair Low 329 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_name_value()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class NameValuePair : SLMessage() {
    @JvmField val NameValueData_Fields = ArrayList<NameValueData>()
    @JvmField var TaskData_Field: TaskData = TaskData()

    /** Block NameValueData, Variable. */
    open class NameValueData {
        @JvmField var NVPair: ByteArray? = null
    }

    /** Block TaskData, Single. */
    open class TaskData {
        @JvmField var ID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        var i = 21
        val it = NameValueData_Fields.iterator()
        while (true) {
            val i2 = i
            if (!it.hasNext()) {
                return i2
            }
            i = it.next().NVPair!!.size + 2 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleNameValuePair(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 329 (NameValuePair).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x49).toByte())
        packUUID(byteBuffer, TaskData_Field.ID)
        byteBuffer.put((NameValueData_Fields.size.toByte()))
        for (entry in NameValueData_Fields) {
            packVariable(byteBuffer, entry.NVPair, 2)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        TaskData_Field.ID = unpackUUID(byteBuffer)
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val nameValueData = NameValueData()
            nameValueData.NVPair = unpackVariable(byteBuffer, 2)
            NameValueData_Fields.add(nameValueData)
        }
    }
}
