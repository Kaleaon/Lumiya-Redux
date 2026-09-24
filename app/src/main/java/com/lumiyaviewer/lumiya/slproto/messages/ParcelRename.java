package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * System operations and maintenance
 * spaceserver -> sim
 * tell a particular simulator to rename a parcel
 *
 * <p>Template: {@code ParcelRename Low 402 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class ParcelRename extends SLMessage {
    public ArrayList<ParcelData> ParcelData_Fields = new ArrayList<>();

    /** Block ParcelData, Variable. */
    public static class ParcelData {
        public byte[] NewName; // Variable 1 - string
        public UUID ParcelID; // LLUUID
    }

    public ParcelRename() {
        this.zeroCoded = false;
    }

    @Override
    public int CalcPayloadSize() {
        int i = 5;
        Iterator<?> it = this.ParcelData_Fields.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            i = ((ParcelData) it.next()).NewName.length + 17 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleParcelRename(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 402 (ParcelRename).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x92);
        byteBuffer.put((byte) this.ParcelData_Fields.size());
        for (ParcelData parcelData : this.ParcelData_Fields) {
            packUUID(byteBuffer, parcelData.ParcelID);
            packVariable(byteBuffer, parcelData.NewName, 1);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            ParcelData parcelData = new ParcelData();
            parcelData.ParcelID = unpackUUID(byteBuffer);
            parcelData.NewName = unpackVariable(byteBuffer, 1);
            this.ParcelData_Fields.add(parcelData);
        }
    }
}
