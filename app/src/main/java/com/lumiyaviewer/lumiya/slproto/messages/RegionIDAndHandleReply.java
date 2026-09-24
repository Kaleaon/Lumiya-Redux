package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * RegionIDAndHandleReply
 *
 * <p>Template: {@code RegionIDAndHandleReply Low 310 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class RegionIDAndHandleReply extends SLMessage {
    public ReplyBlock ReplyBlock_Field;

    /** Block ReplyBlock, Single. */
    public static class ReplyBlock {
        public long RegionHandle; // U64
        public UUID RegionID; // LLUUID
    }

    public RegionIDAndHandleReply() {
        this.zeroCoded = false;
        this.ReplyBlock_Field = new ReplyBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return 28;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleRegionIDAndHandleReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 310 (RegionIDAndHandleReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x36);
        packUUID(byteBuffer, this.ReplyBlock_Field.RegionID);
        packLong(byteBuffer, this.ReplyBlock_Field.RegionHandle);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.ReplyBlock_Field.RegionID = unpackUUID(byteBuffer);
        this.ReplyBlock_Field.RegionHandle = unpackLong(byteBuffer);
    }
}
