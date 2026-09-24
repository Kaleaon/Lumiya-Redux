package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * RegionHandshakeReply
 * viewer -> sim
 * reliable
 * Sent after viewer has initialized the (pre-existing)
 * LLViewerRegion with the name, access level, etc. and
 * has loaded the cache for the region.
 * After the simulator receives this, it will start sending
 * data about objects.
 *
 * <p>Template: {@code RegionHandshakeReply Low 149 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class RegionHandshakeReply extends SLMessage {
    public AgentData AgentData_Field;
    public RegionInfo RegionInfo_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block RegionInfo, Single. */
    public static class RegionInfo {
        public int Flags; // U32
    }

    public RegionHandshakeReply() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.RegionInfo_Field = new RegionInfo();
    }

    @Override
    public int CalcPayloadSize() {
        return 40;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleRegionHandshakeReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 149 (RegionHandshakeReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x95);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.RegionInfo_Field.Flags);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.RegionInfo_Field.Flags = unpackInt(byteBuffer);
    }
}
