package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * DirClassifiedQueryBackend sim->dataserver
 * reliable
 *
 * <p>Template: {@code DirClassifiedQueryBackend Low 40 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class DirClassifiedQueryBackend extends SLMessage {
    public AgentData AgentData_Field;
    public QueryData QueryData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
    }

    /** Block QueryData, Single. */
    public static class QueryData {
        public int Category; // U32
        public int EstateID; // U32
        public boolean Godlike; // BOOL
        public int QueryFlags; // U32
        public UUID QueryID; // LLUUID
        public int QueryStart; // S32
        public byte[] QueryText; // Variable 1
    }

    public DirClassifiedQueryBackend() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.QueryData_Field = new QueryData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.QueryData_Field.QueryText.length + 17 + 4 + 4 + 4 + 1 + 4 + 20;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleDirClassifiedQueryBackend(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 40 (DirClassifiedQueryBackend).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x28);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.QueryData_Field.QueryID);
        packVariable(byteBuffer, this.QueryData_Field.QueryText, 1);
        packInt(byteBuffer, this.QueryData_Field.QueryFlags);
        packInt(byteBuffer, this.QueryData_Field.Category);
        packInt(byteBuffer, this.QueryData_Field.EstateID);
        packBoolean(byteBuffer, this.QueryData_Field.Godlike);
        packInt(byteBuffer, this.QueryData_Field.QueryStart);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.QueryData_Field.QueryID = unpackUUID(byteBuffer);
        this.QueryData_Field.QueryText = unpackVariable(byteBuffer, 1);
        this.QueryData_Field.QueryFlags = unpackInt(byteBuffer);
        this.QueryData_Field.Category = unpackInt(byteBuffer);
        this.QueryData_Field.EstateID = unpackInt(byteBuffer);
        this.QueryData_Field.Godlike = unpackBoolean(byteBuffer);
        this.QueryData_Field.QueryStart = unpackInt(byteBuffer);
    }
}
