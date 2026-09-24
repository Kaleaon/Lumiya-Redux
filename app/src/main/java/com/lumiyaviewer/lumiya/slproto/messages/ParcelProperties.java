package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;
import java.util.UUID;

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
public class ParcelProperties extends SLMessage {
    public AgeVerificationBlock AgeVerificationBlock_Field;
    public ParcelData ParcelData_Field;

    /** Block AgeVerificationBlock, Single. */
    public static class AgeVerificationBlock {
        public boolean RegionDenyAgeUnverified; // BOOL
    }

    /** Block ParcelData, Single. */
    public static class ParcelData {
        public LLVector3 AABBMax; // LLVector3
        public LLVector3 AABBMin; // LLVector3
        public int Area; // S32
        public int AuctionID; // U32
        public UUID AuthBuyerID; // LLUUID
        public byte[] Bitmap; // Variable 2 - packed bit-field
        public int Category; // U8
        public int ClaimDate; // S32 - time_t
        public int ClaimPrice; // S32
        public byte[] Desc; // Variable 1 - string
        public UUID GroupID; // LLUUID
        public int GroupPrims; // S32
        public boolean IsGroupOwned; // BOOL
        public int LandingType; // U8
        public int LocalID; // S32
        public int MaxPrims; // S32
        public int MediaAutoScale; // U8
        public UUID MediaID; // LLUUID
        public byte[] MediaURL; // Variable 1 - string
        public byte[] MusicURL; // Variable 1 - string
        public byte[] Name; // Variable 1 - string
        public int OtherCleanTime; // S32
        public int OtherCount; // S32
        public int OtherPrims; // S32
        public UUID OwnerID; // LLUUID
        public int OwnerPrims; // S32
        public int ParcelFlags; // U32
        public float ParcelPrimBonus; // F32
        public float PassHours; // F32
        public int PassPrice; // S32
        public int PublicCount; // S32
        public boolean RegionDenyAnonymous; // BOOL
        public boolean RegionDenyIdentified; // BOOL
        public boolean RegionDenyTransacted; // BOOL
        public boolean RegionPushOverride; // BOOL
        public int RentPrice; // S32
        public int RequestResult; // S32
        public int SalePrice; // S32
        public int SelectedPrims; // S32
        public int SelfCount; // S32
        public int SequenceID; // S32
        public int SimWideMaxPrims; // S32
        public int SimWideTotalPrims; // S32
        public boolean SnapSelection; // BOOL
        public UUID SnapshotID; // LLUUID
        public int Status; // U8 - owned vs. pending
        public int TotalPrims; // S32
        public LLVector3 UserLocation; // LLVector3
        public LLVector3 UserLookAt; // LLVector3
    }

