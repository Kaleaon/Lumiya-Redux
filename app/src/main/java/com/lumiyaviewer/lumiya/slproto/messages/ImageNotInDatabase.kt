package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ImageNotInDatabase
 * Simulator informs viewer that a requsted image definitely does not exist in the asset database
 *
 * <p>Template: {@code ImageNotInDatabase Low 86 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLViewerTextureList::processImageNotInDatabase()} in indra/newview/llviewertexturelist.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class ImageNotInDatabase : SLMessage() {
    @JvmField var ImageID_Field: ImageID = ImageID()

    /** Block ImageID, Single. */
    open class ImageID {
        @JvmField var ID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 20
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleImageNotInDatabase(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 86 (ImageNotInDatabase).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x56).toByte())
        packUUID(byteBuffer, ImageID_Field.ID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        ImageID_Field.ID = unpackUUID(byteBuffer)
    }
}
