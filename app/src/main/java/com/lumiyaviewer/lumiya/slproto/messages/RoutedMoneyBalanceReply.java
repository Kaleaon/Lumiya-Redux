package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.net.Inet4Address;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * RoutedMoneyBalanceReply
 * This message is used when a dataserver needs to send updated
 * money balance information to a simulator other than the one it
 * is connected to.  It uses the standard TransferBlock format.
 * dataserver -> simulator -> spaceserver -> simulator -> viewer
 * reliable
 *
 * <p>Template: {@code RoutedMoneyBalanceReply Low 315 Trusted Zerocoded UDPDeprecated}
 * (recovered/reference/message_template.msg).
 */
public class RoutedMoneyBalanceReply extends SLMessage {
    public MoneyData MoneyData_Field;
    public TargetBlock TargetBlock_Field;
    public TransactionInfo TransactionInfo_Field;

    /** Block MoneyData, Single. */
    public static class MoneyData {
        public UUID AgentID; // LLUUID
        public byte[] Description; // Variable 1 - string
        public int MoneyBalance; // S32
        public int SquareMetersCommitted; // S32
        public int SquareMetersCredit; // S32
        public UUID TransactionID; // LLUUID
        public boolean TransactionSuccess; // BOOL
    }

    /** Block TargetBlock, Single. */
    public static class TargetBlock {
        public Inet4Address TargetIP; // IPADDR - U32 encoded IP
        public int TargetPort; // IPPORT
    }

    /** Block TransactionInfo, Single. */
    public static class TransactionInfo {
        public int Amount; // S32
        public UUID DestID; // LLUUID
        public boolean IsDestGroup; // BOOL
        public boolean IsSourceGroup; // BOOL
        public byte[] ItemDescription; // Variable 1 - string
        public UUID SourceID; // LLUUID
        public int TransactionType; // S32 - lltransactiontype.h
    }

    public RoutedMoneyBalanceReply() {
        this.zeroCoded = true;
        this.TargetBlock_Field = new TargetBlock();
        this.MoneyData_Field = new MoneyData();
        this.TransactionInfo_Field = new TransactionInfo();
    }

    @Override
    public int CalcPayloadSize() {
        return this.MoneyData_Field.Description.length + 46 + 10 + this.TransactionInfo_Field.ItemDescription.length + 43;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleRoutedMoneyBalanceReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 315 (RoutedMoneyBalanceReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x3B);
        packIPAddress(byteBuffer, this.TargetBlock_Field.TargetIP);
        packShort(byteBuffer, (short) this.TargetBlock_Field.TargetPort);
        packUUID(byteBuffer, this.MoneyData_Field.AgentID);
        packUUID(byteBuffer, this.MoneyData_Field.TransactionID);
        packBoolean(byteBuffer, this.MoneyData_Field.TransactionSuccess);
        packInt(byteBuffer, this.MoneyData_Field.MoneyBalance);
        packInt(byteBuffer, this.MoneyData_Field.SquareMetersCredit);
        packInt(byteBuffer, this.MoneyData_Field.SquareMetersCommitted);
        packVariable(byteBuffer, this.MoneyData_Field.Description, 1);
        packInt(byteBuffer, this.TransactionInfo_Field.TransactionType);
        packUUID(byteBuffer, this.TransactionInfo_Field.SourceID);
        packBoolean(byteBuffer, this.TransactionInfo_Field.IsSourceGroup);
        packUUID(byteBuffer, this.TransactionInfo_Field.DestID);
        packBoolean(byteBuffer, this.TransactionInfo_Field.IsDestGroup);
        packInt(byteBuffer, this.TransactionInfo_Field.Amount);
        packVariable(byteBuffer, this.TransactionInfo_Field.ItemDescription, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.TargetBlock_Field.TargetIP = unpackIPAddress(byteBuffer);
        this.TargetBlock_Field.TargetPort = unpackShort(byteBuffer) & 65535;
        this.MoneyData_Field.AgentID = unpackUUID(byteBuffer);
        this.MoneyData_Field.TransactionID = unpackUUID(byteBuffer);
        this.MoneyData_Field.TransactionSuccess = unpackBoolean(byteBuffer);
        this.MoneyData_Field.MoneyBalance = unpackInt(byteBuffer);
        this.MoneyData_Field.SquareMetersCredit = unpackInt(byteBuffer);
        this.MoneyData_Field.SquareMetersCommitted = unpackInt(byteBuffer);
        this.MoneyData_Field.Description = unpackVariable(byteBuffer, 1);
        this.TransactionInfo_Field.TransactionType = unpackInt(byteBuffer);
        this.TransactionInfo_Field.SourceID = unpackUUID(byteBuffer);
        this.TransactionInfo_Field.IsSourceGroup = unpackBoolean(byteBuffer);
        this.TransactionInfo_Field.DestID = unpackUUID(byteBuffer);
        this.TransactionInfo_Field.IsDestGroup = unpackBoolean(byteBuffer);
        this.TransactionInfo_Field.Amount = unpackInt(byteBuffer);
        this.TransactionInfo_Field.ItemDescription = unpackVariable(byteBuffer, 1);
    }
}
