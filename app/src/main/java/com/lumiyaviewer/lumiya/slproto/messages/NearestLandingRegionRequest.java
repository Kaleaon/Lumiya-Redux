package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;

/**
 * NearestLandingRegionRequest
 * sim->dataserver
 * Sent from the region to the data server
 * to request the most up to date region for the requesting
 * region to redirect teleports to
 *
 * <p>Template: {@code NearestLandingRegionRequest Low 144 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class NearestLandingRegionRequest extends SLMessage {
    public RequestingRegionData RequestingRegionData_Field;

    /** Block RequestingRegionData, Single. */
    public static class RequestingRegionData {
        public long RegionHandle; // U64
    }

    public NearestLandingRegionRequest() {
        this.zeroCoded = false;
        this.RequestingRegionData_Field = new RequestingRegionData();
    }

    @Override
    public int CalcPayloadSize() {
        return 12;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleNearestLandingRegionRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 144 (NearestLandingRegionRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x90);
        packLong(byteBuffer, this.RequestingRegionData_Field.RegionHandle);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.RequestingRegionData_Field.RegionHandle = unpackLong(byteBuffer);
    }
}
