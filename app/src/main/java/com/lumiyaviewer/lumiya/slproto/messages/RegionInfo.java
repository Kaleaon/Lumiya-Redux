package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * RegionInfo
 * Used to populate UI for both region/estate floater
 * and god tools floater
 * sim -> viewer
 * reliable
 *
 * <p>Template: {@code RegionInfo Low 142 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLViewerRegion::processRegionInfo()} in indra/newview/llviewerregion.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class RegionInfo extends SLMessage {
    public AgentData AgentData_Field;
    public RegionInfo2 RegionInfo2_Field;
    public ArrayList<RegionInfo3> RegionInfo3_Fields = new ArrayList<>();
    public RegionInfoData RegionInfoData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block RegionInfo2, Single. */
    public static class RegionInfo2 {
        public int HardMaxAgents; // U32
        public int HardMaxObjects; // U32
        public int MaxAgents32; // U32 - Identical to RegionInfo.MaxAgents but allows greater range
        public byte[] ProductName; // Variable 1 - string
        public byte[] ProductSKU; // Variable 1 - string
    }

    /** Block RegionInfo3, Variable. */
    public static class RegionInfo3 {
        public long RegionFlagsExtended; // U64
    }

    public static class RegionInfoData {
        public float BillableFactor; // F32
        public int EstateID; // U32
        public int MaxAgents; // U8
        public float ObjectBonusFactor; // F32
        public int ParentEstateID; // U32
        public int PricePerMeter; // S32
        public int RedirectGridX; // S32
        public int RedirectGridY; // S32
        public int RegionFlags; // U32
        public int SimAccess; // U8
        public byte[] SimName; // Variable 1 - string
        public float SunHour; // F32 - last value set by estate or region controls JC
        public float TerrainLowerLimit; // F32
        public float TerrainRaiseLimit; // F32
        public boolean UseEstateSun; // BOOL
        public float WaterHeight; // F32
    }

    public RegionInfo() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.RegionInfoData_Field = new RegionInfoData();
        this.RegionInfo2_Field = new RegionInfo2();
    }

    @Override
    public int CalcPayloadSize() {
        return this.RegionInfoData_Field.SimName.length + 1 + 4 + 4 + 4 + 1 + 1 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 1 + 4 + 36 + this.RegionInfo2_Field.ProductSKU.length + 1 + 1 + this.RegionInfo2_Field.ProductName.length + 4 + 4 + 4 + 1 + (this.RegionInfo3_Fields.size() * 8);
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleRegionInfo(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 142 (RegionInfo).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x8E);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packVariable(byteBuffer, this.RegionInfoData_Field.SimName, 1);
        packInt(byteBuffer, this.RegionInfoData_Field.EstateID);
        packInt(byteBuffer, this.RegionInfoData_Field.ParentEstateID);
        packInt(byteBuffer, this.RegionInfoData_Field.RegionFlags);
        packByte(byteBuffer, (byte) this.RegionInfoData_Field.SimAccess);
        packByte(byteBuffer, (byte) this.RegionInfoData_Field.MaxAgents);
        packFloat(byteBuffer, this.RegionInfoData_Field.BillableFactor);
        packFloat(byteBuffer, this.RegionInfoData_Field.ObjectBonusFactor);
        packFloat(byteBuffer, this.RegionInfoData_Field.WaterHeight);
        packFloat(byteBuffer, this.RegionInfoData_Field.TerrainRaiseLimit);
        packFloat(byteBuffer, this.RegionInfoData_Field.TerrainLowerLimit);
        packInt(byteBuffer, this.RegionInfoData_Field.PricePerMeter);
        packInt(byteBuffer, this.RegionInfoData_Field.RedirectGridX);
        packInt(byteBuffer, this.RegionInfoData_Field.RedirectGridY);
        packBoolean(byteBuffer, this.RegionInfoData_Field.UseEstateSun);
        packFloat(byteBuffer, this.RegionInfoData_Field.SunHour);
        packVariable(byteBuffer, this.RegionInfo2_Field.ProductSKU, 1);
        packVariable(byteBuffer, this.RegionInfo2_Field.ProductName, 1);
        packInt(byteBuffer, this.RegionInfo2_Field.MaxAgents32);
        packInt(byteBuffer, this.RegionInfo2_Field.HardMaxAgents);
        packInt(byteBuffer, this.RegionInfo2_Field.HardMaxObjects);
        byteBuffer.put((byte) this.RegionInfo3_Fields.size());
        Iterator<?> it = this.RegionInfo3_Fields.iterator();
        while (it.hasNext()) {
            packLong(byteBuffer, ((RegionInfo3) it.next()).RegionFlagsExtended);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.RegionInfoData_Field.SimName = unpackVariable(byteBuffer, 1);
        this.RegionInfoData_Field.EstateID = unpackInt(byteBuffer);
        this.RegionInfoData_Field.ParentEstateID = unpackInt(byteBuffer);
        this.RegionInfoData_Field.RegionFlags = unpackInt(byteBuffer);
        this.RegionInfoData_Field.SimAccess = unpackByte(byteBuffer) & 0xFF;
        this.RegionInfoData_Field.MaxAgents = unpackByte(byteBuffer) & 0xFF;
        this.RegionInfoData_Field.BillableFactor = unpackFloat(byteBuffer);
        this.RegionInfoData_Field.ObjectBonusFactor = unpackFloat(byteBuffer);
        this.RegionInfoData_Field.WaterHeight = unpackFloat(byteBuffer);
        this.RegionInfoData_Field.TerrainRaiseLimit = unpackFloat(byteBuffer);
        this.RegionInfoData_Field.TerrainLowerLimit = unpackFloat(byteBuffer);
        this.RegionInfoData_Field.PricePerMeter = unpackInt(byteBuffer);
        this.RegionInfoData_Field.RedirectGridX = unpackInt(byteBuffer);
        this.RegionInfoData_Field.RedirectGridY = unpackInt(byteBuffer);
        this.RegionInfoData_Field.UseEstateSun = unpackBoolean(byteBuffer);
        this.RegionInfoData_Field.SunHour = unpackFloat(byteBuffer);
        this.RegionInfo2_Field.ProductSKU = unpackVariable(byteBuffer, 1);
        this.RegionInfo2_Field.ProductName = unpackVariable(byteBuffer, 1);
        this.RegionInfo2_Field.MaxAgents32 = unpackInt(byteBuffer);
        this.RegionInfo2_Field.HardMaxAgents = unpackInt(byteBuffer);
        this.RegionInfo2_Field.HardMaxObjects = unpackInt(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            RegionInfo3 regionInfo3 = new RegionInfo3();
            regionInfo3.RegionFlagsExtended = unpackLong(byteBuffer);
            this.RegionInfo3_Fields.add(regionInfo3);
        }
    }
}
