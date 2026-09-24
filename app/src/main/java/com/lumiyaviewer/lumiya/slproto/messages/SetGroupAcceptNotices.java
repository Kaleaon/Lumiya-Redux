package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * viewer -> simulator -> dataserver
 *
 * <p>Template: {@code SetGroupAcceptNotices Low 370 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class SetGroupAcceptNotices extends SLMessage {
    public AgentData AgentData_Field;
    public Data Data_Field;
    public NewData NewData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block Data, Single. */
    public static class Data {
        public boolean AcceptNotices; // BOOL
        public UUID GroupID; // LLUUID
    }

    /** Block NewData, Single. */
    public static class NewData {
        public boolean ListInProfile; // BOOL
    }

    public SetGroupAcceptNotices() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.Data_Field = new Data();
        this.NewData_Field = new NewData();
    }

    @Override
    public int CalcPayloadSize() {
        return 54;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleSetGroupAcceptNotices(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 370 (SetGroupAcceptNotices).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x72);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.Data_Field.GroupID);
        packBoolean(byteBuffer, this.Data_Field.AcceptNotices);
        packBoolean(byteBuffer, this.NewData_Field.ListInProfile);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.Data_Field.GroupID = unpackUUID(byteBuffer);
        this.Data_Field.AcceptNotices = unpackBoolean(byteBuffer);
        this.NewData_Field.ListInProfile = unpackBoolean(byteBuffer);
    }
}
