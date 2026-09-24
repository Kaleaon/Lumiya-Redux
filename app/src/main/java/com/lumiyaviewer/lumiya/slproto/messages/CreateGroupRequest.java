package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Group messages
 * CreateGroupRequest
 * viewer -> simulator
 * reliable
 *
 * <p>Template: {@code CreateGroupRequest Low 339 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class CreateGroupRequest extends SLMessage {
    public AgentData AgentData_Field;
    public GroupData GroupData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block GroupData, Single. */
    public static class GroupData {
        public boolean AllowPublish; // BOOL - whether profile is externally visible or not
        public byte[] Charter; // Variable 2 - string
        public UUID InsigniaID; // LLUUID
        public boolean MaturePublish; // BOOL - profile is "mature"
        public int MembershipFee; // S32
        public byte[] Name; // Variable 1 - string
        public boolean OpenEnrollment; // BOOL
        public boolean ShowInList; // BOOL
    }

    public CreateGroupRequest() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.GroupData_Field = new GroupData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.GroupData_Field.Name.length + 1 + 2 + this.GroupData_Field.Charter.length + 1 + 16 + 4 + 1 + 1 + 1 + 36;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleCreateGroupRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 339 (CreateGroupRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x53);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packVariable(byteBuffer, this.GroupData_Field.Name, 1);
        packVariable(byteBuffer, this.GroupData_Field.Charter, 2);
        packBoolean(byteBuffer, this.GroupData_Field.ShowInList);
        packUUID(byteBuffer, this.GroupData_Field.InsigniaID);
        packInt(byteBuffer, this.GroupData_Field.MembershipFee);
        packBoolean(byteBuffer, this.GroupData_Field.OpenEnrollment);
        packBoolean(byteBuffer, this.GroupData_Field.AllowPublish);
        packBoolean(byteBuffer, this.GroupData_Field.MaturePublish);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.GroupData_Field.Name = unpackVariable(byteBuffer, 1);
        this.GroupData_Field.Charter = unpackVariable(byteBuffer, 2);
        this.GroupData_Field.ShowInList = unpackBoolean(byteBuffer);
        this.GroupData_Field.InsigniaID = unpackUUID(byteBuffer);
        this.GroupData_Field.MembershipFee = unpackInt(byteBuffer);
        this.GroupData_Field.OpenEnrollment = unpackBoolean(byteBuffer);
        this.GroupData_Field.AllowPublish = unpackBoolean(byteBuffer);
        this.GroupData_Field.MaturePublish = unpackBoolean(byteBuffer);
    }
}
