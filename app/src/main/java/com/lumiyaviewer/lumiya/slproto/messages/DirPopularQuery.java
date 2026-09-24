package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * DEPRECATED: DirPopularQuery viewer->sim
 * Special query for the land for sale/auction panel.
 * reliable
 *
 * <p>Template: {@code DirPopularQuery Low 51 NotTrusted Zerocoded Deprecated}
 * (recovered/reference/message_template.msg).
 */
public class DirPopularQuery extends SLMessage {
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
    }

    public DirPopularQuery() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.QueryData_Field = new QueryData();
    }

    @Override
    public int CalcPayloadSize() {
        return 56;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleDirPopularQuery(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 51 (DirPopularQuery).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x33);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.QueryData_Field.QueryID);
        packInt(byteBuffer, this.QueryData_Field.QueryFlags);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.QueryData_Field.QueryID = unpackUUID(byteBuffer);
        this.QueryData_Field.QueryFlags = unpackInt(byteBuffer);
    }
}
