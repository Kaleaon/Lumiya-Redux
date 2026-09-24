package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Move money from one agent to another. Validation will happen at the
 * simulator, the dataserver will actually do the work. Dataserver
 * generates a MoneyBalance message in reply.  The simulator
 * will generate a MoneyTransferBackend in response to this.
 * viewer -> simulator -> dataserver
 *
 * <p>Template: {@code MoneyTransferRequest Low 311 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class MoneyTransferRequest extends SLMessage {
    public AgentData AgentData_Field;
    public MoneyData MoneyData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block MoneyData, Single. */
    public static class MoneyData {
        public int AggregatePermInventory; // U8
        public int AggregatePermNextOwner; // U8
        public int Amount; // S32
        public byte[] Description; // Variable 1 - string, name of item for purchases
        public UUID DestID; // LLUUID - destination of the transfer
        public int Flags; // U8
        public UUID SourceID; // LLUUID
        public int TransactionType; // S32 - see lltransactiontypes.h
    }

    public MoneyTransferRequest() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.MoneyData_Field = new MoneyData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.MoneyData_Field.Description.length + 44 + 36;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleMoneyTransferRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 311 (MoneyTransferRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x37);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.MoneyData_Field.SourceID);
        packUUID(byteBuffer, this.MoneyData_Field.DestID);
        packByte(byteBuffer, (byte) this.MoneyData_Field.Flags);
        packInt(byteBuffer, this.MoneyData_Field.Amount);
        packByte(byteBuffer, (byte) this.MoneyData_Field.AggregatePermNextOwner);
        packByte(byteBuffer, (byte) this.MoneyData_Field.AggregatePermInventory);
        packInt(byteBuffer, this.MoneyData_Field.TransactionType);
        packVariable(byteBuffer, this.MoneyData_Field.Description, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.MoneyData_Field.SourceID = unpackUUID(byteBuffer);
        this.MoneyData_Field.DestID = unpackUUID(byteBuffer);
        this.MoneyData_Field.Flags = unpackByte(byteBuffer) & 0xFF;
        this.MoneyData_Field.Amount = unpackInt(byteBuffer);
        this.MoneyData_Field.AggregatePermNextOwner = unpackByte(byteBuffer) & 0xFF;
        this.MoneyData_Field.AggregatePermInventory = unpackByte(byteBuffer) & 0xFF;
        this.MoneyData_Field.TransactionType = unpackInt(byteBuffer);
        this.MoneyData_Field.Description = unpackVariable(byteBuffer, 1);
    }
}
