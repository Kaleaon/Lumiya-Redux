package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * used to switch an agent's currently active group.
 * viewer -> simulator -> dataserver -> AgentDataUpdate...
 *
 * <p>Template: {@code ActivateGroup Low 368 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class ActivateGroup extends SLMessage {
    public AgentData AgentData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID GroupID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    public ActivateGroup() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return 52;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleActivateGroup(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 368 (ActivateGroup).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x70);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.AgentData_Field.GroupID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.GroupID = unpackUUID(byteBuffer);
    }
}
