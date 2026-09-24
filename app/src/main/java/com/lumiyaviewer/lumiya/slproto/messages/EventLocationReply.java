package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * EventLocationReply
 *
 * <p>Template: {@code EventLocationReply Low 308 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class EventLocationReply extends SLMessage {
    public EventData EventData_Field;
    public QueryData QueryData_Field;

    /** Block EventData, Single. */
    public static class EventData {
        public UUID RegionID; // LLUUID
        public LLVector3 RegionPos; // LLVector3
        public boolean Success; // BOOL
    }

    /** Block QueryData, Single. */
    public static class QueryData {
        public UUID QueryID; // LLUUID
    }

    public EventLocationReply() {
        this.zeroCoded = true;
        this.QueryData_Field = new QueryData();
        this.EventData_Field = new EventData();
    }

    @Override
    public int CalcPayloadSize() {
        return 49;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleEventLocationReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 308 (EventLocationReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x34);
        packUUID(byteBuffer, this.QueryData_Field.QueryID);
        packBoolean(byteBuffer, this.EventData_Field.Success);
        packUUID(byteBuffer, this.EventData_Field.RegionID);
        packLLVector3(byteBuffer, this.EventData_Field.RegionPos);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.QueryData_Field.QueryID = unpackUUID(byteBuffer);
        this.EventData_Field.Success = unpackBoolean(byteBuffer);
        this.EventData_Field.RegionID = unpackUUID(byteBuffer);
        this.EventData_Field.RegionPos = unpackLLVector3(byteBuffer);
    }
}
