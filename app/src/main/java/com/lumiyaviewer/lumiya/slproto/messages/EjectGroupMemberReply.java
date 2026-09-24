package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * EjectGroupMemberReply
 * dataserver -> simulator -> viewer
 * reliable
 *
 * <p>Template: {@code EjectGroupMemberReply Low 346 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLGroupMgr::processEjectGroupMemberReply()} in indra/newview/llgroupmgr.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class EjectGroupMemberReply extends SLMessage {
    public AgentData AgentData_Field;
    public EjectData EjectData_Field;
    public GroupData GroupData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
    }

    /** Block EjectData, Single. */
    public static class EjectData {
        public boolean Success; // BOOL
    }

    /** Block GroupData, Single. */
    public static class GroupData {
        public UUID GroupID; // LLUUID
    }

    public EjectGroupMemberReply() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.GroupData_Field = new GroupData();
        this.EjectData_Field = new EjectData();
    }

    @Override
    public int CalcPayloadSize() {
        return 37;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleEjectGroupMemberReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 346 (EjectGroupMemberReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x5A);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.GroupData_Field.GroupID);
        packBoolean(byteBuffer, this.EjectData_Field.Success);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.GroupData_Field.GroupID = unpackUUID(byteBuffer);
        this.EjectData_Field.Success = unpackBoolean(byteBuffer);
    }
}
