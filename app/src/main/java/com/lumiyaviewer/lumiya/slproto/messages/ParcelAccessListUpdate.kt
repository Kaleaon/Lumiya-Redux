package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * viewer -> sim
 * ParcelAccessListUpdate
 *
 * <p>Template: {@code ParcelAccessListUpdate Low 217 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class ParcelAccessListUpdate : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var Data_Field: Data = Data()
    @JvmField val List_Fields = ArrayList<List>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block Data, Single. */
    open class Data {
        @JvmField var Flags: Int = 0
        @JvmField var LocalID: Int = 0
        @JvmField var Sections: Int = 0
        @JvmField var SequenceID: Int = 0
        @JvmField var TransactionID: UUID? = null
    }

    /** Block List, Variable. */
    open class List {
        @JvmField var Flags: Int = 0
        @JvmField var ID: UUID? = null
        @JvmField var Time: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return (List_Fields.size * 24) + 69
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleParcelAccessListUpdate(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 217 (ParcelAccessListUpdate).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xD9).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, Data_Field.Flags)
        packInt(byteBuffer, Data_Field.LocalID)
        packUUID(byteBuffer, Data_Field.TransactionID)
        packInt(byteBuffer, Data_Field.SequenceID)
        packInt(byteBuffer, Data_Field.Sections)
        byteBuffer.put((List_Fields.size.toByte()))
        for (list in List_Fields) {
            packUUID(byteBuffer, list.ID)
            packInt(byteBuffer, list.Time)
            packInt(byteBuffer, list.Flags)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        Data_Field.Flags = unpackInt(byteBuffer)
        Data_Field.LocalID = unpackInt(byteBuffer)
        Data_Field.TransactionID = unpackUUID(byteBuffer)
        Data_Field.SequenceID = unpackInt(byteBuffer)
        Data_Field.Sections = unpackInt(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val list = List()
            list.ID = unpackUUID(byteBuffer)
            list.Time = unpackInt(byteBuffer)
            list.Flags = unpackInt(byteBuffer)
            List_Fields.add(list)
        }
    }
}
