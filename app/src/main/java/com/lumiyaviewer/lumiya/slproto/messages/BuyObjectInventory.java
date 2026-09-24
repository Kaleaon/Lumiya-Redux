package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * viewer -> simulator
 * buy object inventory. If the transaction succeeds, it will add
 * inventory to the agent, and potentially remove the original.
 *
 * <p>Template: {@code BuyObjectInventory Low 103 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class BuyObjectInventory extends SLMessage {
    public AgentData AgentData_Field;
    public Data Data_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block Data, Single. */
    public static class Data {
        public UUID FolderID; // LLUUID
        public UUID ItemID; // LLUUID
        public UUID ObjectID; // LLUUID
    }

    public BuyObjectInventory() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.Data_Field = new Data();
    }

    @Override
    public int CalcPayloadSize() {
        return 84;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleBuyObjectInventory(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 103 (BuyObjectInventory).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x67);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.Data_Field.ObjectID);
        packUUID(byteBuffer, this.Data_Field.ItemID);
        packUUID(byteBuffer, this.Data_Field.FolderID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.Data_Field.ObjectID = unpackUUID(byteBuffer);
        this.Data_Field.ItemID = unpackUUID(byteBuffer);
        this.Data_Field.FolderID = unpackUUID(byteBuffer);
    }
}
