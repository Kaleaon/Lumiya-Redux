package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3d
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ClassifiedInfoReply
 * dataserver -> simulator
 * simulator -> viewer
 * reliable
 *
 * <p>Template: {@code ClassifiedInfoReply Low 44 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLAvatarPropertiesProcessor::processClassifiedInfoReply()} in indra/newview/llavatarpropertiesprocessor.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class ClassifiedInfoReply : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var Data_Field: Data = Data()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
    }

    /** Block Data, Single. */
    open class Data {
        @JvmField var Category: Int = 0
        @JvmField var ClassifiedFlags: Int = 0
        @JvmField var ClassifiedID: UUID? = null
        @JvmField var CreationDate: Int = 0
        @JvmField var CreatorID: UUID? = null
        @JvmField var Desc: ByteArray? = null
        @JvmField var ExpirationDate: Int = 0
        @JvmField var Name: ByteArray? = null
        @JvmField var ParcelID: UUID? = null
        @JvmField var ParcelName: ByteArray? = null
        @JvmField var ParentEstate: Int = 0
        @JvmField var PosGlobal: LLVector3d? = null
        @JvmField var PriceForListing: Int = 0
        @JvmField var SimName: ByteArray? = null
        @JvmField var SnapshotID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return Data_Field.Name!!.size + 45 + 2 + Data_Field.Desc!!.size + 16 + 4 + 16 + 1 + Data_Field.SimName!!.size + 24 + 1 + Data_Field.ParcelName!!.size + 1 + 4 + 20
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleClassifiedInfoReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 44 (ClassifiedInfoReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x2C).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, Data_Field.ClassifiedID)
        packUUID(byteBuffer, Data_Field.CreatorID)
        packInt(byteBuffer, Data_Field.CreationDate)
        packInt(byteBuffer, Data_Field.ExpirationDate)
        packInt(byteBuffer, Data_Field.Category)
        packVariable(byteBuffer, Data_Field.Name, 1)
        packVariable(byteBuffer, Data_Field.Desc, 2)
        packUUID(byteBuffer, Data_Field.ParcelID)
        packInt(byteBuffer, Data_Field.ParentEstate)
        packUUID(byteBuffer, Data_Field.SnapshotID)
        packVariable(byteBuffer, Data_Field.SimName, 1)
        packLLVector3d(byteBuffer, Data_Field.PosGlobal)
        packVariable(byteBuffer, Data_Field.ParcelName, 1)
        packByte(byteBuffer, (Data_Field.ClassifiedFlags).toByte())
        packInt(byteBuffer, Data_Field.PriceForListing)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        Data_Field.ClassifiedID = unpackUUID(byteBuffer)
        Data_Field.CreatorID = unpackUUID(byteBuffer)
        Data_Field.CreationDate = unpackInt(byteBuffer)
        Data_Field.ExpirationDate = unpackInt(byteBuffer)
        Data_Field.Category = unpackInt(byteBuffer)
        Data_Field.Name = unpackVariable(byteBuffer, 1)
        Data_Field.Desc = unpackVariable(byteBuffer, 2)
        Data_Field.ParcelID = unpackUUID(byteBuffer)
        Data_Field.ParentEstate = unpackInt(byteBuffer)
        Data_Field.SnapshotID = unpackUUID(byteBuffer)
        Data_Field.SimName = unpackVariable(byteBuffer, 1)
        Data_Field.PosGlobal = unpackLLVector3d(byteBuffer)
        Data_Field.ParcelName = unpackVariable(byteBuffer, 1)
        Data_Field.ClassifiedFlags = unpackByte(byteBuffer).toInt() and 0xFF
        Data_Field.PriceForListing = unpackInt(byteBuffer)
    }
}
