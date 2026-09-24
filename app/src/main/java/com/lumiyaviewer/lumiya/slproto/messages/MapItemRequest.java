package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * viewer -> sim
 * This message is sent up from the viewer to get a list
 * of the items of a particular type on the map.
 * Used for Telehubs, Agents, Events, Popular Places, etc.
 * Returns: MapBlockReply
 *
 * <p>Template: {@code MapItemRequest Low 410 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class MapItemRequest extends SLMessage {
    public AgentData AgentData_Field;
    public RequestData RequestData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public int EstateID; // U32 - filled in on sim
        public int Flags; // U32
        public boolean Godlike; // BOOL - filled in on sim
        public UUID SessionID; // LLUUID
    }

    /** Block RequestData, Single. */
    public static class RequestData {
        public int ItemType; // U32
        public long RegionHandle; // U64 - filled in on sim
    }

    public MapItemRequest() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.RequestData_Field = new RequestData();
    }

    @Override
    public int CalcPayloadSize() {
        return 57;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleMapItemRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 410 (MapItemRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x9A);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.AgentData_Field.Flags);
        packInt(byteBuffer, this.AgentData_Field.EstateID);
        packBoolean(byteBuffer, this.AgentData_Field.Godlike);
        packInt(byteBuffer, this.RequestData_Field.ItemType);
        packLong(byteBuffer, this.RequestData_Field.RegionHandle);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.Flags = unpackInt(byteBuffer);
        this.AgentData_Field.EstateID = unpackInt(byteBuffer);
        this.AgentData_Field.Godlike = unpackBoolean(byteBuffer);
        this.RequestData_Field.ItemType = unpackInt(byteBuffer);
        this.RequestData_Field.RegionHandle = unpackLong(byteBuffer);
    }
}
