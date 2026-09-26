package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * ParcelSelectObjects
 * viewer -> sim
 * reliable
 *
 * <p>Template: {@code ParcelSelectObjects Low 202 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class ParcelSelectObjects : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var ParcelData_Field: ParcelData = ParcelData()
    @JvmField val ReturnIDs_Fields = ArrayList<ReturnIDs>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block ParcelData, Single. */
    open class ParcelData {
        @JvmField var LocalID: Int = 0
        @JvmField var ReturnType: Int = 0
    }

    /** Block ReturnIDs, Variable. */
    open class ReturnIDs {
        @JvmField var ReturnID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return (ReturnIDs_Fields.size * 16) + 45
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleParcelSelectObjects(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 202 (ParcelSelectObjects).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xCA).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, ParcelData_Field.LocalID)
        packInt(byteBuffer, ParcelData_Field.ReturnType)
        byteBuffer.put((ReturnIDs_Fields.size.toByte()))
        for (entry in ReturnIDs_Fields) {
            packUUID(byteBuffer, entry.ReturnID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        ParcelData_Field.LocalID = unpackInt(byteBuffer)
        ParcelData_Field.ReturnType = unpackInt(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val returnIDs = ReturnIDs()
            returnIDs.ReturnID = unpackUUID(byteBuffer)
            ReturnIDs_Fields.add(returnIDs)
        }
    }
}
