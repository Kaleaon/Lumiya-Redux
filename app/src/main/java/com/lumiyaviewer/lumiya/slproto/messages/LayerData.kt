package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer

/**
 * LayerData - Sent to viewer - encodes layer data
 *
 * <p>Template: {@code LayerData High 11 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_layer_data()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class LayerData : SLMessage() {
    @JvmField var LayerDataData_Field: LayerDataData = LayerDataData()
    @JvmField var LayerID_Field: LayerID = LayerID()

    open class LayerDataData {
        @JvmField var Data: ByteArray? = null
    }

    /** Block LayerID, Single. */
    open class LayerID {
        @JvmField var Type: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return LayerDataData_Field.Data!!.size + 2 + 2
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleLayerData(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: High 11 (LayerData).
        byteBuffer.put((0x0B).toByte())
        packByte(byteBuffer, (LayerID_Field.Type).toByte())
        packVariable(byteBuffer, LayerDataData_Field.Data, 2)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        LayerID_Field.Type = unpackByte(byteBuffer).toInt() and 0xFF
        LayerDataData_Field.Data = unpackVariable(byteBuffer, 2)
    }
}
