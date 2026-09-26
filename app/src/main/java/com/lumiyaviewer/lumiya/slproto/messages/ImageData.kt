package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ImageData - sent to viewer to transmit information about an image
 *
 * <p>Template: {@code ImageData High 9 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class ImageData : SLMessage() {
    @JvmField var ImageDataData_Field: ImageDataData = ImageDataData()
    @JvmField var ImageID_Field: ImageID = ImageID()

    open class ImageDataData {
        @JvmField var Data: ByteArray? = null
    }

    /** Block ImageID, Single. */
    open class ImageID {
        @JvmField var Codec: Int = 0
        @JvmField var ID: UUID? = null
        @JvmField var Packets: Int = 0
        @JvmField var Size: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return ImageDataData_Field.Data!!.size + 2 + 24
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleImageData(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: High 9 (ImageData).
        byteBuffer.put((0x09).toByte())
        packUUID(byteBuffer, ImageID_Field.ID)
        packByte(byteBuffer, (ImageID_Field.Codec).toByte())
        packInt(byteBuffer, ImageID_Field.Size)
        packShort(byteBuffer, ImageID_Field.Packets.toShort())
        packVariable(byteBuffer, ImageDataData_Field.Data, 2)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        ImageID_Field.ID = unpackUUID(byteBuffer)
        ImageID_Field.Codec = unpackByte(byteBuffer).toInt() and 0xFF
        ImageID_Field.Size = unpackInt(byteBuffer)
        ImageID_Field.Packets = unpackShort(byteBuffer).toInt() and 65535
        ImageDataData_Field.Data = unpackVariable(byteBuffer, 2)
    }
}
