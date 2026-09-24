package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * UserInfoReply
 *
 * <p>Template: {@code UserInfoReply Low 400 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_user_info_reply()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class UserInfoReply extends SLMessage {
    public AgentData AgentData_Field;
    public UserData UserData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
    }

    /** Block UserData, Single. */
    public static class UserData {
        public byte[] DirectoryVisibility; // Variable 1
        public byte[] EMail; // Variable 2
        public boolean IMViaEMail; // BOOL
    }

    public UserInfoReply() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.UserData_Field = new UserData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.UserData_Field.DirectoryVisibility.length + 2 + 2 + this.UserData_Field.EMail.length + 20;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleUserInfoReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 400 (UserInfoReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x90);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packBoolean(byteBuffer, this.UserData_Field.IMViaEMail);
        packVariable(byteBuffer, this.UserData_Field.DirectoryVisibility, 1);
        packVariable(byteBuffer, this.UserData_Field.EMail, 2);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.UserData_Field.IMViaEMail = unpackBoolean(byteBuffer);
        this.UserData_Field.DirectoryVisibility = unpackVariable(byteBuffer, 1);
        this.UserData_Field.EMail = unpackVariable(byteBuffer, 2);
    }
}
