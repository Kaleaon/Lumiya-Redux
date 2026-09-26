package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * UUIDGroupNameRequest
 * Translate a UUID into a group name
 *
 * <p>Template: {@code UUIDGroupNameRequest Low 237 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code handleUUIDGroupNameRequest()} in indra/llmessage/llcachename.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class UUIDGroupNameRequest : SLMessage() {
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
        messageHandler.HandleUUIDGroupNameRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 237 (UUIDGroupNameRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xED).toByte())
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
