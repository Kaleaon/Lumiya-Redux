package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * GroupNoticeAdd
 * Add a group notice.
 * simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code GroupNoticeAdd Low 61 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class GroupNoticeAdd extends SLMessage {
    public AgentData AgentData_Field;
    public MessageBlock MessageBlock_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
    }

    /** Block MessageBlock, Single. */
    public static class MessageBlock {
        public byte[] BinaryBucket; // Variable 2
        public int Dialog; // U8
        public byte[] FromAgentName; // Variable 1
        public UUID ID; // LLUUID
        public byte[] Message; // Variable 2
        public UUID ToGroupID; // LLUUID
    }

    public GroupNoticeAdd() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.MessageBlock_Field = new MessageBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return this.MessageBlock_Field.FromAgentName.length + 34 + 2 + this.MessageBlock_Field.Message.length + 2 + this.MessageBlock_Field.BinaryBucket.length + 20;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleGroupNoticeAdd(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 61 (GroupNoticeAdd).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x3D);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.MessageBlock_Field.ToGroupID);
        packUUID(byteBuffer, this.MessageBlock_Field.ID);
        packByte(byteBuffer, (byte) this.MessageBlock_Field.Dialog);
        packVariable(byteBuffer, this.MessageBlock_Field.FromAgentName, 1);
        packVariable(byteBuffer, this.MessageBlock_Field.Message, 2);
        packVariable(byteBuffer, this.MessageBlock_Field.BinaryBucket, 2);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.MessageBlock_Field.ToGroupID = unpackUUID(byteBuffer);
        this.MessageBlock_Field.ID = unpackUUID(byteBuffer);
        this.MessageBlock_Field.Dialog = unpackByte(byteBuffer) & 0xFF;
        this.MessageBlock_Field.FromAgentName = unpackVariable(byteBuffer, 1);
        this.MessageBlock_Field.Message = unpackVariable(byteBuffer, 2);
        this.MessageBlock_Field.BinaryBucket = unpackVariable(byteBuffer, 2);
    }
}
