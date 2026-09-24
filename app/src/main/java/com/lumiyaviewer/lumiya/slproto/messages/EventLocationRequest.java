package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * EventLocationRequest
 *
 * <p>Template: {@code EventLocationRequest Low 307 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class EventLocationRequest extends SLMessage {
    public EventData EventData_Field;
    public QueryData QueryData_Field;

    /** Block EventData, Single. */
    public static class EventData {
        public int EventID; // U32
    }

    /** Block QueryData, Single. */
    public static class QueryData {
        public UUID QueryID; // LLUUID
    }

    public EventLocationRequest() {
        this.zeroCoded = true;
        this.QueryData_Field = new QueryData();
        this.EventData_Field = new EventData();
    }

    @Override
    public int CalcPayloadSize() {
        return 24;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleEventLocationRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 307 (EventLocationRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x33);
        packUUID(byteBuffer, this.QueryData_Field.QueryID);
        packInt(byteBuffer, this.EventData_Field.EventID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.QueryData_Field.QueryID = unpackUUID(byteBuffer);
        this.EventData_Field.EventID = unpackInt(byteBuffer);
    }
}
