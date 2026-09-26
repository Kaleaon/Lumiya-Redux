package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ParcelProperties
 * sequence id = -1 for parcels that you explicitly selected
 * For agents, sequence id increments every time the agent transits into
 * a new parcel.  It is used to detect out-of-order agent parcel info updates.
 * Bitmap = packed bit field, one bit per parcel grid, on if that grid is
 * part of the selected parcel.
 * sim -> viewer
 * WARNING: This packet is potentially large.  With max length name,
 * description, music URL and media URL, it is 1526 + sizeof ( LLUUID ) bytes.
 *
 * <p>Template: {@code ParcelProperties High 23 Trusted Zerocoded UDPDeprecated}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLViewerParcelMgr::processParcelProperties()} in indra/newview/llviewerparcelmgr.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class ParcelProperties : SLMessage() {
    @JvmField var AgeVerificationBlock_Field: AgeVerificationBlock = AgeVerificationBlock()
    @JvmField var ParcelData_Field: ParcelData = ParcelData()

    /** Block AgeVerificationBlock, Single. */
    open class AgeVerificationBlock {
        @JvmField var RegionDenyAgeUnverified: Boolean = false // BOOL
    }

    /** Block ParcelData, Single. */
    open class ParcelData {
        @JvmField var AABBMax: LLVector3? = null // LLVector3
        @JvmField var AABBMin: LLVector3? = null // LLVector3
        @JvmField var Area: Int = 0 // S32
        @JvmField var AuctionID: Int = 0 // U32
        @JvmField var AuthBuyerID: UUID? = null // LLUUID
        @JvmField var Bitmap: ByteArray? = null // Variable 2 - packed bit-field
        @JvmField var Category: Int = 0 // U8
        @JvmField var ClaimDate: Int = 0 // S32 - time_t
        @JvmField var ClaimPrice: Int = 0 // S32
        @JvmField var Desc: ByteArray? = null // Variable 1 - string
        @JvmField var GroupID: UUID? = null // LLUUID
        @JvmField var GroupPrims: Int = 0 // S32
        @JvmField var IsGroupOwned: Boolean = false // BOOL
        @JvmField var LandingType: Int = 0 // U8
        @JvmField var LocalID: Int = 0 // S32
        @JvmField var MaxPrims: Int = 0 // S32
        @JvmField var MediaAutoScale: Int = 0 // U8
        @JvmField var MediaID: UUID? = null // LLUUID
        @JvmField var MediaURL: ByteArray? = null // Variable 1 - string
        @JvmField var MusicURL: ByteArray? = null // Variable 1 - string
        @JvmField var Name: ByteArray? = null // Variable 1 - string
        @JvmField var OtherCleanTime: Int = 0 // S32
        @JvmField var OtherCount: Int = 0 // S32
        @JvmField var OtherPrims: Int = 0 // S32
        @JvmField var OwnerID: UUID? = null // LLUUID
        @JvmField var OwnerPrims: Int = 0 // S32
        @JvmField var ParcelFlags: Int = 0 // U32
        @JvmField var ParcelPrimBonus: Float = 0f // F32
        @JvmField var PassHours: Float = 0f // F32
        @JvmField var PassPrice: Int = 0 // S32
        @JvmField var PublicCount: Int = 0 // S32
        @JvmField var RegionDenyAnonymous: Boolean = false // BOOL
        @JvmField var RegionDenyIdentified: Boolean = false // BOOL
        @JvmField var RegionDenyTransacted: Boolean = false // BOOL
        @JvmField var RegionPushOverride: Boolean = false // BOOL
        @JvmField var RentPrice: Int = 0 // S32
        @JvmField var RequestResult: Int = 0 // S32
        @JvmField var SalePrice: Int = 0 // S32
        @JvmField var SelectedPrims: Int = 0 // S32
        @JvmField var SelfCount: Int = 0 // S32
        @JvmField var SequenceID: Int = 0 // S32
        @JvmField var SimWideMaxPrims: Int = 0 // S32
        @JvmField var SimWideTotalPrims: Int = 0 // S32
        @JvmField var SnapSelection: Boolean = false // BOOL
        @JvmField var SnapshotID: UUID? = null // LLUUID
        @JvmField var Status: Int = 0 // U8 - owned vs. pending
        @JvmField var TotalPrims: Int = 0 // S32
        @JvmField var UserLocation: LLVector3? = null // LLVector3
        @JvmField var UserLookAt: LLVector3? = null // LLVector3
    }

    init {
        this.zeroCoded = true
        this.ParcelData_Field = ParcelData()
        this.AgeVerificationBlock_Field = AgeVerificationBlock()
    }

    override fun CalcPayloadSize(): Int {
        return this.ParcelData_Field.Bitmap.size + 84 + 4 + 1 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 1 + this.ParcelData_Field.Name.size + 1 + this.ParcelData_Field.Desc.size + 1 + this.ParcelData_Field.MusicURL.size + 1 + this.ParcelData_Field.MediaURL.size + 16 + 1 + 16 + 4 + 4 + 1 + 16 + 16 + 12 + 12 + 1 + 1 + 1 + 1 + 1 + 1 + 1
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleParcelProperties(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: High 23 (ParcelProperties).
        byteBuffer.put((0x17).toByte())
        packInt(byteBuffer, this.ParcelData_Field.RequestResult)
        packInt(byteBuffer, this.ParcelData_Field.SequenceID)
        packBoolean(byteBuffer, this.ParcelData_Field.SnapSelection)
        packInt(byteBuffer, this.ParcelData_Field.SelfCount)
        packInt(byteBuffer, this.ParcelData_Field.OtherCount)
        packInt(byteBuffer, this.ParcelData_Field.PublicCount)
        packInt(byteBuffer, this.ParcelData_Field.LocalID)
        packUUID(byteBuffer, this.ParcelData_Field.OwnerID)
        packBoolean(byteBuffer, this.ParcelData_Field.IsGroupOwned)
        packInt(byteBuffer, this.ParcelData_Field.AuctionID)
        packInt(byteBuffer, this.ParcelData_Field.ClaimDate)
        packInt(byteBuffer, this.ParcelData_Field.ClaimPrice)
        packInt(byteBuffer, this.ParcelData_Field.RentPrice)
        packLLVector3(byteBuffer, this.ParcelData_Field.AABBMin)
        packLLVector3(byteBuffer, this.ParcelData_Field.AABBMax)
        packVariable(byteBuffer, this.ParcelData_Field.Bitmap, 2)
        packInt(byteBuffer, this.ParcelData_Field.Area)
        packByte(byteBuffer, (this.ParcelData_Field.Status).toByte())
        packInt(byteBuffer, this.ParcelData_Field.SimWideMaxPrims)
        packInt(byteBuffer, this.ParcelData_Field.SimWideTotalPrims)
        packInt(byteBuffer, this.ParcelData_Field.MaxPrims)
        packInt(byteBuffer, this.ParcelData_Field.TotalPrims)
        packInt(byteBuffer, this.ParcelData_Field.OwnerPrims)
        packInt(byteBuffer, this.ParcelData_Field.GroupPrims)
        packInt(byteBuffer, this.ParcelData_Field.OtherPrims)
        packInt(byteBuffer, this.ParcelData_Field.SelectedPrims)
        packFloat(byteBuffer, this.ParcelData_Field.ParcelPrimBonus)
        packInt(byteBuffer, this.ParcelData_Field.OtherCleanTime)
        packInt(byteBuffer, this.ParcelData_Field.ParcelFlags)
        packInt(byteBuffer, this.ParcelData_Field.SalePrice)
        packVariable(byteBuffer, this.ParcelData_Field.Name, 1)
        packVariable(byteBuffer, this.ParcelData_Field.Desc, 1)
        packVariable(byteBuffer, this.ParcelData_Field.MusicURL, 1)
        packVariable(byteBuffer, this.ParcelData_Field.MediaURL, 1)
        packUUID(byteBuffer, this.ParcelData_Field.MediaID)
        packByte(byteBuffer, (this.ParcelData_Field.MediaAutoScale).toByte())
        packUUID(byteBuffer, this.ParcelData_Field.GroupID)
        packInt(byteBuffer, this.ParcelData_Field.PassPrice)
        packFloat(byteBuffer, this.ParcelData_Field.PassHours)
        packByte(byteBuffer, (this.ParcelData_Field.Category).toByte())
        packUUID(byteBuffer, this.ParcelData_Field.AuthBuyerID)
        packUUID(byteBuffer, this.ParcelData_Field.SnapshotID)
        packLLVector3(byteBuffer, this.ParcelData_Field.UserLocation)
        packLLVector3(byteBuffer, this.ParcelData_Field.UserLookAt)
        packByte(byteBuffer, (this.ParcelData_Field.LandingType).toByte())
        packBoolean(byteBuffer, this.ParcelData_Field.RegionPushOverride)
        packBoolean(byteBuffer, this.ParcelData_Field.RegionDenyAnonymous)
        packBoolean(byteBuffer, this.ParcelData_Field.RegionDenyIdentified)
        packBoolean(byteBuffer, this.ParcelData_Field.RegionDenyTransacted)
        packBoolean(byteBuffer, this.AgeVerificationBlock_Field.RegionDenyAgeUnverified)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        this.ParcelData_Field.RequestResult = unpackInt(byteBuffer)
        this.ParcelData_Field.SequenceID = unpackInt(byteBuffer)
        this.ParcelData_Field.SnapSelection = unpackBoolean(byteBuffer)
        this.ParcelData_Field.SelfCount = unpackInt(byteBuffer)
        this.ParcelData_Field.OtherCount = unpackInt(byteBuffer)
        this.ParcelData_Field.PublicCount = unpackInt(byteBuffer)
        this.ParcelData_Field.LocalID = unpackInt(byteBuffer)
        this.ParcelData_Field.OwnerID = unpackUUID(byteBuffer)
        this.ParcelData_Field.IsGroupOwned = unpackBoolean(byteBuffer)
        this.ParcelData_Field.AuctionID = unpackInt(byteBuffer)
        this.ParcelData_Field.ClaimDate = unpackInt(byteBuffer)
        this.ParcelData_Field.ClaimPrice = unpackInt(byteBuffer)
        this.ParcelData_Field.RentPrice = unpackInt(byteBuffer)
        this.ParcelData_Field.AABBMin = unpackLLVector3(byteBuffer)
        this.ParcelData_Field.AABBMax = unpackLLVector3(byteBuffer)
        this.ParcelData_Field.Bitmap = unpackVariable(byteBuffer, 2)
        this.ParcelData_Field.Area = unpackInt(byteBuffer)
        this.ParcelData_Field.Status = unpackByte(byteBuffer) & 0xFF
        this.ParcelData_Field.SimWideMaxPrims = unpackInt(byteBuffer)
        this.ParcelData_Field.SimWideTotalPrims = unpackInt(byteBuffer)
        this.ParcelData_Field.MaxPrims = unpackInt(byteBuffer)
        this.ParcelData_Field.TotalPrims = unpackInt(byteBuffer)
        this.ParcelData_Field.OwnerPrims = unpackInt(byteBuffer)
        this.ParcelData_Field.GroupPrims = unpackInt(byteBuffer)
        this.ParcelData_Field.OtherPrims = unpackInt(byteBuffer)
        this.ParcelData_Field.SelectedPrims = unpackInt(byteBuffer)
        this.ParcelData_Field.ParcelPrimBonus = unpackFloat(byteBuffer)
        this.ParcelData_Field.OtherCleanTime = unpackInt(byteBuffer)
        this.ParcelData_Field.ParcelFlags = unpackInt(byteBuffer)
        this.ParcelData_Field.SalePrice = unpackInt(byteBuffer)
        this.ParcelData_Field.Name = unpackVariable(byteBuffer, 1)
        this.ParcelData_Field.Desc = unpackVariable(byteBuffer, 1)
        this.ParcelData_Field.MusicURL = unpackVariable(byteBuffer, 1)
        this.ParcelData_Field.MediaURL = unpackVariable(byteBuffer, 1)
        this.ParcelData_Field.MediaID = unpackUUID(byteBuffer)
        this.ParcelData_Field.MediaAutoScale = unpackByte(byteBuffer) & 0xFF
        this.ParcelData_Field.GroupID = unpackUUID(byteBuffer)
        this.ParcelData_Field.PassPrice = unpackInt(byteBuffer)
        this.ParcelData_Field.PassHours = unpackFloat(byteBuffer)
        this.ParcelData_Field.Category = unpackByte(byteBuffer) & 0xFF
        this.ParcelData_Field.AuthBuyerID = unpackUUID(byteBuffer)
        this.ParcelData_Field.SnapshotID = unpackUUID(byteBuffer)
        this.ParcelData_Field.UserLocation = unpackLLVector3(byteBuffer)
        this.ParcelData_Field.UserLookAt = unpackLLVector3(byteBuffer)
        this.ParcelData_Field.LandingType = unpackByte(byteBuffer) & 0xFF
        this.ParcelData_Field.RegionPushOverride = unpackBoolean(byteBuffer)
        this.ParcelData_Field.RegionDenyAnonymous = unpackBoolean(byteBuffer)
        this.ParcelData_Field.RegionDenyIdentified = unpackBoolean(byteBuffer)
        this.ParcelData_Field.RegionDenyTransacted = unpackBoolean(byteBuffer)
        this.AgeVerificationBlock_Field.RegionDenyAgeUnverified = unpackBoolean(byteBuffer)
    }
}

