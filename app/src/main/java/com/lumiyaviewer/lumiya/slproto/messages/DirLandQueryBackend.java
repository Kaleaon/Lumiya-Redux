package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * DirLandQueryBackend sim->dataserver
 * Special query for the land for sale/auction panel.
 *
 * <p>Template: {@code DirLandQueryBackend Low 49 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class DirLandQueryBackend extends SLMessage {
    public AgentData AgentData_Field;
    public QueryData QueryData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
    }

    /** Block QueryData, Single. */
    public static class QueryData {
        public int Area; // S32
        public int EstateID; // U32
        public boolean Godlike; // BOOL
        public int Price; // S32
        public int QueryFlags; // U32
        public UUID QueryID; // LLUUID
        public int QueryStart; // S32
        public int SearchType; // U32
    }

    public DirLandQueryBackend() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.QueryData_Field = new QueryData();
    }

    @Override
    public int CalcPayloadSize() {
        return 61;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleDirLandQueryBackend(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 49 (DirLandQueryBackend).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x31);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.QueryData_Field.QueryID);
        packInt(byteBuffer, this.QueryData_Field.QueryFlags);
        packInt(byteBuffer, this.QueryData_Field.SearchType);
        packInt(byteBuffer, this.QueryData_Field.Price);
        packInt(byteBuffer, this.QueryData_Field.Area);
        packInt(byteBuffer, this.QueryData_Field.QueryStart);
        packInt(byteBuffer, this.QueryData_Field.EstateID);
        packBoolean(byteBuffer, this.QueryData_Field.Godlike);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.QueryData_Field.QueryID = unpackUUID(byteBuffer);
        this.QueryData_Field.QueryFlags = unpackInt(byteBuffer);
        this.QueryData_Field.SearchType = unpackInt(byteBuffer);
        this.QueryData_Field.Price = unpackInt(byteBuffer);
        this.QueryData_Field.Area = unpackInt(byteBuffer);
        this.QueryData_Field.QueryStart = unpackInt(byteBuffer);
        this.QueryData_Field.EstateID = unpackInt(byteBuffer);
        this.QueryData_Field.Godlike = unpackBoolean(byteBuffer);
    }
}
