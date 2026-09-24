package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.net.Inet4Address;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * KickUser
 * *FIXME*
 * Kick off a logged-in user, such as when two people log in with the
 * same account name.
 * ROUTED dataserver -> userserver -> spaceserver -> simulator -> viewer
 * reliable, but that may not matter if a system component is quitting
 *
 * <p>Template: {@code KickUser Low 163 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_kick_user()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class KickUser extends SLMessage {
    public TargetBlock TargetBlock_Field;
    public UserInfo UserInfo_Field;

    /** Block TargetBlock, Single. */
    public static class TargetBlock {
        public Inet4Address TargetIP; // IPADDR - U32 encoded IP
        public int TargetPort; // IPPORT
    }

    /** Block UserInfo, Single. */
    public static class UserInfo {
        public UUID AgentID; // LLUUID
        public byte[] Reason; // Variable 2 - string
        public UUID SessionID; // LLUUID
    }

    public KickUser() {
        this.zeroCoded = false;
        this.TargetBlock_Field = new TargetBlock();
        this.UserInfo_Field = new UserInfo();
    }

    @Override
    public int CalcPayloadSize() {
        return this.UserInfo_Field.Reason.length + 34 + 10;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleKickUser(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 163 (KickUser).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xA3);
        packIPAddress(byteBuffer, this.TargetBlock_Field.TargetIP);
        packShort(byteBuffer, (short) this.TargetBlock_Field.TargetPort);
        packUUID(byteBuffer, this.UserInfo_Field.AgentID);
        packUUID(byteBuffer, this.UserInfo_Field.SessionID);
        packVariable(byteBuffer, this.UserInfo_Field.Reason, 2);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.TargetBlock_Field.TargetIP = unpackIPAddress(byteBuffer);
        this.TargetBlock_Field.TargetPort = unpackShort(byteBuffer) & 65535;
        this.UserInfo_Field.AgentID = unpackUUID(byteBuffer);
        this.UserInfo_Field.SessionID = unpackUUID(byteBuffer);
        this.UserInfo_Field.Reason = unpackVariable(byteBuffer, 2);
    }
}
