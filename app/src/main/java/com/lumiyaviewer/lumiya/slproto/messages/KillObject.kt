package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList

/**
 * KillObject - Sent by objects to the viewer to tell them to kill themselves
 *
 * <p>Template: {@code KillObject High 16 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_kill_object()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class KillObject : SLMessage() {
    @JvmField val ObjectData_Fields = ArrayList<ObjectData>()

    /** Block ObjectData, Variable. */
    open class ObjectData {
        @JvmField var ID: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (ObjectData_Fields.size * 4) + 2
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleKillObject(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: High 16 (KillObject).
        byteBuffer.put((0x10).toByte())
        byteBuffer.put((ObjectData_Fields.size.toByte()))
        for (entry in ObjectData_Fields) {
            packInt(byteBuffer, entry.ID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val objectData = ObjectData()
            objectData.ID = unpackInt(byteBuffer)
            ObjectData_Fields.add(objectData)
        }
    }
}
