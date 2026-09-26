package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList

/**
 * Data server responds with data
 *
 * <p>Template: {@code ScriptDataReply Low 338 Trusted Unencoded UDPDeprecated}
 * (recovered/reference/message_template.msg).
 */
open class ScriptDataReply : SLMessage() {
    @JvmField val DataBlock_Fields = ArrayList<DataBlock>()

    /** Block DataBlock, Variable. */
    open class DataBlock {
        @JvmField var Hash: Long = 0L
        @JvmField var Reply: ByteArray? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        var i = 5
        val it = DataBlock_Fields.iterator()
        while (true) {
            val i2 = i
            if (!it.hasNext()) {
                return i2
            }
            i = it.next().Reply!!.size + 10 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleScriptDataReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 338 (ScriptDataReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x52).toByte())
        byteBuffer.put((DataBlock_Fields.size.toByte()))
        for (dataBlock in DataBlock_Fields) {
            packLong(byteBuffer, dataBlock.Hash)
            packVariable(byteBuffer, dataBlock.Reply, 2)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val dataBlock = DataBlock()
            dataBlock.Hash = unpackLong(byteBuffer)
            dataBlock.Reply = unpackVariable(byteBuffer, 2)
            DataBlock_Fields.add(dataBlock)
        }
    }
}