    public ParcelProperties() {
        this.zeroCoded = true;
        this.ParcelData_Field = new ParcelData();
        this.AgeVerificationBlock_Field = new AgeVerificationBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return this.ParcelData_Field.Bitmap.length + 84 + 4 + 1 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 1 + this.ParcelData_Field.Name.length + 1 + this.ParcelData_Field.Desc.length + 1 + this.ParcelData_Field.MusicURL.length + 1 + this.ParcelData_Field.MediaURL.length + 16 + 1 + 16 + 4 + 4 + 1 + 16 + 16 + 12 + 12 + 1 + 1 + 1 + 1 + 1 + 1 + 1;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleParcelProperties(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: High 23 (ParcelProperties).
        byteBuffer.put((byte) 0x17);
        packInt(byteBuffer, this.ParcelData_Field.RequestResult);
        packInt(byteBuffer, this.ParcelData_Field.SequenceID);
        packBoolean(byteBuffer, this.ParcelData_Field.SnapSelection);
        packInt(byteBuffer, this.ParcelData_Field.SelfCount);
        packInt(byteBuffer, this.ParcelData_Field.OtherCount);
        packInt(byteBuffer, this.ParcelData_Field.PublicCount);
        packInt(byteBuffer, this.ParcelData_Field.LocalID);
        packUUID(byteBuffer, this.ParcelData_Field.OwnerID);
        packBoolean(byteBuffer, this.ParcelData_Field.IsGroupOwned);
        packInt(byteBuffer, this.ParcelData_Field.AuctionID);
        packInt(byteBuffer, this.ParcelData_Field.ClaimDate);
        packInt(byteBuffer, this.ParcelData_Field.ClaimPrice);
        packInt(byteBuffer, this.ParcelData_Field.RentPrice);
        packLLVector3(byteBuffer, this.ParcelData_Field.AABBMin);
        packLLVector3(byteBuffer, this.ParcelData_Field.AABBMax);
        packVariable(byteBuffer, this.ParcelData_Field.Bitmap, 2);
        packInt(byteBuffer, this.ParcelData_Field.Area);
        packByte(byteBuffer, (byte) this.ParcelData_Field.Status);
        packInt(byteBuffer, this.ParcelData_Field.SimWideMaxPrims);
        packInt(byteBuffer, this.ParcelData_Field.SimWideTotalPrims);
        packInt(byteBuffer, this.ParcelData_Field.MaxPrims);
        packInt(byteBuffer, this.ParcelData_Field.TotalPrims);
        packInt(byteBuffer, this.ParcelData_Field.OwnerPrims);
        packInt(byteBuffer, this.ParcelData_Field.GroupPrims);
        packInt(byteBuffer, this.ParcelData_Field.OtherPrims);
        packInt(byteBuffer, this.ParcelData_Field.SelectedPrims);
        packFloat(byteBuffer, this.ParcelData_Field.ParcelPrimBonus);
        packInt(byteBuffer, this.ParcelData_Field.OtherCleanTime);
        packInt(byteBuffer, this.ParcelData_Field.ParcelFlags);
        packInt(byteBuffer, this.ParcelData_Field.SalePrice);
        packVariable(byteBuffer, this.ParcelData_Field.Name, 1);
        packVariable(byteBuffer, this.ParcelData_Field.Desc, 1);
        packVariable(byteBuffer, this.ParcelData_Field.MusicURL, 1);
        packVariable(byteBuffer, this.ParcelData_Field.MediaURL, 1);
        packUUID(byteBuffer, this.ParcelData_Field.MediaID);
        packByte(byteBuffer, (byte) this.ParcelData_Field.MediaAutoScale);
        packUUID(byteBuffer, this.ParcelData_Field.GroupID);
        packInt(byteBuffer, this.ParcelData_Field.PassPrice);
        packFloat(byteBuffer, this.ParcelData_Field.PassHours);
        packByte(byteBuffer, (byte) this.ParcelData_Field.Category);
        packUUID(byteBuffer, this.ParcelData_Field.AuthBuyerID);
        packUUID(byteBuffer, this.ParcelData_Field.SnapshotID);
        packLLVector3(byteBuffer, this.ParcelData_Field.UserLocation);
        packLLVector3(byteBuffer, this.ParcelData_Field.UserLookAt);
        packByte(byteBuffer, (byte) this.ParcelData_Field.LandingType);
        packBoolean(byteBuffer, this.ParcelData_Field.RegionPushOverride);
        packBoolean(byteBuffer, this.ParcelData_Field.RegionDenyAnonymous);
        packBoolean(byteBuffer, this.ParcelData_Field.RegionDenyIdentified);
        packBoolean(byteBuffer, this.ParcelData_Field.RegionDenyTransacted);
        packBoolean(byteBuffer, this.AgeVerificationBlock_Field.RegionDenyAgeUnverified);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.ParcelData_Field.RequestResult = unpackInt(byteBuffer);
        this.ParcelData_Field.SequenceID = unpackInt(byteBuffer);
        this.ParcelData_Field.SnapSelection = unpackBoolean(byteBuffer);
        this.ParcelData_Field.SelfCount = unpackInt(byteBuffer);
        this.ParcelData_Field.OtherCount = unpackInt(byteBuffer);
        this.ParcelData_Field.PublicCount = unpackInt(byteBuffer);
        this.ParcelData_Field.LocalID = unpackInt(byteBuffer);
        this.ParcelData_Field.OwnerID = unpackUUID(byteBuffer);
        this.ParcelData_Field.IsGroupOwned = unpackBoolean(byteBuffer);
        this.ParcelData_Field.AuctionID = unpackInt(byteBuffer);
        this.ParcelData_Field.ClaimDate = unpackInt(byteBuffer);
        this.ParcelData_Field.ClaimPrice = unpackInt(byteBuffer);
        this.ParcelData_Field.RentPrice = unpackInt(byteBuffer);
        this.ParcelData_Field.AABBMin = unpackLLVector3(byteBuffer);
        this.ParcelData_Field.AABBMax = unpackLLVector3(byteBuffer);
        this.ParcelData_Field.Bitmap = unpackVariable(byteBuffer, 2);
        this.ParcelData_Field.Area = unpackInt(byteBuffer);
        this.ParcelData_Field.Status = unpackByte(byteBuffer) & 0xFF;
        this.ParcelData_Field.SimWideMaxPrims = unpackInt(byteBuffer);
        this.ParcelData_Field.SimWideTotalPrims = unpackInt(byteBuffer);
        this.ParcelData_Field.MaxPrims = unpackInt(byteBuffer);
        this.ParcelData_Field.TotalPrims = unpackInt(byteBuffer);
        this.ParcelData_Field.OwnerPrims = unpackInt(byteBuffer);
        this.ParcelData_Field.GroupPrims = unpackInt(byteBuffer);
        this.ParcelData_Field.OtherPrims = unpackInt(byteBuffer);
        this.ParcelData_Field.SelectedPrims = unpackInt(byteBuffer);
        this.ParcelData_Field.ParcelPrimBonus = unpackFloat(byteBuffer);
        this.ParcelData_Field.OtherCleanTime = unpackInt(byteBuffer);
        this.ParcelData_Field.ParcelFlags = unpackInt(byteBuffer);
        this.ParcelData_Field.SalePrice = unpackInt(byteBuffer);
        this.ParcelData_Field.Name = unpackVariable(byteBuffer, 1);
        this.ParcelData_Field.Desc = unpackVariable(byteBuffer, 1);
        this.ParcelData_Field.MusicURL = unpackVariable(byteBuffer, 1);
        this.ParcelData_Field.MediaURL = unpackVariable(byteBuffer, 1);
        this.ParcelData_Field.MediaID = unpackUUID(byteBuffer);
        this.ParcelData_Field.MediaAutoScale = unpackByte(byteBuffer) & 0xFF;
        this.ParcelData_Field.GroupID = unpackUUID(byteBuffer);
        this.ParcelData_Field.PassPrice = unpackInt(byteBuffer);
        this.ParcelData_Field.PassHours = unpackFloat(byteBuffer);
        this.ParcelData_Field.Category = unpackByte(byteBuffer) & 0xFF;
        this.ParcelData_Field.AuthBuyerID = unpackUUID(byteBuffer);
        this.ParcelData_Field.SnapshotID = unpackUUID(byteBuffer);
        this.ParcelData_Field.UserLocation = unpackLLVector3(byteBuffer);
        this.ParcelData_Field.UserLookAt = unpackLLVector3(byteBuffer);
        this.ParcelData_Field.LandingType = unpackByte(byteBuffer) & 0xFF;
        this.ParcelData_Field.RegionPushOverride = unpackBoolean(byteBuffer);
        this.ParcelData_Field.RegionDenyAnonymous = unpackBoolean(byteBuffer);
        this.ParcelData_Field.RegionDenyIdentified = unpackBoolean(byteBuffer);
        this.ParcelData_Field.RegionDenyTransacted = unpackBoolean(byteBuffer);
        this.AgeVerificationBlock_Field.RegionDenyAgeUnverified = unpackBoolean(byteBuffer);
    }
}
