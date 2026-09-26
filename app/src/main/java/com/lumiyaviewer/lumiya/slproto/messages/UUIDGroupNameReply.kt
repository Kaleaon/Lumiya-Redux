package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * UUIDGroupNameReply
 * Translate a UUID into a group name
 *
 * <p>Template: {@code UUIDGroupNameReply Low 238 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code handleUUIDGroupNameReply()} in indra/llmessage/llcachename.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class UUIDGroupNameReply : SLMessage() {
    @JvmField val UUIDNameBlock_Fields = ArrayList<UUIDNameBlock>()

    /** Block UUIDNameBlock, Variable. */
    open class UUIDNameBlock {
        @JvmField var GroupName: ByteArray? = null
        @JvmField var ID: UUID? = null
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
            i = it.next().GroupName!!.size + 17 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleUUIDGroupNameReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 238 (UUIDGroupNameReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xEE).toByte())
        byteBuffer.put((UUIDNameBlock_Fields.size.toByte()))
        for (uuidNameBlock in UUIDNameBlock_Fields) {
            packUUID(byteBuffer, uuidNameBlock.ID)
            packVariable(byteBuffer, uuidNameBlock.GroupName, 1)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val uuidNameBlock = UUIDNameBlock()
            uuidNameBlock.ID = unpackUUID(byteBuffer)
            uuidNameBlock.GroupName = unpackVariable(byteBuffer, 1)
            UUIDNameBlock_Fields.add(uuidNameBlock)
        }
    }
}
