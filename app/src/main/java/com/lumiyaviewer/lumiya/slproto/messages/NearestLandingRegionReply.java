package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;

/**
 * NearestLandingPointReply
 * dataserver->sim
 * Sent from the data server to a region in reply
 * to the redirectregion request stating which region
 * the requesting region should redirect teleports to if necessary
 *
 * <p>Template: {@code NearestLandingRegionReply Low 145 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class NearestLandingRegionReply extends SLMessage {
    public LandingRegionData LandingRegionData_Field;

    /** Block LandingRegionData, Single. */
    public static class LandingRegionData {
        public long RegionHandle; // U64
    }

    public NearestLandingRegionReply() {
        this.zeroCoded = false;
        this.LandingRegionData_Field = new LandingRegionData();
    }

    @Override
    public int CalcPayloadSize() {
        return 12;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleNearestLandingRegionReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 145 (NearestLandingRegionReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x91);
        packLong(byteBuffer, this.LandingRegionData_Field.RegionHandle);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.LandingRegionData_Field.RegionHandle = unpackLong(byteBuffer);
    }
}
