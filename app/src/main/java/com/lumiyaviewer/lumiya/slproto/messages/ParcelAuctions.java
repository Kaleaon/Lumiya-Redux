package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * dataserver -> sim
 * tell a particular simulator to finish parcel sale.
 *
 * <p>Template: {@code ParcelAuctions Low 234 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class ParcelAuctions extends SLMessage {
    public ArrayList<ParcelData> ParcelData_Fields = new ArrayList<>();

    /** Block ParcelData, Variable. */
    public static class ParcelData {
        public UUID ParcelID; // LLUUID
        public UUID WinnerID; // LLUUID
    }

    public ParcelAuctions() {
        this.zeroCoded = false;
    }

    @Override
    public int CalcPayloadSize() {
        return (this.ParcelData_Fields.size() * 32) + 5;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleParcelAuctions(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 234 (ParcelAuctions).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xEA);
        byteBuffer.put((byte) this.ParcelData_Fields.size());
        for (ParcelData parcelData : this.ParcelData_Fields) {
            packUUID(byteBuffer, parcelData.ParcelID);
            packUUID(byteBuffer, parcelData.WinnerID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            ParcelData parcelData = new ParcelData();
            parcelData.ParcelID = unpackUUID(byteBuffer);
            parcelData.WinnerID = unpackUUID(byteBuffer);
            this.ParcelData_Fields.add(parcelData);
        }
    }
}
