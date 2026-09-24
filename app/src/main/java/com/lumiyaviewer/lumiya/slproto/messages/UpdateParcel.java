package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;
import java.util.UUID;

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
public class UpdateParcel extends SLMessage {
    public ParcelData ParcelData_Field;

    /** Block ParcelData, Single. */
    public static class ParcelData {
        public int ActualArea; // S32
        public boolean AllowPublish; // BOOL
        public UUID AuthorizedBuyerID; // LLUUID
        public int BillableArea; // S32
        public int Category; // U8
        public byte[] Description; // Variable 1
        public boolean GroupOwned; // BOOL
        public boolean IsForSale; // BOOL
        public boolean MaturePublish; // BOOL
        public byte[] MusicURL; // Variable 1
        public byte[] Name; // Variable 1
        public UUID OwnerID; // LLUUID
        public UUID ParcelID; // LLUUID
        public long RegionHandle; // U64
        public float RegionX; // F32
        public float RegionY; // F32
        public int SalePrice; // S32
        public boolean ShowDir; // BOOL
        public UUID SnapshotID; // LLUUID
        public int Status; // U8
        public LLVector3 UserLocation; // LLVector3
    }

    public UpdateParcel() {
        this.zeroCoded = true;
        this.ParcelData_Field = new ParcelData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.ParcelData_Field.Name.length + 43 + 1 + this.ParcelData_Field.Description.length + 1 + this.ParcelData_Field.MusicURL.length + 4 + 4 + 4 + 4 + 1 + 1 + 1 + 16 + 12 + 4 + 16 + 1 + 1 + 4;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleUpdateParcel(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 221 (UpdateParcel).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xDD);
        packUUID(byteBuffer, this.ParcelData_Field.ParcelID);
        packLong(byteBuffer, this.ParcelData_Field.RegionHandle);
        packUUID(byteBuffer, this.ParcelData_Field.OwnerID);
        packBoolean(byteBuffer, this.ParcelData_Field.GroupOwned);
        packByte(byteBuffer, (byte) this.ParcelData_Field.Status);
        packVariable(byteBuffer, this.ParcelData_Field.Name, 1);
        packVariable(byteBuffer, this.ParcelData_Field.Description, 1);
        packVariable(byteBuffer, this.ParcelData_Field.MusicURL, 1);
        packFloat(byteBuffer, this.ParcelData_Field.RegionX);
        packFloat(byteBuffer, this.ParcelData_Field.RegionY);
        packInt(byteBuffer, this.ParcelData_Field.ActualArea);
        packInt(byteBuffer, this.ParcelData_Field.BillableArea);
        packBoolean(byteBuffer, this.ParcelData_Field.ShowDir);
        packBoolean(byteBuffer, this.ParcelData_Field.IsForSale);
        packByte(byteBuffer, (byte) this.ParcelData_Field.Category);
        packUUID(byteBuffer, this.ParcelData_Field.SnapshotID);
        packLLVector3(byteBuffer, this.ParcelData_Field.UserLocation);
        packInt(byteBuffer, this.ParcelData_Field.SalePrice);
        packUUID(byteBuffer, this.ParcelData_Field.AuthorizedBuyerID);
        packBoolean(byteBuffer, this.ParcelData_Field.AllowPublish);
        packBoolean(byteBuffer, this.ParcelData_Field.MaturePublish);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.ParcelData_Field.ParcelID = unpackUUID(byteBuffer);
        this.ParcelData_Field.RegionHandle = unpackLong(byteBuffer);
        this.ParcelData_Field.OwnerID = unpackUUID(byteBuffer);
        this.ParcelData_Field.GroupOwned = unpackBoolean(byteBuffer);
        this.ParcelData_Field.Status = unpackByte(byteBuffer) & 0xFF;
        this.ParcelData_Field.Name = unpackVariable(byteBuffer, 1);
        this.ParcelData_Field.Description = unpackVariable(byteBuffer, 1);
        this.ParcelData_Field.MusicURL = unpackVariable(byteBuffer, 1);
        this.ParcelData_Field.RegionX = unpackFloat(byteBuffer);
        this.ParcelData_Field.RegionY = unpackFloat(byteBuffer);
        this.ParcelData_Field.ActualArea = unpackInt(byteBuffer);
        this.ParcelData_Field.BillableArea = unpackInt(byteBuffer);
        this.ParcelData_Field.ShowDir = unpackBoolean(byteBuffer);
        this.ParcelData_Field.IsForSale = unpackBoolean(byteBuffer);
        this.ParcelData_Field.Category = unpackByte(byteBuffer) & 0xFF;
        this.ParcelData_Field.SnapshotID = unpackUUID(byteBuffer);
        this.ParcelData_Field.UserLocation = unpackLLVector3(byteBuffer);
        this.ParcelData_Field.SalePrice = unpackInt(byteBuffer);
        this.ParcelData_Field.AuthorizedBuyerID = unpackUUID(byteBuffer);
        this.ParcelData_Field.AllowPublish = unpackBoolean(byteBuffer);
        this.ParcelData_Field.MaturePublish = unpackBoolean(byteBuffer);
    }
}
