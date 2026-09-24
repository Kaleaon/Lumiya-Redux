package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * CreateGroupReply
 * dataserver -> simulator
 * simulator -> viewer
 * reliable
 *
 * <p>Template: {@code CreateGroupReply Low 340 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLGroupMgr::processCreateGroupReply()} in indra/newview/llgroupmgr.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class CreateGroupReply extends SLMessage {
    public AgentData AgentData_Field;
    public ReplyData ReplyData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
    }

    /** Block ReplyData, Single. */
    public static class ReplyData {
        public UUID GroupID; // LLUUID
        public byte[] Message; // Variable 1 - string
        public boolean Success; // BOOL
    }

    public CreateGroupReply() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.ReplyData_Field = new ReplyData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.ReplyData_Field.Message.length + 18 + 20;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleCreateGroupReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 340 (CreateGroupReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x54);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.ReplyData_Field.GroupID);
        packBoolean(byteBuffer, this.ReplyData_Field.Success);
        packVariable(byteBuffer, this.ReplyData_Field.Message, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.ReplyData_Field.GroupID = unpackUUID(byteBuffer);
        this.ReplyData_Field.Success = unpackBoolean(byteBuffer);
        this.ReplyData_Field.Message = unpackVariable(byteBuffer, 1);
    }
}
