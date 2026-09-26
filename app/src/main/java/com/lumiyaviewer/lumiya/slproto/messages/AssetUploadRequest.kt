package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Asset storage messages
 * current assumes an existing UUID, need to enhance for new assets
 *
 * <p>Template: {@code AssetUploadRequest Low 333 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class AssetUploadRequest : SLMessage() {
    @JvmField var AssetBlock_Field: AssetBlock = AssetBlock()

    /** Block AssetBlock, Single. */
    open class AssetBlock {
        @JvmField var AssetData: ByteArray? = null
        @JvmField var StoreLocal: Boolean = false
        @JvmField var Tempfile: Boolean = false
        @JvmField var TransactionID: UUID? = null
        @JvmField var Type: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return AssetBlock_Field.AssetData!!.size + 21 + 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAssetUploadRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 333 (AssetUploadRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x4D).toByte())
        packUUID(byteBuffer, AssetBlock_Field.TransactionID)
        packByte(byteBuffer, (AssetBlock_Field.Type).toByte())
        packBoolean(byteBuffer, AssetBlock_Field.Tempfile)
        packBoolean(byteBuffer, AssetBlock_Field.StoreLocal)
        packVariable(byteBuffer, AssetBlock_Field.AssetData, 2)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AssetBlock_Field.TransactionID = unpackUUID(byteBuffer)
        AssetBlock_Field.Type = unpackByte(byteBuffer).toInt()
        AssetBlock_Field.Tempfile = unpackBoolean(byteBuffer)
        AssetBlock_Field.StoreLocal = unpackBoolean(byteBuffer)
        AssetBlock_Field.AssetData = unpackVariable(byteBuffer, 2)
    }
}
