package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;

/**
 * TeleportLandingStatusChanged
 * sim->dataserver
 * Sent from the region to the data server
 * to note that the region's teleportation landing status has changed
 *
 * <p>Template: {@code TeleportLandingStatusChanged Low 147 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class TeleportLandingStatusChanged extends SLMessage {
    public RegionData RegionData_Field;

    /** Block RegionData, Single. */
    public static class RegionData {
        public long RegionHandle; // U64
    }

    public TeleportLandingStatusChanged() {
        this.zeroCoded = false;
        this.RegionData_Field = new RegionData();
    }

    @Override
    public int CalcPayloadSize() {
        return 12;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleTeleportLandingStatusChanged(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 147 (TeleportLandingStatusChanged).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x93);
        packLong(byteBuffer, this.RegionData_Field.RegionHandle);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.RegionData_Field.RegionHandle = unpackLong(byteBuffer);
    }
}
