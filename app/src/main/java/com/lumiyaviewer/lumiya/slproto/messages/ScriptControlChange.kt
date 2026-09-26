package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList

/**
 * ScriptControlChange
 * reliable
 *
 * <p>Template: {@code ScriptControlChange Low 189 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLAgent::processScriptControlChange()} in indra/newview/llagent.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class ScriptControlChange : SLMessage() {
    @JvmField val Data_Fields = ArrayList<Data>()

    /** Block Data, Variable. */
    open class Data {
        @JvmField var Controls: Int = 0
        @JvmField var PassToAgent: Boolean = false
        @JvmField var TakeControls: Boolean = false
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (Data_Fields.size * 6) + 5
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleScriptControlChange(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 189 (ScriptControlChange).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xBD).toByte())
        byteBuffer.put((Data_Fields.size.toByte()))
        for (data in Data_Fields) {
            packBoolean(byteBuffer, data.TakeControls)
            packInt(byteBuffer, data.Controls)
            packBoolean(byteBuffer, data.PassToAgent)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val data = Data()
            data.TakeControls = unpackBoolean(byteBuffer)
            data.Controls = unpackInt(byteBuffer)
            data.PassToAgent = unpackBoolean(byteBuffer)
            Data_Fields.add(data)
        }
    }
}
