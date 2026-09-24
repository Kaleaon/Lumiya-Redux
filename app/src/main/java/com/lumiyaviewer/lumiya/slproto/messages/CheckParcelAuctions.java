package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;

/**
 * sim -> dataserver
 *
 * <p>Template: {@code CheckParcelAuctions Low 233 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class CheckParcelAuctions extends SLMessage {
    public ArrayList<RegionData> RegionData_Fields = new ArrayList<>();

    /** Block RegionData, Variable. */
    public static class RegionData {
        public long RegionHandle; // U64
    }

    public CheckParcelAuctions() {
        this.zeroCoded = false;
    }

    @Override
    public int CalcPayloadSize() {
        return (this.RegionData_Fields.size() * 8) + 5;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleCheckParcelAuctions(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 233 (CheckParcelAuctions).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xE9);
        byteBuffer.put((byte) this.RegionData_Fields.size());
        Iterator<?> it = this.RegionData_Fields.iterator();
        while (it.hasNext()) {
            packLong(byteBuffer, ((RegionData) it.next()).RegionHandle);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            RegionData regionData = new RegionData();
            regionData.RegionHandle = unpackLong(byteBuffer);
            this.RegionData_Fields.add(regionData);
        }
    }
}
