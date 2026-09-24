package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * viewer -> sim
 * This message is sent up from the viewer to get a list
 * of the sims in a specified region.
 * Returns: MapBlockReply
 *
 * <p>Template: {@code MapBlockRequest Low 407 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class MapBlockRequest extends SLMessage {
    public AgentData AgentData_Field;
    public PositionData PositionData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public int EstateID; // U32 - filled in on sim
        public int Flags; // U32
        public boolean Godlike; // BOOL - filled in on sim
        public UUID SessionID; // LLUUID
    }

    /** Block PositionData, Single. */
    public static class PositionData {
        public int MaxX; // U16 - in region-widths
        public int MaxY; // U16 - in region-widths
        public int MinX; // U16 - in region-widths
        public int MinY; // U16 - in region-widths
    }

    public MapBlockRequest() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.PositionData_Field = new PositionData();
    }

    @Override
    public int CalcPayloadSize() {
        return 53;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleMapBlockRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 407 (MapBlockRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x97);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.AgentData_Field.Flags);
        packInt(byteBuffer, this.AgentData_Field.EstateID);
        packBoolean(byteBuffer, this.AgentData_Field.Godlike);
        packShort(byteBuffer, (short) this.PositionData_Field.MinX);
        packShort(byteBuffer, (short) this.PositionData_Field.MaxX);
        packShort(byteBuffer, (short) this.PositionData_Field.MinY);
        packShort(byteBuffer, (short) this.PositionData_Field.MaxY);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.Flags = unpackInt(byteBuffer);
        this.AgentData_Field.EstateID = unpackInt(byteBuffer);
        this.AgentData_Field.Godlike = unpackBoolean(byteBuffer);
        this.PositionData_Field.MinX = unpackShort(byteBuffer) & 65535;
        this.PositionData_Field.MaxX = unpackShort(byteBuffer) & 65535;
        this.PositionData_Field.MinY = unpackShort(byteBuffer) & 65535;
        this.PositionData_Field.MaxY = unpackShort(byteBuffer) & 65535;
    }
}
