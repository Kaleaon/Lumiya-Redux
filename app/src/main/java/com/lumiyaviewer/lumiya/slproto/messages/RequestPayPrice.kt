package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * RequestPayPrice
 * viewer -> sim
 *
 * <p>Template: {@code RequestPayPrice Low 161 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class RequestPayPrice : SLMessage() {
    @JvmField var ObjectData_Field: ObjectData = ObjectData()

    /** Block ObjectData, Single. */
    open class ObjectData {
        @JvmField var ObjectID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 20
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRequestPayPrice(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 161 (RequestPayPrice).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xA1).toByte())
        packUUID(byteBuffer, ObjectData_Field.ObjectID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        ObjectData_Field.ObjectID = unpackUUID(byteBuffer)
    }
}
