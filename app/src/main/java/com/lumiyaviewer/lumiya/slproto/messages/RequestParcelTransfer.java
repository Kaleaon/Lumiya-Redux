package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * sim -> dataserver
 * This message is used to check if a user can buy a parcel. If
 * successful, the transaction is approved through a money balance reply
 * with the same transaction id.
 *
 * <p>Template: {@code RequestParcelTransfer Low 220 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class RequestParcelTransfer extends SLMessage {
    public Data Data_Field;
    public RegionData RegionData_Field;

    /** Block Data, Single. */
    public static class Data {
        public int ActualArea; // S32
        public int Amount; // S32
        public int BillableArea; // S32
        public UUID DestID; // LLUUID
        public boolean Final; // BOOL - true if buyer should be in tier
        public int Flags; // U8 - see lltransactiontypes.h
        public UUID OwnerID; // LLUUID
        public UUID SourceID; // LLUUID
        public UUID TransactionID; // LLUUID
        public int TransactionTime; // U32 - utc seconds since epoch
        public int TransactionType; // S32 - see lltransactiontypes.h
    }

    /** Block RegionData, Single. */
    public static class RegionData {
        public int GridX; // U32
        public int GridY; // U32
        public UUID RegionID; // LLUUID
    }

    public RequestParcelTransfer() {
        this.zeroCoded = true;
        this.Data_Field = new Data();
        this.RegionData_Field = new RegionData();
    }

    @Override
    public int CalcPayloadSize() {
        return 114;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleRequestParcelTransfer(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 220 (RequestParcelTransfer).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xDC);
        packUUID(byteBuffer, this.Data_Field.TransactionID);
        packInt(byteBuffer, this.Data_Field.TransactionTime);
        packUUID(byteBuffer, this.Data_Field.SourceID);
        packUUID(byteBuffer, this.Data_Field.DestID);
        packUUID(byteBuffer, this.Data_Field.OwnerID);
        packByte(byteBuffer, (byte) this.Data_Field.Flags);
        packInt(byteBuffer, this.Data_Field.TransactionType);
        packInt(byteBuffer, this.Data_Field.Amount);
        packInt(byteBuffer, this.Data_Field.BillableArea);
        packInt(byteBuffer, this.Data_Field.ActualArea);
        packBoolean(byteBuffer, this.Data_Field.Final);
        packUUID(byteBuffer, this.RegionData_Field.RegionID);
        packInt(byteBuffer, this.RegionData_Field.GridX);
        packInt(byteBuffer, this.RegionData_Field.GridY);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.Data_Field.TransactionID = unpackUUID(byteBuffer);
        this.Data_Field.TransactionTime = unpackInt(byteBuffer);
        this.Data_Field.SourceID = unpackUUID(byteBuffer);
        this.Data_Field.DestID = unpackUUID(byteBuffer);
        this.Data_Field.OwnerID = unpackUUID(byteBuffer);
        this.Data_Field.Flags = unpackByte(byteBuffer) & 0xFF;
        this.Data_Field.TransactionType = unpackInt(byteBuffer);
        this.Data_Field.Amount = unpackInt(byteBuffer);
        this.Data_Field.BillableArea = unpackInt(byteBuffer);
        this.Data_Field.ActualArea = unpackInt(byteBuffer);
        this.Data_Field.Final = unpackBoolean(byteBuffer);
        this.RegionData_Field.RegionID = unpackUUID(byteBuffer);
        this.RegionData_Field.GridX = unpackInt(byteBuffer);
        this.RegionData_Field.GridY = unpackInt(byteBuffer);
    }
}
