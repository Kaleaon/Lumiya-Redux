package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * EjectGroupMemberRequest
 * viewer -> simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code EjectGroupMemberRequest Low 345 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class EjectGroupMemberRequest extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<EjectData> EjectData_Fields = new ArrayList<>();
    public GroupData GroupData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block EjectData, Variable. */
    public static class EjectData {
        public UUID EjecteeID; // LLUUID
    }

    /** Block GroupData, Single. */
    public static class GroupData {
        public UUID GroupID; // LLUUID
    }

    public EjectGroupMemberRequest() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.GroupData_Field = new GroupData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.EjectData_Fields.size() * 16) + 53;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleEjectGroupMemberRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 345 (EjectGroupMemberRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x59);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.GroupData_Field.GroupID);
        byteBuffer.put((byte) this.EjectData_Fields.size());
        Iterator<?> it = this.EjectData_Fields.iterator();
        while (it.hasNext()) {
            packUUID(byteBuffer, ((EjectData) it.next()).EjecteeID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.GroupData_Field.GroupID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            EjectData ejectData = new EjectData();
            ejectData.EjecteeID = unpackUUID(byteBuffer);
            this.EjectData_Fields.add(ejectData);
        }
    }
}
