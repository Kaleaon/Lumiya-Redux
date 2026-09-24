package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * InviteGroupResponse
 * simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code InviteGroupResponse Low 350 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class InviteGroupResponse extends SLMessage {
    public InviteData InviteData_Field;

    /** Block InviteData, Single. */
    public static class InviteData {
        public UUID AgentID; // LLUUID
        public UUID GroupID; // LLUUID
        public UUID InviteeID; // LLUUID
        public int MembershipFee; // S32
        public UUID RoleID; // LLUUID
    }

    public InviteGroupResponse() {
        this.zeroCoded = false;
        this.InviteData_Field = new InviteData();
    }

    @Override
    public int CalcPayloadSize() {
        return 72;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleInviteGroupResponse(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 350 (InviteGroupResponse).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x5E);
        packUUID(byteBuffer, this.InviteData_Field.AgentID);
        packUUID(byteBuffer, this.InviteData_Field.InviteeID);
        packUUID(byteBuffer, this.InviteData_Field.GroupID);
        packUUID(byteBuffer, this.InviteData_Field.RoleID);
        packInt(byteBuffer, this.InviteData_Field.MembershipFee);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.InviteData_Field.AgentID = unpackUUID(byteBuffer);
        this.InviteData_Field.InviteeID = unpackUUID(byteBuffer);
        this.InviteData_Field.GroupID = unpackUUID(byteBuffer);
        this.InviteData_Field.RoleID = unpackUUID(byteBuffer);
        this.InviteData_Field.MembershipFee = unpackInt(byteBuffer);
    }
}
