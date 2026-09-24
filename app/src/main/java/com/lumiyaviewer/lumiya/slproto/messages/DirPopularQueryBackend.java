package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * DEPRECATED: DirPopularQueryBackend sim->dataserver
 * Special query for the land for sale/auction panel.
 * reliable
 *
 * <p>Template: {@code DirPopularQueryBackend Low 52 Trusted Zerocoded Deprecated}
 * (recovered/reference/message_template.msg).
 */
public class DirPopularQueryBackend extends SLMessage {
    public AgentData AgentData_Field;
    public QueryData QueryData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
    }

    /** Block QueryData, Single. */
    public static class QueryData {
        public int EstateID; // U32
        public boolean Godlike; // BOOL
        public int QueryFlags; // U32
        public UUID QueryID; // LLUUID
    }

    public DirPopularQueryBackend() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.QueryData_Field = new QueryData();
    }

    @Override
    public int CalcPayloadSize() {
        return 45;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleDirPopularQueryBackend(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 52 (DirPopularQueryBackend).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x34);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.QueryData_Field.QueryID);
        packInt(byteBuffer, this.QueryData_Field.QueryFlags);
        packInt(byteBuffer, this.QueryData_Field.EstateID);
        packBoolean(byteBuffer, this.QueryData_Field.Godlike);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.QueryData_Field.QueryID = unpackUUID(byteBuffer);
        this.QueryData_Field.QueryFlags = unpackInt(byteBuffer);
        this.QueryData_Field.EstateID = unpackInt(byteBuffer);
        this.QueryData_Field.Godlike = unpackBoolean(byteBuffer);
    }
}
