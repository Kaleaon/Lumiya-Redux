package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;

/**
 * NearestLandingPointUpdated
 * sim->dataserver
 * Sent from a region to the data server
 * to have the dataserver note/clear in the db
 * that the region has updated it's nearest landing point
 *
 * <p>Template: {@code NearestLandingRegionUpdated Low 146 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class NearestLandingRegionUpdated extends SLMessage {
    public RegionData RegionData_Field;

    /** Block RegionData, Single. */
    public static class RegionData {
        public long RegionHandle; // U64
    }

    public NearestLandingRegionUpdated() {
        this.zeroCoded = false;
        this.RegionData_Field = new RegionData();
    }

    @Override
    public int CalcPayloadSize() {
        return 12;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleNearestLandingRegionUpdated(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 146 (NearestLandingRegionUpdated).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x92);
        packLong(byteBuffer, this.RegionData_Field.RegionHandle);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.RegionData_Field.RegionHandle = unpackLong(byteBuffer);
    }
}
