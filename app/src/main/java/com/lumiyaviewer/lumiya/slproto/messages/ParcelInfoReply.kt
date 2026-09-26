package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ParcelInfoReply
 * dataserver -> simulator -> viewer
 * reliable
 *
 * <p>Template: {@code ParcelInfoReply Low 55 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLRemoteParcelInfoProcessor::processParcelInfoReply()} in indra/newview/llremoteparcelrequest.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class ParcelInfoReply : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var Data_Field: Data = Data()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
    }

    /** Block Data, Single. */
    open class Data {
        @JvmField var ActualArea: Int = 0
        @JvmField var AuctionID: Int = 0
        @JvmField var BillableArea: Int = 0
        @JvmField var Desc: ByteArray? = null
        @JvmField var Dwell: Float = 0f
        @JvmField var Flags: Int = 0
        @JvmField var GlobalX: Float = 0f
        @JvmField var GlobalY: Float = 0f
        @JvmField var GlobalZ: Float = 0f
        @JvmField var Name: ByteArray? = null
        @JvmField var OwnerID: UUID? = null
        @JvmField var ParcelID: UUID? = null
        @JvmField var SalePrice: Int = 0
        @JvmField var SimName: ByteArray? = null
        @JvmField var SnapshotID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return Data_Field.Name!!.size + 33 + 1 + Data_Field.Desc!!.size + 4 + 4 + 1 + 4 + 4 + 4 + 1 + Data_Field.SimName!!.size + 16 + 4 + 4 + 4 + 20
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleParcelInfoReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 55 (ParcelInfoReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x37).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, Data_Field.ParcelID)
        packUUID(byteBuffer, Data_Field.OwnerID)
        packVariable(byteBuffer, Data_Field.Name, 1)
        packVariable(byteBuffer, Data_Field.Desc, 1)
        packInt(byteBuffer, Data_Field.ActualArea)
        packInt(byteBuffer, Data_Field.BillableArea)
        packByte(byteBuffer, (Data_Field.Flags).toByte())
        packFloat(byteBuffer, Data_Field.GlobalX)
        packFloat(byteBuffer, Data_Field.GlobalY)
        packFloat(byteBuffer, Data_Field.GlobalZ)
        packVariable(byteBuffer, Data_Field.SimName, 1)
        packUUID(byteBuffer, Data_Field.SnapshotID)
        packFloat(byteBuffer, Data_Field.Dwell)
        packInt(byteBuffer, Data_Field.SalePrice)
        packInt(byteBuffer, Data_Field.AuctionID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        Data_Field.ParcelID = unpackUUID(byteBuffer)
        Data_Field.OwnerID = unpackUUID(byteBuffer)
        Data_Field.Name = unpackVariable(byteBuffer, 1)
        Data_Field.Desc = unpackVariable(byteBuffer, 1)
        Data_Field.ActualArea = unpackInt(byteBuffer)
        Data_Field.BillableArea = unpackInt(byteBuffer)
        Data_Field.Flags = unpackByte(byteBuffer).toInt() and 0xFF
        Data_Field.GlobalX = unpackFloat(byteBuffer)
        Data_Field.GlobalY = unpackFloat(byteBuffer)
        Data_Field.GlobalZ = unpackFloat(byteBuffer)
        Data_Field.SimName = unpackVariable(byteBuffer, 1)
        Data_Field.SnapshotID = unpackUUID(byteBuffer)
        Data_Field.Dwell = unpackFloat(byteBuffer)
        Data_Field.SalePrice = unpackInt(byteBuffer)
        Data_Field.AuctionID = unpackInt(byteBuffer)
    }
}
