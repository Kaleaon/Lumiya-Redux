package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ParcelBuy - change the owner of a patch of land.
 * viewer -> sim
 * reliable
 *
 * <p>Template: {@code ParcelBuy Low 213 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class ParcelBuy : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var Data_Field: Data = Data()
    @JvmField var ParcelData_Field: ParcelData = ParcelData()

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
        @JvmField var LocalID: Int = 0
        @JvmField var RemoveContribution: Boolean = false
    }

    /** Block ParcelData, Single. */
    open class ParcelData {
        @JvmField var Area: Int = 0
        @JvmField var Price: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 67
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleParcelBuy(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 213 (ParcelBuy).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xD5).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, Data_Field.GroupID)
        packBoolean(byteBuffer, Data_Field.IsGroupOwned)
        packBoolean(byteBuffer, Data_Field.RemoveContribution)
        packInt(byteBuffer, Data_Field.LocalID)
        packBoolean(byteBuffer, Data_Field.Final)
        packInt(byteBuffer, ParcelData_Field.Price)
        packInt(byteBuffer, ParcelData_Field.Area)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        Data_Field.GroupID = unpackUUID(byteBuffer)
        Data_Field.IsGroupOwned = unpackBoolean(byteBuffer)
        Data_Field.RemoveContribution = unpackBoolean(byteBuffer)
        Data_Field.LocalID = unpackInt(byteBuffer)
        Data_Field.Final = unpackBoolean(byteBuffer)
        ParcelData_Field.Price = unpackInt(byteBuffer)
        ParcelData_Field.Area = unpackInt(byteBuffer)
    }
}
