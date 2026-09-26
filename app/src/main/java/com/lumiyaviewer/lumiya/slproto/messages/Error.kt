package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Generic Error -- this is used for sending an error message
 * to a UDP recipient. The lowest common denominator is to at least
 * log the message. More sophisticated receivers can do something
 * smarter, for example, a money transaction failure can put up a
 * more user visible UI widget.
 *
 * <p>Template: {@code Error Low 423 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLMessageSystem::processError()} in indra/llmessage/message.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class Error : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var Data_Field: Data = Data()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
    }

    /** Block Data, Single. */
    open class Data {
        @JvmField var Code: Int = 0
        @JvmField var Data: ByteArray? = null
        @JvmField var ID: UUID? = null
        @JvmField var Message: ByteArray? = null
        @JvmField var System: ByteArray? = null
        @JvmField var Token: ByteArray? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return Data_Field.Token!!.size + 5 + 16 + 1 + Data_Field.System!!.size + 2 + Data_Field.Message!!.size + 2 + Data_Field.Data!!.size + 20
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleError(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 423 (Error).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0xA7).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packInt(byteBuffer, Data_Field.Code)
        packVariable(byteBuffer, Data_Field.Token, 1)
        packUUID(byteBuffer, Data_Field.ID)
        packVariable(byteBuffer, Data_Field.System, 1)
        packVariable(byteBuffer, Data_Field.Message, 2)
        packVariable(byteBuffer, Data_Field.Data, 2)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        Data_Field.Code = unpackInt(byteBuffer)
        Data_Field.Token = unpackVariable(byteBuffer, 1)
        Data_Field.ID = unpackUUID(byteBuffer)
        Data_Field.System = unpackVariable(byteBuffer, 1)
        Data_Field.Message = unpackVariable(byteBuffer, 2)
        Data_Field.Data = unpackVariable(byteBuffer, 2)
    }
}
