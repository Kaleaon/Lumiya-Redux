package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * Generalized system message. Each Requst has its own protocol for
 * the StringData block format and contents.
 *
 * <p>Template: {@code SystemMessage Low 404 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class SystemMessage : SLMessage() {
    @JvmField var MethodData_Field: MethodData = MethodData()
    @JvmField val ParamList_Fields = ArrayList<ParamList>()

    /** Block MethodData, Single. */
    open class MethodData {
        @JvmField var Digest: ByteArray? = null
        @JvmField var Invoice: UUID? = null
        @JvmField var Method: ByteArray? = null
    }

    /** Block ParamList, Variable. */
    open class ParamList {
        @JvmField var Parameter: ByteArray? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        var length = MethodData_Field.Method!!.size + 1 + 16 + 32 + 4 + 1
        val it = ParamList_Fields.iterator()
        while (true) {
            val length2 = length
            if (!it.hasNext()) {
                return length2
            }
            length = it.next().Parameter!!.size + 1 + length2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleSystemMessage(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 404 (SystemMessage).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x94).toByte())
        packVariable(byteBuffer, MethodData_Field.Method, 1)
        packUUID(byteBuffer, MethodData_Field.Invoice)
        packFixed(byteBuffer, MethodData_Field.Digest, 32)
        byteBuffer.put((ParamList_Fields.size.toByte()))
        for (entry in ParamList_Fields) {
            packVariable(byteBuffer, entry.Parameter, 1)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        MethodData_Field.Method = unpackVariable(byteBuffer, 1)
        MethodData_Field.Invoice = unpackUUID(byteBuffer)
        MethodData_Field.Digest = unpackFixed(byteBuffer, 32)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val paramList = ParamList()
            paramList.Parameter = unpackVariable(byteBuffer, 1)
            ParamList_Fields.add(paramList)
        }
    }
}
