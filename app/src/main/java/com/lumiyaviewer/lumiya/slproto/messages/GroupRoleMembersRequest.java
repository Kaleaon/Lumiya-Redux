package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * GroupRoleMembersRequest
 * viewer -> simulator -> dataserver
 *
 * <p>Template: {@code GroupRoleMembersRequest Low 373 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class GroupRoleMembersRequest extends SLMessage {
    public AgentData AgentData_Field;
    public GroupData GroupData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block GroupData, Single. */
    public static class GroupData {
        public UUID GroupID; // LLUUID
        public UUID RequestID; // LLUUID
    }

    public GroupRoleMembersRequest() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.GroupData_Field = new GroupData();
    }

    @Override
    public int CalcPayloadSize() {
        return 68;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleGroupRoleMembersRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 373 (GroupRoleMembersRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x75);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.GroupData_Field.GroupID);
        packUUID(byteBuffer, this.GroupData_Field.RequestID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.GroupData_Field.GroupID = unpackUUID(byteBuffer);
        this.GroupData_Field.RequestID = unpackUUID(byteBuffer);
    }
}
