package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.net.Inet4Address;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * record lost money transactions.  This message could be generated
 * from either the simulator or the dataserver, depending on how
 * the transaction failed.
 *
 * <p>Template: {@code LogFailedMoneyTransaction Low 20 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class LogFailedMoneyTransaction extends SLMessage {
    public TransactionData TransactionData_Field;

    /** Block TransactionData, Single. */
    public static class TransactionData {
        public int Amount; // S32
        public UUID DestID; // LLUUID - destination of the transfer
        public int FailureType; // U8
        public int Flags; // U8
        public int GridX; // U32
        public int GridY; // U32
        public Inet4Address SimulatorIP; // IPADDR - U32 encoded IP
        public UUID SourceID; // LLUUID
        public UUID TransactionID; // LLUUID
        public int TransactionTime; // U32 - utc seconds since epoch
        public int TransactionType; // S32 - see lltransactiontypes.h
    }

    public LogFailedMoneyTransaction() {
        this.zeroCoded = false;
        this.TransactionData_Field = new TransactionData();
    }

    @Override
    public int CalcPayloadSize() {
        return 78;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleLogFailedMoneyTransaction(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 20 (LogFailedMoneyTransaction).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x14);
        packUUID(byteBuffer, this.TransactionData_Field.TransactionID);
        packInt(byteBuffer, this.TransactionData_Field.TransactionTime);
        packInt(byteBuffer, this.TransactionData_Field.TransactionType);
        packUUID(byteBuffer, this.TransactionData_Field.SourceID);
        packUUID(byteBuffer, this.TransactionData_Field.DestID);
        packByte(byteBuffer, (byte) this.TransactionData_Field.Flags);
        packInt(byteBuffer, this.TransactionData_Field.Amount);
        packIPAddress(byteBuffer, this.TransactionData_Field.SimulatorIP);
        packInt(byteBuffer, this.TransactionData_Field.GridX);
        packInt(byteBuffer, this.TransactionData_Field.GridY);
        packByte(byteBuffer, (byte) this.TransactionData_Field.FailureType);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.TransactionData_Field.TransactionID = unpackUUID(byteBuffer);
        this.TransactionData_Field.TransactionTime = unpackInt(byteBuffer);
        this.TransactionData_Field.TransactionType = unpackInt(byteBuffer);
        this.TransactionData_Field.SourceID = unpackUUID(byteBuffer);
        this.TransactionData_Field.DestID = unpackUUID(byteBuffer);
        this.TransactionData_Field.Flags = unpackByte(byteBuffer) & 0xFF;
        this.TransactionData_Field.Amount = unpackInt(byteBuffer);
        this.TransactionData_Field.SimulatorIP = unpackIPAddress(byteBuffer);
        this.TransactionData_Field.GridX = unpackInt(byteBuffer);
        this.TransactionData_Field.GridY = unpackInt(byteBuffer);
        this.TransactionData_Field.FailureType = unpackByte(byteBuffer) & 0xFF;
    }
}
