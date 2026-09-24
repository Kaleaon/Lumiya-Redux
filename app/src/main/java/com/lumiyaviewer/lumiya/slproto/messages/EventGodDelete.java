package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * EventGodDelete
 * viewer -> simulator
 * simulator -> dataserver
 * QueryData is used to resend a search result after the deletion
 * reliable
 *
 * <p>Template: {@code EventGodDelete Low 183 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class EventGodDelete extends SLMessage {
    public AgentData AgentData_Field;
    public EventData EventData_Field;
    public QueryData QueryData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block EventData, Single. */
    public static class EventData {
        public int EventID; // U32
    }

    /** Block QueryData, Single. */
    public static class QueryData {
        public int QueryFlags; // U32
        public UUID QueryID; // LLUUID
        public int QueryStart; // S32 - prev/next page support
        public byte[] QueryText; // Variable 1
    }

    public EventGodDelete() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.EventData_Field = new EventData();
        this.QueryData_Field = new QueryData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.QueryData_Field.QueryText.length + 17 + 4 + 4 + 40;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleEventGodDelete(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 183 (EventGodDelete).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xB7);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.EventData_Field.EventID);
        packUUID(byteBuffer, this.QueryData_Field.QueryID);
        packVariable(byteBuffer, this.QueryData_Field.QueryText, 1);
        packInt(byteBuffer, this.QueryData_Field.QueryFlags);
        packInt(byteBuffer, this.QueryData_Field.QueryStart);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.EventData_Field.EventID = unpackInt(byteBuffer);
        this.QueryData_Field.QueryID = unpackUUID(byteBuffer);
        this.QueryData_Field.QueryText = unpackVariable(byteBuffer, 1);
        this.QueryData_Field.QueryFlags = unpackInt(byteBuffer);
        this.QueryData_Field.QueryStart = unpackInt(byteBuffer);
    }
}
