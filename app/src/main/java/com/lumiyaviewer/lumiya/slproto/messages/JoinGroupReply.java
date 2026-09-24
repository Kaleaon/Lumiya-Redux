package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * JoinGroupReply
 * dataserver -> simulator -> viewer
 *
 * <p>Template: {@code JoinGroupReply Low 344 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLGroupMgr::processJoinGroupReply()} in indra/newview/llgroupmgr.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class JoinGroupReply extends SLMessage {
    public AgentData AgentData_Field;
    public GroupData GroupData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
    }

    /** Block GroupData, Single. */
    public static class GroupData {
        public UUID GroupID; // LLUUID
        public boolean Success; // BOOL
    }

    public JoinGroupReply() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.GroupData_Field = new GroupData();
    }

    @Override
    public int CalcPayloadSize() {
        return 37;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleJoinGroupReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 344 (JoinGroupReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x58);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.GroupData_Field.GroupID);
        packBoolean(byteBuffer, this.GroupData_Field.Success);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.GroupData_Field.GroupID = unpackUUID(byteBuffer);
        this.GroupData_Field.Success = unpackBoolean(byteBuffer);
    }
}
