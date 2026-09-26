package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList

/**
 * ScriptDataRequest and ScriptDataReply are no longer used in the
 * simulator or the dataserver. Please see "/region/<region-id>/data-request"
 * in llscript_dataserver.cpp for the HTTP endpoint.
 * Script on simulator asks dataserver for information
 *
 * <p>Template: {@code ScriptDataRequest Low 337 Trusted Unencoded UDPDeprecated}
 * (recovered/reference/message_template.msg).
 */
open class ScriptDataRequest : SLMessage() {
    @JvmField val DataBlock_Fields = ArrayList<DataBlock>()

    /** Block DataBlock, Variable. */
    open class DataBlock {
        @JvmField var Hash: Long = 0L
        @JvmField var Request: ByteArray? = null
        @JvmField var RequestType: Int = 0
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
            i = it.next().Request!!.size + 11 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleScriptDataRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 337 (ScriptDataRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x51).toByte())
        byteBuffer.put((DataBlock_Fields.size.toByte()))
        for (dataBlock in DataBlock_Fields) {
            packLong(byteBuffer, dataBlock.Hash)
            packByte(byteBuffer, (dataBlock.RequestType).toByte())
            packVariable(byteBuffer, dataBlock.Request, 2)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val dataBlock = DataBlock()
            dataBlock.Hash = unpackLong(byteBuffer)
            dataBlock.RequestType = unpackByte(byteBuffer).toInt()
            dataBlock.Request = unpackVariable(byteBuffer, 2)
            DataBlock_Fields.add(dataBlock)
        }
    }
}
