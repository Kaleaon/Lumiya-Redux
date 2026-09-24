package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * Presense messages
 * sim -> dataserver
 *
 * <p>Template: {@code RegionPresenceRequestByRegionID Low 14 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class RegionPresenceRequestByRegionID extends SLMessage {
    public ArrayList<RegionData> RegionData_Fields = new ArrayList<>();

    /** Block RegionData, Variable. */
    public static class RegionData {
        public UUID RegionID; // LLUUID
    }

    public RegionPresenceRequestByRegionID() {
        this.zeroCoded = false;
    }

    @Override
    public int CalcPayloadSize() {
        return (this.RegionData_Fields.size() * 16) + 5;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleRegionPresenceRequestByRegionID(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 14 (RegionPresenceRequestByRegionID).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x0E);
        byteBuffer.put((byte) this.RegionData_Fields.size());
        Iterator<?> it = this.RegionData_Fields.iterator();
        while (it.hasNext()) {
            packUUID(byteBuffer, ((RegionData) it.next()).RegionID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            RegionData regionData = new RegionData();
            regionData.RegionID = unpackUUID(byteBuffer);
            this.RegionData_Fields.add(regionData);
        }
    }
}
