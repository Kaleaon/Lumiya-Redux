package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ParcelMediaUpdate
 * Sends a parcel media update to a single user
 * For global updates use the parcel manager.
 *
 * <p>Template: {@code ParcelMediaUpdate Low 420 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code parcelMediaUpdateHandler()} in indra/newview/llviewerparcelmedia.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class ParcelMediaUpdate : SLMessage() {
    @JvmField var DataBlockExtended_Field: DataBlockExtended = DataBlockExtended()
    @JvmField var DataBlock_Field: DataBlock = DataBlock()

    /** Block DataBlock, Single. */
    open class DataBlock {
        @JvmField var MediaAutoScale: Int = 0
        @JvmField var MediaID: UUID? = null
        @JvmField var MediaURL: ByteArray? = null
    }

    /** Block DataBlockExtended, Single. */
    open class DataBlockExtended {
        @JvmField var MediaDesc: ByteArray? = null
        @JvmField var MediaHeight: Int = 0
        @JvmField var MediaLoop: Int = 0
        @JvmField var MediaType: ByteArray? = null
        @JvmField var MediaWidth: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return DataBlock_Field.MediaURL!!.size + 1 + 16 + 1 + 4 + DataBlockExtended_Field.MediaType!!.size + 1 + 1 + DataBlockExtended_Field.MediaDesc!!.size + 4 + 4 + 1
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleParcelMediaUpdate(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 420 (ParcelMediaUpdate).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0xA4).toByte())
        packVariable(byteBuffer, DataBlock_Field.MediaURL, 1)
        packUUID(byteBuffer, DataBlock_Field.MediaID)
        packByte(byteBuffer, (DataBlock_Field.MediaAutoScale).toByte())
        packVariable(byteBuffer, DataBlockExtended_Field.MediaType, 1)
        packVariable(byteBuffer, DataBlockExtended_Field.MediaDesc, 1)
        packInt(byteBuffer, DataBlockExtended_Field.MediaWidth)
        packInt(byteBuffer, DataBlockExtended_Field.MediaHeight)
        packByte(byteBuffer, (DataBlockExtended_Field.MediaLoop).toByte())
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        DataBlock_Field.MediaURL = unpackVariable(byteBuffer, 1)
        DataBlock_Field.MediaID = unpackUUID(byteBuffer)
        DataBlock_Field.MediaAutoScale = unpackByte(byteBuffer).toInt() and 0xFF
        DataBlockExtended_Field.MediaType = unpackVariable(byteBuffer, 1)
        DataBlockExtended_Field.MediaDesc = unpackVariable(byteBuffer, 1)
        DataBlockExtended_Field.MediaWidth = unpackInt(byteBuffer)
        DataBlockExtended_Field.MediaHeight = unpackInt(byteBuffer)
        DataBlockExtended_Field.MediaLoop = unpackByte(byteBuffer).toInt() and 0xFF
    }
}
