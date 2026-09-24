package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * EventNotificationAddRequest
 * viewer -> simulator
 * simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code EventNotificationAddRequest Low 181 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class EventNotificationAddRequest extends SLMessage {
    public AgentData AgentData_Field;
    public EventData EventData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block EventData, Single. */
    public static class EventData {
        public int EventID; // U32
    }

    public EventNotificationAddRequest() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.EventData_Field = new EventData();
    }

    @Override
    public int CalcPayloadSize() {
        return 40;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleEventNotificationAddRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 181 (EventNotificationAddRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xB5);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.EventData_Field.EventID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.EventData_Field.EventID = unpackInt(byteBuffer);
    }
}
