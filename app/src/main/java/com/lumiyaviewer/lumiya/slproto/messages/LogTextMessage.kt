package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * LogTextMessage
 * Asks the dataserver to log the contents of this message in the
 * chat and IM log table.
 * Sent from userserver (IM logging) and simulator (chat logging).
 *
 * <p>Template: {@code LogTextMessage Low 391 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class LogTextMessage : SLMessage() {
    @JvmField val DataBlock_Fields = ArrayList<DataBlock>()

    /** Block DataBlock, Variable. */
    open class DataBlock {
        @JvmField var FromAgentId: UUID? = null
        @JvmField var GlobalX: Double = 0.0
        @JvmField var GlobalY: Double = 0.0
        @JvmField var Message: ByteArray? = null
        @JvmField var Time: Int = 0
        @JvmField var ToAgentId: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        var i = 5
        val it = DataBlock_Fields.iterator()
        while (true) {
            val i2 = i
            if (!it.hasNext()) {
                return i2
            }
            i = it.next().Message!!.size + 54 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleLogTextMessage(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 391 (LogTextMessage).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x87).toByte())
        byteBuffer.put((DataBlock_Fields.size.toByte()))
        for (dataBlock in DataBlock_Fields) {
            packUUID(byteBuffer, dataBlock.FromAgentId)
            packUUID(byteBuffer, dataBlock.ToAgentId)
            packDouble(byteBuffer, dataBlock.GlobalX)
            packDouble(byteBuffer, dataBlock.GlobalY)
            packInt(byteBuffer, dataBlock.Time)
            packVariable(byteBuffer, dataBlock.Message, 2)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val dataBlock = DataBlock()
            dataBlock.FromAgentId = unpackUUID(byteBuffer)
            dataBlock.ToAgentId = unpackUUID(byteBuffer)
            dataBlock.GlobalX = unpackDouble(byteBuffer)
            dataBlock.GlobalY = unpackDouble(byteBuffer)
            dataBlock.Time = unpackInt(byteBuffer)
            dataBlock.Message = unpackVariable(byteBuffer, 2)
            DataBlock_Fields.add(dataBlock)
        }
    }
}
