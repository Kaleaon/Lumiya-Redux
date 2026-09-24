package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * UpdateUserInfo
 *
 * <p>Template: {@code UpdateUserInfo Low 401 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class UpdateUserInfo extends SLMessage {
    public AgentData AgentData_Field;
    public UserData UserData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block UserData, Single. */
    public static class UserData {
        public byte[] DirectoryVisibility; // Variable 1
        public boolean IMViaEMail; // BOOL
    }

    public UpdateUserInfo() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.UserData_Field = new UserData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.UserData_Field.DirectoryVisibility.length + 2 + 36;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleUpdateUserInfo(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 401 (UpdateUserInfo).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x91);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packBoolean(byteBuffer, this.UserData_Field.IMViaEMail);
        packVariable(byteBuffer, this.UserData_Field.DirectoryVisibility, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.UserData_Field.IMViaEMail = unpackBoolean(byteBuffer);
        this.UserData_Field.DirectoryVisibility = unpackVariable(byteBuffer, 1);
    }
}
