package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.UUID

/**
 * sim ->dataserver
 * This message is used to send up complete parcel properties for
 * persistance in the database.
 * If you add something here, you should probably also change the
 * simulator's database update query on startup.
 *
 * <p>Template: {@code UpdateParcel Low 221 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class UpdateParcel : SLMessage() {
    @JvmField var ParcelData_Field: ParcelData = ParcelData()

    /** Block ParcelData, Single. */
    open class ParcelData {
        @JvmField var ActualArea: Int = 0
        @JvmField var AllowPublish: Boolean = false
        @JvmField var AuthorizedBuyerID: UUID? = null
        @JvmField var BillableArea: Int = 0
        @JvmField var Category: Int = 0
        @JvmField var Description: ByteArray? = null
        @JvmField var GroupOwned: Boolean = false
        @JvmField var IsForSale: Boolean = false
        @JvmField var MaturePublish: Boolean = false
        @JvmField var MusicURL: ByteArray? = null
        @JvmField var Name: ByteArray? = null
        @JvmField var OwnerID: UUID? = null
        @JvmField var ParcelID: UUID? = null
        @JvmField var RegionHandle: Long = 0L
        @JvmField var RegionX: Float = 0f
        @JvmField var RegionY: Float = 0f
        @JvmField var SalePrice: Int = 0
        @JvmField var ShowDir: Boolean = false
        @JvmField var SnapshotID: UUID? = null
        @JvmField var Status: Int = 0
        @JvmField var UserLocation: LLVector3? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return ParcelData_Field.Name!!.size + 43 + 1 + ParcelData_Field.Description!!.size + 1 + ParcelData_Field.MusicURL!!.size + 4 + 4 + 4 + 4 + 1 + 1 + 1 + 16 + 12 + 4 + 16 + 1 + 1 + 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleUpdateParcel(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 221 (UpdateParcel).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xDD).toByte())
        packUUID(byteBuffer, ParcelData_Field.ParcelID)
        packLong(byteBuffer, ParcelData_Field.RegionHandle)
        packUUID(byteBuffer, ParcelData_Field.OwnerID)
        packBoolean(byteBuffer, ParcelData_Field.GroupOwned)
        packByte(byteBuffer, (ParcelData_Field.Status).toByte())
        packVariable(byteBuffer, ParcelData_Field.Name, 1)
        packVariable(byteBuffer, ParcelData_Field.Description, 1)
        packVariable(byteBuffer, ParcelData_Field.MusicURL, 1)
        packFloat(byteBuffer, ParcelData_Field.RegionX)
        packFloat(byteBuffer, ParcelData_Field.RegionY)
        packInt(byteBuffer, ParcelData_Field.ActualArea)
        packInt(byteBuffer, ParcelData_Field.BillableArea)
        packBoolean(byteBuffer, ParcelData_Field.ShowDir)
        packBoolean(byteBuffer, ParcelData_Field.IsForSale)
        packByte(byteBuffer, (ParcelData_Field.Category).toByte())
        packUUID(byteBuffer, ParcelData_Field.SnapshotID)
        packLLVector3(byteBuffer, ParcelData_Field.UserLocation)
        packInt(byteBuffer, ParcelData_Field.SalePrice)
        packUUID(byteBuffer, ParcelData_Field.AuthorizedBuyerID)
        packBoolean(byteBuffer, ParcelData_Field.AllowPublish)
        packBoolean(byteBuffer, ParcelData_Field.MaturePublish)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        ParcelData_Field.ParcelID = unpackUUID(byteBuffer)
        ParcelData_Field.RegionHandle = unpackLong(byteBuffer)
        ParcelData_Field.OwnerID = unpackUUID(byteBuffer)
        ParcelData_Field.GroupOwned = unpackBoolean(byteBuffer)
        ParcelData_Field.Status = unpackByte(byteBuffer).toInt() and 0xFF
        ParcelData_Field.Name = unpackVariable(byteBuffer, 1)
        ParcelData_Field.Description = unpackVariable(byteBuffer, 1)
        ParcelData_Field.MusicURL = unpackVariable(byteBuffer, 1)
        ParcelData_Field.RegionX = unpackFloat(byteBuffer)
        ParcelData_Field.RegionY = unpackFloat(byteBuffer)
        ParcelData_Field.ActualArea = unpackInt(byteBuffer)
        ParcelData_Field.BillableArea = unpackInt(byteBuffer)
        ParcelData_Field.ShowDir = unpackBoolean(byteBuffer)
        ParcelData_Field.IsForSale = unpackBoolean(byteBuffer)
        ParcelData_Field.Category = unpackByte(byteBuffer).toInt() and 0xFF
        ParcelData_Field.SnapshotID = unpackUUID(byteBuffer)
        ParcelData_Field.UserLocation = unpackLLVector3(byteBuffer)
        ParcelData_Field.SalePrice = unpackInt(byteBuffer)
        ParcelData_Field.AuthorizedBuyerID = unpackUUID(byteBuffer)
        ParcelData_Field.AllowPublish = unpackBoolean(byteBuffer)
        ParcelData_Field.MaturePublish = unpackBoolean(byteBuffer)
    }
}
