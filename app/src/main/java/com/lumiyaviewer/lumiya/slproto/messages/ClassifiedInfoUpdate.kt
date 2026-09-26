package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3d
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ClassifiedInfoUpdate
 * Update a classified.  ParcelID and EstateID are set
 * on the simulator as the message passes through.
 * viewer -> simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code ClassifiedInfoUpdate Low 45 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class ClassifiedInfoUpdate : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var Data_Field: Data = Data()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block Data, Single. */
    open class Data {
        @JvmField var Category: Int = 0
        @JvmField var ClassifiedFlags: Int = 0
        @JvmField var ClassifiedID: UUID? = null
        @JvmField var Desc: ByteArray? = null
        @JvmField var Name: ByteArray? = null
        @JvmField var ParcelID: UUID? = null
        @JvmField var ParentEstate: Int = 0
        @JvmField var PosGlobal: LLVector3d? = null
        @JvmField var PriceForListing: Int = 0
        @JvmField var SnapshotID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return Data_Field.Name!!.size + 21 + 2 + Data_Field.Desc!!.size + 16 + 4 + 16 + 24 + 1 + 4 + 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleClassifiedInfoUpdate(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 45 (ClassifiedInfoUpdate).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x2D).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, Data_Field.ClassifiedID)
        packInt(byteBuffer, Data_Field.Category)
        packVariable(byteBuffer, Data_Field.Name, 1)
        packVariable(byteBuffer, Data_Field.Desc, 2)
        packUUID(byteBuffer, Data_Field.ParcelID)
        packInt(byteBuffer, Data_Field.ParentEstate)
        packUUID(byteBuffer, Data_Field.SnapshotID)
        packLLVector3d(byteBuffer, Data_Field.PosGlobal)
        packByte(byteBuffer, (Data_Field.ClassifiedFlags).toByte())
        packInt(byteBuffer, Data_Field.PriceForListing)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        Data_Field.ClassifiedID = unpackUUID(byteBuffer)
        Data_Field.Category = unpackInt(byteBuffer)
        Data_Field.Name = unpackVariable(byteBuffer, 1)
        Data_Field.Desc = unpackVariable(byteBuffer, 2)
        Data_Field.ParcelID = unpackUUID(byteBuffer)
        Data_Field.ParentEstate = unpackInt(byteBuffer)
        Data_Field.SnapshotID = unpackUUID(byteBuffer)
        Data_Field.PosGlobal = unpackLLVector3d(byteBuffer)
        Data_Field.ClassifiedFlags = unpackByte(byteBuffer).toInt() and 0xFF
        Data_Field.PriceForListing = unpackInt(byteBuffer)
    }
}
