package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * ParcelClaim - change the owner of a patch of land
 * viewer -> sim
 * reliable
 *
 * <p>Template: {@code ParcelClaim Low 209 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class ParcelClaim : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var Data_Field: Data = Data()
    @JvmField val ParcelData_Fields = ArrayList<ParcelData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block Data, Single. */
    open class Data {
        @JvmField var Final: Boolean = false
        @JvmField var GroupID: UUID? = null
        @JvmField var IsGroupOwned: Boolean = false
    }

    /** Block ParcelData, Variable. */
    open class ParcelData {
        @JvmField var East: Float = 0f
        @JvmField var North: Float = 0f
        @JvmField var South: Float = 0f
        @JvmField var West: Float = 0f
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return (ParcelData_Fields.size * 16) + 55
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleParcelClaim(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 209 (ParcelClaim).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xD1).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, Data_Field.GroupID)
        packBoolean(byteBuffer, Data_Field.IsGroupOwned)
        packBoolean(byteBuffer, Data_Field.Final)
        byteBuffer.put((ParcelData_Fields.size.toByte()))
        for (parcelData in ParcelData_Fields) {
            packFloat(byteBuffer, parcelData.West)
            packFloat(byteBuffer, parcelData.South)
            packFloat(byteBuffer, parcelData.East)
            packFloat(byteBuffer, parcelData.North)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        Data_Field.GroupID = unpackUUID(byteBuffer)
        Data_Field.IsGroupOwned = unpackBoolean(byteBuffer)
        Data_Field.Final = unpackBoolean(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val parcelData = ParcelData()
            parcelData.West = unpackFloat(byteBuffer)
            parcelData.South = unpackFloat(byteBuffer)
            parcelData.East = unpackFloat(byteBuffer)
            parcelData.North = unpackFloat(byteBuffer)
            ParcelData_Fields.add(parcelData)
        }
    }
}
