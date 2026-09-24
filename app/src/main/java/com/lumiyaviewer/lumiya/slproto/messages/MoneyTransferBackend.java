package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * And, the money transfer
 * *NOTE: Unused as of 2010-04-06, because all back-end money transactions
 * are done with web services via L$ API.  JC
 *
 * <p>Template: {@code MoneyTransferBackend Low 312 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class MoneyTransferBackend extends SLMessage {
    public MoneyData MoneyData_Field;

    /** Block MoneyData, Single. */
    public static class MoneyData {
        public int AggregatePermInventory; // U8
        public int AggregatePermNextOwner; // U8
        public int Amount; // S32
        public byte[] Description; // Variable 1 - string, name of item for purchases
        public UUID DestID; // LLUUID - destination of the transfer
        public int Flags; // U8
        public int GridX; // U32 - *HACK: database doesn't have region_id in schema
        public int GridY; // U32 - *HACK: database doesn't have region_id in schema
        public UUID RegionID; // LLUUID - region sending the request, for logging
        public UUID SourceID; // LLUUID
        public UUID TransactionID; // LLUUID
        public int TransactionTime; // U32 - utc seconds since epoch
        public int TransactionType; // S32 - see lltransactiontypes.h
    }

    public MoneyTransferBackend() {
        this.zeroCoded = true;
        this.MoneyData_Field = new MoneyData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.MoneyData_Field.Description.length + 88 + 4;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleMoneyTransferBackend(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 312 (MoneyTransferBackend).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x38);
        packUUID(byteBuffer, this.MoneyData_Field.TransactionID);
        packInt(byteBuffer, this.MoneyData_Field.TransactionTime);
        packUUID(byteBuffer, this.MoneyData_Field.SourceID);
        packUUID(byteBuffer, this.MoneyData_Field.DestID);
        packByte(byteBuffer, (byte) this.MoneyData_Field.Flags);
        packInt(byteBuffer, this.MoneyData_Field.Amount);
        packByte(byteBuffer, (byte) this.MoneyData_Field.AggregatePermNextOwner);
        packByte(byteBuffer, (byte) this.MoneyData_Field.AggregatePermInventory);
        packInt(byteBuffer, this.MoneyData_Field.TransactionType);
        packUUID(byteBuffer, this.MoneyData_Field.RegionID);
        packInt(byteBuffer, this.MoneyData_Field.GridX);
        packInt(byteBuffer, this.MoneyData_Field.GridY);
        packVariable(byteBuffer, this.MoneyData_Field.Description, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.MoneyData_Field.TransactionID = unpackUUID(byteBuffer);
        this.MoneyData_Field.TransactionTime = unpackInt(byteBuffer);
        this.MoneyData_Field.SourceID = unpackUUID(byteBuffer);
        this.MoneyData_Field.DestID = unpackUUID(byteBuffer);
        this.MoneyData_Field.Flags = unpackByte(byteBuffer) & 0xFF;
        this.MoneyData_Field.Amount = unpackInt(byteBuffer);
        this.MoneyData_Field.AggregatePermNextOwner = unpackByte(byteBuffer) & 0xFF;
        this.MoneyData_Field.AggregatePermInventory = unpackByte(byteBuffer) & 0xFF;
        this.MoneyData_Field.TransactionType = unpackInt(byteBuffer);
        this.MoneyData_Field.RegionID = unpackUUID(byteBuffer);
        this.MoneyData_Field.GridX = unpackInt(byteBuffer);
        this.MoneyData_Field.GridY = unpackInt(byteBuffer);
        this.MoneyData_Field.Description = unpackVariable(byteBuffer, 1);
    }
}
