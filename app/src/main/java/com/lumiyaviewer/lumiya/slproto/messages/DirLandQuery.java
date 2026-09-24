package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * DirLandQuery viewer->sim
 * Special query for the land for sale/auction panel.
 * reliable
 *
 * <p>Template: {@code DirLandQuery Low 48 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class DirLandQuery extends SLMessage {
    public AgentData AgentData_Field;
    public QueryData QueryData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block QueryData, Single. */
    public static class QueryData {
        public int Area; // S32
        public int Price; // S32
        public int QueryFlags; // U32
        public UUID QueryID; // LLUUID
        public int QueryStart; // S32
        public int SearchType; // U32
    }

    public DirLandQuery() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.QueryData_Field = new QueryData();
    }

    @Override
    public int CalcPayloadSize() {
        return 72;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleDirLandQuery(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 48 (DirLandQuery).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x30);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.QueryData_Field.QueryID);
        packInt(byteBuffer, this.QueryData_Field.QueryFlags);
        packInt(byteBuffer, this.QueryData_Field.SearchType);
        packInt(byteBuffer, this.QueryData_Field.Price);
        packInt(byteBuffer, this.QueryData_Field.Area);
        packInt(byteBuffer, this.QueryData_Field.QueryStart);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.QueryData_Field.QueryID = unpackUUID(byteBuffer);
        this.QueryData_Field.QueryFlags = unpackInt(byteBuffer);
        this.QueryData_Field.SearchType = unpackInt(byteBuffer);
        this.QueryData_Field.Price = unpackInt(byteBuffer);
        this.QueryData_Field.Area = unpackInt(byteBuffer);
        this.QueryData_Field.QueryStart = unpackInt(byteBuffer);
    }
}
