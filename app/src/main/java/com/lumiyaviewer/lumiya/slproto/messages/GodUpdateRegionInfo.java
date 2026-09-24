package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * GodUpdateRegionInfo
 * Sent from viewer to sim after a god has changed some
 * of the parameters in the god tools floater
 * viewer -> sim
 * reliable
 *
 * <p>Template: {@code GodUpdateRegionInfo Low 143 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class GodUpdateRegionInfo extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<RegionInfo2> RegionInfo2_Fields = new ArrayList<>();
    public RegionInfo RegionInfo_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block RegionInfo, Single. */
    public static class RegionInfo {
        public float BillableFactor; // F32
        public int EstateID; // U32
        public int ParentEstateID; // U32
        public int PricePerMeter; // S32
        public int RedirectGridX; // S32
        public int RedirectGridY; // S32
        public int RegionFlags; // U32
        public byte[] SimName; // Variable 1 - string
    }

    /** Block RegionInfo2, Variable. */
    public static class RegionInfo2 {
        public long RegionFlagsExtended; // U64
    }

    public GodUpdateRegionInfo() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.RegionInfo_Field = new RegionInfo();
    }

    @Override
    public int CalcPayloadSize() {
        return this.RegionInfo_Field.SimName.length + 1 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 36 + 1 + (this.RegionInfo2_Fields.size() * 8);
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleGodUpdateRegionInfo(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 143 (GodUpdateRegionInfo).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x8F);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packVariable(byteBuffer, this.RegionInfo_Field.SimName, 1);
        packInt(byteBuffer, this.RegionInfo_Field.EstateID);
        packInt(byteBuffer, this.RegionInfo_Field.ParentEstateID);
        packInt(byteBuffer, this.RegionInfo_Field.RegionFlags);
        packFloat(byteBuffer, this.RegionInfo_Field.BillableFactor);
        packInt(byteBuffer, this.RegionInfo_Field.PricePerMeter);
        packInt(byteBuffer, this.RegionInfo_Field.RedirectGridX);
        packInt(byteBuffer, this.RegionInfo_Field.RedirectGridY);
        byteBuffer.put((byte) this.RegionInfo2_Fields.size());
        Iterator<?> it = this.RegionInfo2_Fields.iterator();
        while (it.hasNext()) {
            packLong(byteBuffer, ((RegionInfo2) it.next()).RegionFlagsExtended);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.RegionInfo_Field.SimName = unpackVariable(byteBuffer, 1);
        this.RegionInfo_Field.EstateID = unpackInt(byteBuffer);
        this.RegionInfo_Field.ParentEstateID = unpackInt(byteBuffer);
        this.RegionInfo_Field.RegionFlags = unpackInt(byteBuffer);
        this.RegionInfo_Field.BillableFactor = unpackFloat(byteBuffer);
        this.RegionInfo_Field.PricePerMeter = unpackInt(byteBuffer);
        this.RegionInfo_Field.RedirectGridX = unpackInt(byteBuffer);
        this.RegionInfo_Field.RedirectGridY = unpackInt(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            RegionInfo2 regionInfo2 = new RegionInfo2();
            regionInfo2.RegionFlagsExtended = unpackLong(byteBuffer);
            this.RegionInfo2_Fields.add(regionInfo2);
        }
    }
}
