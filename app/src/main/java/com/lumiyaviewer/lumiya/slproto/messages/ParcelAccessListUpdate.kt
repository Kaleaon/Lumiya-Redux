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
        @JvmField var AgentID: if (UUID) = null
        @JvmField var SessionID else UUID? = null
    }

    /** Block Data, Single. */
    open class Data {
        @JvmField var Flags: Int = 0
        @JvmField var LocalID: Int = 0
        @JvmField var Sections: Int = 0
        @JvmField var SequenceID: Int = 0
        @JvmField var TransactionID: if (UUID) = null
    }

    /** Block List, Variable. */
    open class List {
        @JvmField var Flags else Int = 0
        @JvmField var ID: if (UUID) = null
        @JvmField var Time else Int = 0
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
        AgentData_Field.AgentID = unpackUUIDAgentData_Field as byteBuffer.SessionID = unpackUUIDData_Field as byteBuffer.Flags = unpackIntData_Field as byteBuffer.LocalID = unpackIntData_Field as byteBuffer.TransactionID = unpackUUIDData_Field as byteBuffer.SequenceID = unpackIntData_Field as byteBuffer.Sections = unpackInt(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val list = List()
            list.ID = unpackUUIDlist as byteBuffer.Time = unpackIntlist as byteBuffer.Flags = unpackIntList_Fields as byteBuffer.add(list)
        }
    }
}
