package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * map messages
 * viewer -> sim
 * reliable
 * This message is sent up from the viewer to (eventually) get a list
 * of all map layers and NULL-layer sims.
 * Returns: MapLayerReply and MapBlockReply
 *
 * <p>Template: {@code MapLayerRequest Low 405 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class MapLayerRequest extends SLMessage {
    public AgentData AgentData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public int EstateID; // U32 - filled in on sim
        public int Flags; // U32
        public boolean Godlike; // BOOL - filled in on sim
        public UUID SessionID; // LLUUID
    }

    public MapLayerRequest() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return 45;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleMapLayerRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 405 (MapLayerRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x95);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.AgentData_Field.Flags);
        packInt(byteBuffer, this.AgentData_Field.EstateID);
        packBoolean(byteBuffer, this.AgentData_Field.Godlike);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.Flags = unpackInt(byteBuffer);
        this.AgentData_Field.EstateID = unpackInt(byteBuffer);
        this.AgentData_Field.Godlike = unpackBoolean(byteBuffer);
    }
}
