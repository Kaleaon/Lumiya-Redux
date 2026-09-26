package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * UUIDNameReply
 * Translate a UUID into first and last names
 *
 * <p>Template: {@code UUIDNameReply Low 236 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code handleUUIDNameReply()} in indra/llmessage/llcachename.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class UUIDNameReply : SLMessage() {
    @JvmField val UUIDNameBlock_Fields = ArrayList<UUIDNameBlock>()

    /** Block UUIDNameBlock, Variable. */
    open class UUIDNameBlock {
        @JvmField var FirstName: ByteArray? = null
        @JvmField var ID: UUID? = null
        @JvmField var LastName: ByteArray? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        var i = 5
        val it = UUIDNameBlock_Fields.iterator()
        while (true) {
            val i2 = i
            if (!it.hasNext()) {
                return i2
            }
            val uuidNameBlock = it.next()
            i = uuidNameBlock.LastName!!.size + uuidNameBlock.FirstName!!.size + 17 + 1 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleUUIDNameReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 236 (UUIDNameReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xEC).toByte())
        byteBuffer.put((UUIDNameBlock_Fields.size.toByte()))
        for (uuidNameBlock in UUIDNameBlock_Fields) {
            packUUID(byteBuffer, uuidNameBlock.ID)
            packVariable(byteBuffer, uuidNameBlock.FirstName, 1)
            packVariable(byteBuffer, uuidNameBlock.LastName, 1)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val uuidNameBlock = UUIDNameBlock()
            uuidNameBlock.ID = unpackUUID(byteBuffer)
            uuidNameBlock.FirstName = unpackVariable(byteBuffer, 1)
            uuidNameBlock.LastName = unpackVariable(byteBuffer, 1)
            UUIDNameBlock_Fields.add(uuidNameBlock)
        }
    }
}
