package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.net.Inet4Address;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * dataserver -> sim
 *
 * <p>Template: {@code RegionPresenceResponse Low 16 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class RegionPresenceResponse extends SLMessage {
    public ArrayList<RegionData> RegionData_Fields = new ArrayList<>();

    /** Block RegionData, Variable. */
    public static class RegionData {
        public Inet4Address ExternalRegionIP; // IPADDR
        public Inet4Address InternalRegionIP; // IPADDR
        public byte[] Message; // Variable 1
        public long RegionHandle; // U64
        public UUID RegionID; // LLUUID
        public int RegionPort; // IPPORT
        public double ValidUntil; // F64
    }

    public RegionPresenceResponse() {
        this.zeroCoded = true;
    }

    @Override
    public int CalcPayloadSize() {
        int i = 5;
        Iterator<?> it = this.RegionData_Fields.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            i = ((RegionData) it.next()).Message.length + 43 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleRegionPresenceResponse(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 16 (RegionPresenceResponse).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x10);
        byteBuffer.put((byte) this.RegionData_Fields.size());
        for (RegionData regionData : this.RegionData_Fields) {
            packUUID(byteBuffer, regionData.RegionID);
            packLong(byteBuffer, regionData.RegionHandle);
            packIPAddress(byteBuffer, regionData.InternalRegionIP);
            packIPAddress(byteBuffer, regionData.ExternalRegionIP);
            packShort(byteBuffer, (short) regionData.RegionPort);
            packDouble(byteBuffer, regionData.ValidUntil);
            packVariable(byteBuffer, regionData.Message, 1);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            RegionData regionData = new RegionData();
            regionData.RegionID = unpackUUID(byteBuffer);
            regionData.RegionHandle = unpackLong(byteBuffer);
            regionData.InternalRegionIP = unpackIPAddress(byteBuffer);
            regionData.ExternalRegionIP = unpackIPAddress(byteBuffer);
            regionData.RegionPort = unpackShort(byteBuffer) & 65535;
            regionData.ValidUntil = unpackDouble(byteBuffer);
            regionData.Message = unpackVariable(byteBuffer, 1);
            this.RegionData_Fields.add(regionData);
        }
    }
}
