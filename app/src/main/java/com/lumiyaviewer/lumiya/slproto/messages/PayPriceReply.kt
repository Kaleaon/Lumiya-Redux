package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * PayPriceReply
 * sim -> viewer
 *
 * <p>Template: {@code PayPriceReply Low 162 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code 0()} in indra/newview/llfloaterpay.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class PayPriceReply : SLMessage() {
    @JvmField val ButtonData_Fields = ArrayList<ButtonData>()
    @JvmField var ObjectData_Field: ObjectData = ObjectData()

    /** Block ButtonData, Variable. */
    open class ButtonData {
        @JvmField var PayButton: Int = 0
    }

    /** Block ObjectData, Single. */
    open class ObjectData {
        @JvmField var DefaultPayPrice: Int = 0
        @JvmField var ObjectID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (ButtonData_Fields.size * 4) + 25
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandlePayPriceReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 162 (PayPriceReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xA2).toByte())
        packUUID(byteBuffer, ObjectData_Field.ObjectID)
        packInt(byteBuffer, ObjectData_Field.DefaultPayPrice)
        byteBuffer.put((ButtonData_Fields.size.toByte()))
        for (entry in ButtonData_Fields) {
            packInt(byteBuffer, entry.PayButton)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        ObjectData_Field.ObjectID = unpackUUID(byteBuffer)
        ObjectData_Field.DefaultPayPrice = unpackInt(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val buttonData = ButtonData()
            buttonData.PayButton = unpackInt(byteBuffer)
            ButtonData_Fields.add(buttonData)
        }
    }
}
