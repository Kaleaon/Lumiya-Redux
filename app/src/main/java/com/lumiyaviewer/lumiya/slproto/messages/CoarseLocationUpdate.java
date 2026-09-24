package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * The CoarseLocationUpdate message is sent to notify the viewer of
 * the location of mappable objects in the region. 1 meter resolution is
 * sufficient for this. The index block is used to show where you are,
 * and where someone you are tracking is located. They are -1 if not
 * applicable.
 *
 * <p>Template: {@code CoarseLocationUpdate Medium 6 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLWorld::processCoarseUpdate()} in indra/newview/llworld.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class CoarseLocationUpdate extends SLMessage {
    public Index Index_Field;
    public ArrayList<Location> Location_Fields = new ArrayList<>();
    public ArrayList<AgentData> AgentData_Fields = new ArrayList<>();

    /** Block AgentData, Variable. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
    }

    /** Block Index, Single. */
    public static class Index {
        public int Prey; // S16
        public int You; // S16
    }

    /** Block Location, Variable. */
    public static class Location {
        public int X; // U8
        public int Y; // U8
        public int Z; // U8 - Z in meters / 4
    }

    public CoarseLocationUpdate() {
        this.zeroCoded = false;
        this.Index_Field = new Index();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.Location_Fields.size() * 3) + 3 + 4 + 1 + (this.AgentData_Fields.size() * 16);
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleCoarseLocationUpdate(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Medium 6 (CoarseLocationUpdate).
        byteBuffer.put((byte) 0xFF);
        byteBuffer.put((byte) 0x06);
        byteBuffer.put((byte) this.Location_Fields.size());
        for (Location location : this.Location_Fields) {
            packByte(byteBuffer, (byte) location.X);
            packByte(byteBuffer, (byte) location.Y);
            packByte(byteBuffer, (byte) location.Z);
        }
        packShort(byteBuffer, (short) this.Index_Field.You);
        packShort(byteBuffer, (short) this.Index_Field.Prey);
        byteBuffer.put((byte) this.AgentData_Fields.size());
        Iterator<?> it = this.AgentData_Fields.iterator();
        while (it.hasNext()) {
            packUUID(byteBuffer, ((AgentData) it.next()).AgentID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            Location location = new Location();
            location.X = unpackByte(byteBuffer) & 0xFF;
            location.Y = unpackByte(byteBuffer) & 0xFF;
            location.Z = unpackByte(byteBuffer) & 0xFF;
            this.Location_Fields.add(location);
        }
        this.Index_Field.You = unpackShort(byteBuffer);
        this.Index_Field.Prey = unpackShort(byteBuffer);
        int i3 = byteBuffer.get() & 0xFF;
        for (int i4 = 0; i4 < i3; i4++) {
            AgentData agentData = new AgentData();
            agentData.AgentID = unpackUUID(byteBuffer);
            this.AgentData_Fields.add(agentData);
        }
    }
}
