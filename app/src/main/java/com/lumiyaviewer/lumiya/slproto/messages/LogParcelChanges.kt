package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * sim -> dataserver
 *
 * <p>Template: {@code LogParcelChanges Low 224 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class LogParcelChanges : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val ParcelData_Fields = ArrayList<ParcelData>()
    @JvmField var RegionData_Field: RegionData = RegionData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
    }

    /** Block ParcelData, Variable. */
    open class ParcelData {
        @JvmField var Action: Int = 0
        @JvmField var ActualArea: Int = 0
        @JvmField var IsOwnerGroup: Boolean = false
        @JvmField var OwnerID: UUID? = null
        @JvmField var ParcelID: UUID? = null
        @JvmField var TransactionID: UUID? = null
    }

    /** Block RegionData, Single. */
    open class RegionData {
        @JvmField var RegionHandle: Long = 0L
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return (ParcelData_Fields.size * 54) + 29
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleLogParcelChanges(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 224 (LogParcelChanges).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xE0).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packLong(byteBuffer, RegionData_Field.RegionHandle)
        byteBuffer.put((ParcelData_Fields.size.toByte()))
        for (parcelData in ParcelData_Fields) {
            packUUID(byteBuffer, parcelData.ParcelID)
            packUUID(byteBuffer, parcelData.OwnerID)
            packBoolean(byteBuffer, parcelData.IsOwnerGroup)
            packInt(byteBuffer, parcelData.ActualArea)
            packByte(byteBuffer, (parcelData.Action).toByte())
            packUUID(byteBuffer, parcelData.TransactionID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        RegionData_Field.RegionHandle = unpackLong(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val parcelData = ParcelData()
            parcelData.ParcelID = unpackUUID(byteBuffer)
            parcelData.OwnerID = unpackUUID(byteBuffer)
            parcelData.IsOwnerGroup = unpackBoolean(byteBuffer)
            parcelData.ActualArea = unpackInt(byteBuffer)
            parcelData.Action = unpackByte(byteBuffer).toInt()
            parcelData.TransactionID = unpackUUID(byteBuffer)
            ParcelData_Fields.add(parcelData)
        }
    }
}
