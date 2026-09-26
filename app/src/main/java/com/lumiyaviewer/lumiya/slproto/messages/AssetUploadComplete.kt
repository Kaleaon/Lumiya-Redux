package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * AssetUploadComplete
 *
 * <p>Template: {@code AssetUploadComplete Low 334 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code processUploadComplete()} in indra/llmessage/llassetstorage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class AssetUploadComplete : SLMessage() {
    @JvmField var AssetBlock_Field: AssetBlock = AssetBlock()

    /** Block AssetBlock, Single. */
    open class AssetBlock {
        @JvmField var Success: Boolean = false
        @JvmField var Type: Int = 0
        @JvmField var UUID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 22
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAssetUploadComplete(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 334 (AssetUploadComplete).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x4E).toByte())
        packUUID(byteBuffer, AssetBlock_Field.UUID)
        packByte(byteBuffer, (AssetBlock_Field.Type).toByte())
        packBoolean(byteBuffer, AssetBlock_Field.Success)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AssetBlock_Field.UUID = unpackUUID(byteBuffer)
        AssetBlock_Field.Type = unpackByte(byteBuffer).toInt()
        AssetBlock_Field.Success = unpackBoolean(byteBuffer)
    }
}
