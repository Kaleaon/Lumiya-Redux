package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * GenericMessage
 * format must be identical to above
 * As above, but don't have to be god or estate owner to send.
 *
 * <p>Template: {@code GenericMessage Low 261 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_generic_message()} in indra/newview/llviewergenericmessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class GenericMessage : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var MethodData_Field: MethodData = MethodData()
    @JvmField val ParamList_Fields = ArrayList<ParamList>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
        @JvmField var TransactionID: UUID? = null
    }

    /** Block MethodData, Single. */
    open class MethodData {
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
        var length = MethodData_Field.Method!!.size + 1 + 16 + 52 + 1
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
        messageHandler.HandleGenericMessage(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 261 (GenericMessage).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x05).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, AgentData_Field.TransactionID)
        packVariable(byteBuffer, MethodData_Field.Method, 1)
        packUUID(byteBuffer, MethodData_Field.Invoice)
        byteBuffer.put((ParamList_Fields.size.toByte()))
        for (entry in ParamList_Fields) {
            packVariable(byteBuffer, entry.Parameter, 1)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        AgentData_Field.TransactionID = unpackUUID(byteBuffer)
        MethodData_Field.Method = unpackVariable(byteBuffer, 1)
        MethodData_Field.Invoice = unpackUUID(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val paramList = ParamList()
            paramList.Parameter = unpackVariable(byteBuffer, 1)
            ParamList_Fields.add(paramList)
        }
    }
}
