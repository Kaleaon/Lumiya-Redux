package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * PreloadSound - Sent by simulator to viewer to preload sound for an object
 *
 * <p>Template: {@code PreloadSound Medium 15 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_preload_sound()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class PreloadSound : SLMessage() {
    @JvmField val DataBlock_Fields = ArrayList<DataBlock>()

    /** Block DataBlock, Variable. */
    open class DataBlock {
        @JvmField var ObjectID: UUID? = null
        @JvmField var OwnerID: UUID? = null
        @JvmField var SoundID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (DataBlock_Fields.size * 48) + 3
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandlePreloadSound(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Medium 15 (PreloadSound).
        byteBuffer.put((0xFF).toByte())
        byteBuffer.put((0x0F).toByte())
        byteBuffer.put((DataBlock_Fields.size.toByte()))
        for (dataBlock in DataBlock_Fields) {
            packUUID(byteBuffer, dataBlock.ObjectID)
            packUUID(byteBuffer, dataBlock.OwnerID)
            packUUID(byteBuffer, dataBlock.SoundID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val dataBlock = DataBlock()
            dataBlock.ObjectID = unpackUUID(byteBuffer)
            dataBlock.OwnerID = unpackUUID(byteBuffer)
            dataBlock.SoundID = unpackUUID(byteBuffer)
            DataBlock_Fields.add(dataBlock)
        }
    }
}
