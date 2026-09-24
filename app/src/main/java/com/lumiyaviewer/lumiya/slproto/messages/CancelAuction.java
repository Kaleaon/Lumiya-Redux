package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * Tell the dataserver that an auction has been canceled.
 *
 * <p>Template: {@code CancelAuction Low 232 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class CancelAuction extends SLMessage {
    public ArrayList<ParcelData> ParcelData_Fields = new ArrayList<>();

    /** Block ParcelData, Variable. */
    public static class ParcelData {
        public UUID ParcelID; // LLUUID
    }

    public CancelAuction() {
        this.zeroCoded = false;
    }

    @Override
    public int CalcPayloadSize() {
        return (this.ParcelData_Fields.size() * 16) + 5;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleCancelAuction(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 232 (CancelAuction).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xE8);
        byteBuffer.put((byte) this.ParcelData_Fields.size());
        Iterator<?> it = this.ParcelData_Fields.iterator();
        while (it.hasNext()) {
            packUUID(byteBuffer, ((ParcelData) it.next()).ParcelID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            ParcelData parcelData = new ParcelData();
            parcelData.ParcelID = unpackUUID(byteBuffer);
            this.ParcelData_Fields.add(parcelData);
        }
    }
}
