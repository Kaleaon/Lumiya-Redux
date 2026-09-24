package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * GodKickUser
 * When a god wants someone kicked
 * viewer -> sim
 * reliable
 *
 * <p>Template: {@code GodKickUser Low 165 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class GodKickUser extends SLMessage {
    public UserInfo UserInfo_Field;

    /** Block UserInfo, Single. */
    public static class UserInfo {
        public UUID AgentID; // LLUUID
        public UUID GodID; // LLUUID
        public UUID GodSessionID; // LLUUID
        public int KickFlags; // U32
        public byte[] Reason; // Variable 2 - string
    }

    public GodKickUser() {
        this.zeroCoded = false;
        this.UserInfo_Field = new UserInfo();
    }

    @Override
    public int CalcPayloadSize() {
        return this.UserInfo_Field.Reason.length + 54 + 4;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleGodKickUser(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 165 (GodKickUser).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xA5);
        packUUID(byteBuffer, this.UserInfo_Field.GodID);
        packUUID(byteBuffer, this.UserInfo_Field.GodSessionID);
        packUUID(byteBuffer, this.UserInfo_Field.AgentID);
        packInt(byteBuffer, this.UserInfo_Field.KickFlags);
        packVariable(byteBuffer, this.UserInfo_Field.Reason, 2);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.UserInfo_Field.GodID = unpackUUID(byteBuffer);
        this.UserInfo_Field.GodSessionID = unpackUUID(byteBuffer);
        this.UserInfo_Field.AgentID = unpackUUID(byteBuffer);
        this.UserInfo_Field.KickFlags = unpackInt(byteBuffer);
        this.UserInfo_Field.Reason = unpackVariable(byteBuffer, 2);
    }
}
