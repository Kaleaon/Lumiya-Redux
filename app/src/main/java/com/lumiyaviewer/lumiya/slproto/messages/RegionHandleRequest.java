package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * get information about landmarks. Used by viewers for determining
 * the location of a landmark, and by simulators for teleport
 *
 * <p>Template: {@code RegionHandleRequest Low 309 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class RegionHandleRequest extends SLMessage {
    public RequestBlock RequestBlock_Field;

    /** Block RequestBlock, Single. */
    public static class RequestBlock {
        public UUID RegionID; // LLUUID
    }

    public RegionHandleRequest() {
        this.zeroCoded = false;
        this.RequestBlock_Field = new RequestBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return 20;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleRegionHandleRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 309 (RegionHandleRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x35);
        packUUID(byteBuffer, this.RequestBlock_Field.RegionID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.RequestBlock_Field.RegionID = unpackUUID(byteBuffer);
    }
}
