package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * DirPlacesQuery viewer->sim
 * Used for the Find directory of places
 *
 * <p>Template: {@code DirPlacesQuery Low 33 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class DirPlacesQuery extends SLMessage {
    public AgentData AgentData_Field;
    public QueryData QueryData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block QueryData, Single. */
    public static class QueryData {
        public int Category; // S8
        public int QueryFlags; // U32
        public UUID QueryID; // LLUUID
        public int QueryStart; // S32
        public byte[] QueryText; // Variable 1
        public byte[] SimName; // Variable 1
    }

    public DirPlacesQuery() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.QueryData_Field = new QueryData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.QueryData_Field.QueryText.length + 17 + 4 + 1 + 1 + this.QueryData_Field.SimName.length + 4 + 36;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleDirPlacesQuery(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 33 (DirPlacesQuery).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x21);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.QueryData_Field.QueryID);
        packVariable(byteBuffer, this.QueryData_Field.QueryText, 1);
        packInt(byteBuffer, this.QueryData_Field.QueryFlags);
        packByte(byteBuffer, (byte) this.QueryData_Field.Category);
        packVariable(byteBuffer, this.QueryData_Field.SimName, 1);
        packInt(byteBuffer, this.QueryData_Field.QueryStart);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.QueryData_Field.QueryID = unpackUUID(byteBuffer);
        this.QueryData_Field.QueryText = unpackVariable(byteBuffer, 1);
        this.QueryData_Field.QueryFlags = unpackInt(byteBuffer);
        this.QueryData_Field.Category = unpackByte(byteBuffer);
        this.QueryData_Field.SimName = unpackVariable(byteBuffer, 1);
        this.QueryData_Field.QueryStart = unpackInt(byteBuffer);
    }
}
