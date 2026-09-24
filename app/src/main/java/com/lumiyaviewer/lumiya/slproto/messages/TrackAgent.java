package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Track agent - this information is used when sending out the
 * coarse location update so that we know who you are tracking.
 * To stop tracking - send a null uuid as the prey.
 *
 * <p>Template: {@code TrackAgent Low 130 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class TrackAgent extends SLMessage {
    public AgentData AgentData_Field;
    public TargetData TargetData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block TargetData, Single. */
    public static class TargetData {
        public UUID PreyID; // LLUUID
    }

    public TrackAgent() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.TargetData_Field = new TargetData();
    }

    @Override
    public int CalcPayloadSize() {
        return 52;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleTrackAgent(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 130 (TrackAgent).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x82);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.TargetData_Field.PreyID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.TargetData_Field.PreyID = unpackUUID(byteBuffer);
    }
}
