package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ParcelPropertiesUpdate
 * viewer -> sim
 * reliable
 *
 * <p>Template: {@code ParcelPropertiesUpdate Low 198 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class ParcelPropertiesUpdate : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var ParcelData_Field: ParcelData = ParcelData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block ParcelData, Single. */
    open class ParcelData {
        @JvmField var AuthBuyerID: UUID? = null
        @JvmField var Category: Int = 0
        @JvmField var Desc: ByteArray? = null
        @JvmField var Flags: Int = 0
        @JvmField var GroupID: UUID? = null
        @JvmField var LandingType: Int = 0
        @JvmField var LocalID: Int = 0
        @JvmField var MediaAutoScale: Int = 0
        @JvmField var MediaID: UUID? = null
        @JvmField var MediaURL: ByteArray? = null
        @JvmField var MusicURL: ByteArray? = null
        @JvmField var Name: ByteArray? = null
        @JvmField var ParcelFlags: Int = 0
        @JvmField var PassHours: Float = 0f
        @JvmField var PassPrice: Int = 0
        @JvmField var SalePrice: Int = 0
        @JvmField var SnapshotID: UUID? = null
        @JvmField var UserLocation: LLVector3? = null
        @JvmField var UserLookAt: LLVector3? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return ParcelData_Field.Name!!.size + 17 + 1 + ParcelData_Field.Desc!!.size + 1 + ParcelData_Field.MusicURL!!.size + 1 + ParcelData_Field.MediaURL!!.size + 16 + 1 + 16 + 4 + 4 + 1 + 16 + 16 + 12 + 12 + 1 + 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleParcelPropertiesUpdate(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 198 (ParcelPropertiesUpdate).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xC6).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, ParcelData_Field.LocalID)
        packInt(byteBuffer, ParcelData_Field.Flags)
        packInt(byteBuffer, ParcelData_Field.ParcelFlags)
        packInt(byteBuffer, ParcelData_Field.SalePrice)
        packVariable(byteBuffer, ParcelData_Field.Name, 1)
        packVariable(byteBuffer, ParcelData_Field.Desc, 1)
        packVariable(byteBuffer, ParcelData_Field.MusicURL, 1)
        packVariable(byteBuffer, ParcelData_Field.MediaURL, 1)
        packUUID(byteBuffer, ParcelData_Field.MediaID)
        packByte(byteBuffer, (ParcelData_Field.MediaAutoScale).toByte())
        packUUID(byteBuffer, ParcelData_Field.GroupID)
        packInt(byteBuffer, ParcelData_Field.PassPrice)
        packFloat(byteBuffer, ParcelData_Field.PassHours)
        packByte(byteBuffer, (ParcelData_Field.Category).toByte())
        packUUID(byteBuffer, ParcelData_Field.AuthBuyerID)
        packUUID(byteBuffer, ParcelData_Field.SnapshotID)
        packLLVector3(byteBuffer, ParcelData_Field.UserLocation)
        packLLVector3(byteBuffer, ParcelData_Field.UserLookAt)
        packByte(byteBuffer, (ParcelData_Field.LandingType).toByte())
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        ParcelData_Field.LocalID = unpackInt(byteBuffer)
        ParcelData_Field.Flags = unpackInt(byteBuffer)
        ParcelData_Field.ParcelFlags = unpackInt(byteBuffer)
        ParcelData_Field.SalePrice = unpackInt(byteBuffer)
        ParcelData_Field.Name = unpackVariable(byteBuffer, 1)
        ParcelData_Field.Desc = unpackVariable(byteBuffer, 1)
        ParcelData_Field.MusicURL = unpackVariable(byteBuffer, 1)
        ParcelData_Field.MediaURL = unpackVariable(byteBuffer, 1)
        ParcelData_Field.MediaID = unpackUUID(byteBuffer)
        ParcelData_Field.MediaAutoScale = unpackByte(byteBuffer).toInt() and 0xFF
        ParcelData_Field.GroupID = unpackUUID(byteBuffer)
        ParcelData_Field.PassPrice = unpackInt(byteBuffer)
        ParcelData_Field.PassHours = unpackFloat(byteBuffer)
        ParcelData_Field.Category = unpackByte(byteBuffer).toInt() and 0xFF
        ParcelData_Field.AuthBuyerID = unpackUUID(byteBuffer)
        ParcelData_Field.SnapshotID = unpackUUID(byteBuffer)
        ParcelData_Field.UserLocation = unpackLLVector3(byteBuffer)
        ParcelData_Field.UserLookAt = unpackLLVector3(byteBuffer)
        ParcelData_Field.LandingType = unpackByte(byteBuffer).toInt() and 0xFF
    }
}
