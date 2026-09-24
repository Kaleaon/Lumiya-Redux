package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * PickDelete
 * Delete a non-top pick from the database.
 * viewer -> simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code PickDelete Low 186 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class PickDelete extends SLMessage {
    public AgentData AgentData_Field;
    public Data Data_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block Data, Single. */
    public static class Data {
        public UUID PickID; // LLUUID
    }

    public PickDelete() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.Data_Field = new Data();
    }

    @Override
    public int CalcPayloadSize() {
        return 52;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandlePickDelete(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 186 (PickDelete).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xBA);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.Data_Field.PickID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.Data_Field.PickID = unpackUUID(byteBuffer);
    }
}
