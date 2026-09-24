package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * dataserver -> sim
 *
 * <p>Template: {@code ConfirmAuctionStart Low 230 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class ConfirmAuctionStart extends SLMessage {
    public AuctionData AuctionData_Field;

    /** Block AuctionData, Single. */
    public static class AuctionData {
        public int AuctionID; // U32
        public UUID ParcelID; // LLUUID
    }

    public ConfirmAuctionStart() {
        this.zeroCoded = false;
        this.AuctionData_Field = new AuctionData();
    }

    @Override
    public int CalcPayloadSize() {
        return 24;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleConfirmAuctionStart(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 230 (ConfirmAuctionStart).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xE6);
        packUUID(byteBuffer, this.AuctionData_Field.ParcelID);
        packInt(byteBuffer, this.AuctionData_Field.AuctionID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AuctionData_Field.ParcelID = unpackUUID(byteBuffer);
        this.AuctionData_Field.AuctionID = unpackInt(byteBuffer);
    }
}
