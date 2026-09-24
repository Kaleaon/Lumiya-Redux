package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * DeclineFriendship
 *
 * <p>Template: {@code DeclineFriendship Low 298 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class DeclineFriendship extends SLMessage {
    public AgentData AgentData_Field;
    public TransactionBlock TransactionBlock_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block TransactionBlock, Single. */
    public static class TransactionBlock {
        public UUID TransactionID; // LLUUID
    }

    public DeclineFriendship() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.TransactionBlock_Field = new TransactionBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return 52;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleDeclineFriendship(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 298 (DeclineFriendship).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x2A);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.TransactionBlock_Field.TransactionID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.TransactionBlock_Field.TransactionID = unpackUUID(byteBuffer);
    }
}
