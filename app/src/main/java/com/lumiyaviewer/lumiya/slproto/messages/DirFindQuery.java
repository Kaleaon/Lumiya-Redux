package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * DirFindQuery viewer->sim
 * Message to start asking questions for the directory
 *
 * <p>Template: {@code DirFindQuery Low 31 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class DirFindQuery extends SLMessage {
    public AgentData AgentData_Field;
    public QueryData QueryData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block QueryData, Single. */
    public static class QueryData {
        public int QueryFlags; // U32
        public UUID QueryID; // LLUUID
        public int QueryStart; // S32 - prev/next page support
        public byte[] QueryText; // Variable 1
    }

    public DirFindQuery() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.QueryData_Field = new QueryData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.QueryData_Field.QueryText.length + 17 + 4 + 4 + 36;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleDirFindQuery(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 31 (DirFindQuery).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x1F);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.QueryData_Field.QueryID);
        packVariable(byteBuffer, this.QueryData_Field.QueryText, 1);
        packInt(byteBuffer, this.QueryData_Field.QueryFlags);
        packInt(byteBuffer, this.QueryData_Field.QueryStart);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.QueryData_Field.QueryID = unpackUUID(byteBuffer);
        this.QueryData_Field.QueryText = unpackVariable(byteBuffer, 1);
        this.QueryData_Field.QueryFlags = unpackInt(byteBuffer);
        this.QueryData_Field.QueryStart = unpackInt(byteBuffer);
    }
}
