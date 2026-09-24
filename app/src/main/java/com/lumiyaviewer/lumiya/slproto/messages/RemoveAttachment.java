package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Simulator informs Dataserver that attachment has been taken off
 *
 * <p>Template: {@code RemoveAttachment Low 332 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class RemoveAttachment extends SLMessage {
    public AgentData AgentData_Field;
    public AttachmentBlock AttachmentBlock_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block AttachmentBlock, Single. */
    public static class AttachmentBlock {
        public int AttachmentPoint; // U8
        public UUID ItemID; // LLUUID
    }

    public RemoveAttachment() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.AttachmentBlock_Field = new AttachmentBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return 53;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleRemoveAttachment(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 332 (RemoveAttachment).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x4C);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packByte(byteBuffer, (byte) this.AttachmentBlock_Field.AttachmentPoint);
        packUUID(byteBuffer, this.AttachmentBlock_Field.ItemID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AttachmentBlock_Field.AttachmentPoint = unpackByte(byteBuffer) & 0xFF;
        this.AttachmentBlock_Field.ItemID = unpackUUID(byteBuffer);
    }
}
