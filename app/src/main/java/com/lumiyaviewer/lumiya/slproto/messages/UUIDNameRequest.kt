package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * UUID to name lookup
 * UUIDNameRequest
 * Translate a UUID into first and last names
 *
 * <p>Template: {@code UUIDNameRequest Low 235 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code handleUUIDNameRequest()} in indra/llmessage/llcachename.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class UUIDNameRequest : SLMessage() {
    @JvmField val UUIDNameBlock_Fields = ArrayList<UUIDNameBlock>()

    /** Block UUIDNameBlock, Variable. */
    open class UUIDNameBlock {
        @JvmField var ID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (UUIDNameBlock_Fields.size * 16) + 5
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleUUIDNameRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 235 (UUIDNameRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xEB).toByte())
        byteBuffer.put((UUIDNameBlock_Fields.size.toByte()))
        for (entry in UUIDNameBlock_Fields) {
            packUUID(byteBuffer, entry.ID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val uuidNameBlock = UUIDNameBlock()
            uuidNameBlock.ID = unpackUUID(byteBuffer)
            UUIDNameBlock_Fields.add(uuidNameBlock)
        }
    }
}
