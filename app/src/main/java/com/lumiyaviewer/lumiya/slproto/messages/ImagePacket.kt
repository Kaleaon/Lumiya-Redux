package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ImagePacket - follow on image data for images having > 1 packet of data
 *
 * <p>Template: {@code ImagePacket High 10 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class ImagePacket : SLMessage() {
    @JvmField var ImageData_Field: ImageData = ImageData()
    @JvmField var ImageID_Field: ImageID = ImageID()

    /** Block ImageData, Single. */
    open class ImageData {
        @JvmField var Data: ByteArray? = null
    }

    /** Block ImageID, Single. */
    open class ImageID {
        @JvmField var ID: UUID? = null
        @JvmField var Packet: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return ImageData_Field.Data!!.size + 2 + 19
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleImagePacket(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: High 10 (ImagePacket).
        byteBuffer.put((0x0A).toByte())
        packUUID(byteBuffer, ImageID_Field.ID)
        packShort(byteBuffer, ImageID_Field.Packet.toShort())
        packVariable(byteBuffer, ImageData_Field.Data, 2)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        ImageID_Field.ID = unpackUUID(byteBuffer)
        ImageID_Field.Packet = unpackShort(byteBuffer).toInt() and 65535
        ImageData_Field.Data = unpackVariable(byteBuffer, 2)
    }
}
