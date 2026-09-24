package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * RegionHandshake
 * Sent by region to viewer after it has received UseCircuitCode
 * from that viewer.
 * sim -> viewer
 * reliable
 *
 * <p>Template: {@code RegionHandshake Low 148 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_region_handshake()} in indra/newview/llworld.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class RegionHandshake extends SLMessage {
    public RegionInfo2 RegionInfo2_Field;
    public RegionInfo3 RegionInfo3_Field;
    public ArrayList<RegionInfo4> RegionInfo4_Fields = new ArrayList<>();
    public RegionInfo RegionInfo_Field;

    /** Block RegionInfo, Single. */
    public static class RegionInfo {
        public float BillableFactor; // F32
        public UUID CacheID; // LLUUID
        public boolean IsEstateManager; // BOOL - this agent, for this sim
        public int RegionFlags; // U32
        public int SimAccess; // U8
        public byte[] SimName; // Variable 1 - string
        public UUID SimOwner; // LLUUID
        public UUID TerrainBase0; // LLUUID
        public UUID TerrainBase1; // LLUUID
        public UUID TerrainBase2; // LLUUID
        public UUID TerrainBase3; // LLUUID
        public UUID TerrainDetail0; // LLUUID
        public UUID TerrainDetail1; // LLUUID
        public UUID TerrainDetail2; // LLUUID
        public UUID TerrainDetail3; // LLUUID
        public float TerrainHeightRange00; // F32
        public float TerrainHeightRange01; // F32
        public float TerrainHeightRange10; // F32
        public float TerrainHeightRange11; // F32
        public float TerrainStartHeight00; // F32
        public float TerrainStartHeight01; // F32
        public float TerrainStartHeight10; // F32
        public float TerrainStartHeight11; // F32
        public float WaterHeight; // F32
    }

    /** Block RegionInfo2, Single. */
    public static class RegionInfo2 {
        public UUID RegionID; // LLUUID
    }

    /** Block RegionInfo3, Single. */
    public static class RegionInfo3 {
        public int CPUClassID; // S32
        public int CPURatio; // S32
        public byte[] ColoName; // Variable 1 - string
        public byte[] ProductName; // Variable 1 - string
        public byte[] ProductSKU; // Variable 1 - string
    }

    /** Block RegionInfo4, Variable. */
    public static class RegionInfo4 {
        public long RegionFlagsExtended; // U64
        public long RegionProtocols; // U64
    }

    public RegionHandshake() {
        this.zeroCoded = true;
        this.RegionInfo_Field = new RegionInfo();
        this.RegionInfo2_Field = new RegionInfo2();
        this.RegionInfo3_Field = new RegionInfo3();
    }

    @Override
    public int CalcPayloadSize() {
        return this.RegionInfo_Field.SimName.length + 6 + 16 + 1 + 4 + 4 + 16 + 16 + 16 + 16 + 16 + 16 + 16 + 16 + 16 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 16 + this.RegionInfo3_Field.ColoName.length + 9 + 1 + this.RegionInfo3_Field.ProductSKU.length + 1 + this.RegionInfo3_Field.ProductName.length + 1 + (this.RegionInfo4_Fields.size() * 16);
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleRegionHandshake(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 148 (RegionHandshake).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x94);
        packInt(byteBuffer, this.RegionInfo_Field.RegionFlags);
        packByte(byteBuffer, (byte) this.RegionInfo_Field.SimAccess);
        packVariable(byteBuffer, this.RegionInfo_Field.SimName, 1);
        packUUID(byteBuffer, this.RegionInfo_Field.SimOwner);
        packBoolean(byteBuffer, this.RegionInfo_Field.IsEstateManager);
        packFloat(byteBuffer, this.RegionInfo_Field.WaterHeight);
        packFloat(byteBuffer, this.RegionInfo_Field.BillableFactor);
        packUUID(byteBuffer, this.RegionInfo_Field.CacheID);
        packUUID(byteBuffer, this.RegionInfo_Field.TerrainBase0);
        packUUID(byteBuffer, this.RegionInfo_Field.TerrainBase1);
        packUUID(byteBuffer, this.RegionInfo_Field.TerrainBase2);
        packUUID(byteBuffer, this.RegionInfo_Field.TerrainBase3);
        packUUID(byteBuffer, this.RegionInfo_Field.TerrainDetail0);
        packUUID(byteBuffer, this.RegionInfo_Field.TerrainDetail1);
        packUUID(byteBuffer, this.RegionInfo_Field.TerrainDetail2);
        packUUID(byteBuffer, this.RegionInfo_Field.TerrainDetail3);
        packFloat(byteBuffer, this.RegionInfo_Field.TerrainStartHeight00);
        packFloat(byteBuffer, this.RegionInfo_Field.TerrainStartHeight01);
        packFloat(byteBuffer, this.RegionInfo_Field.TerrainStartHeight10);
        packFloat(byteBuffer, this.RegionInfo_Field.TerrainStartHeight11);
        packFloat(byteBuffer, this.RegionInfo_Field.TerrainHeightRange00);
        packFloat(byteBuffer, this.RegionInfo_Field.TerrainHeightRange01);
        packFloat(byteBuffer, this.RegionInfo_Field.TerrainHeightRange10);
        packFloat(byteBuffer, this.RegionInfo_Field.TerrainHeightRange11);
        packUUID(byteBuffer, this.RegionInfo2_Field.RegionID);
        packInt(byteBuffer, this.RegionInfo3_Field.CPUClassID);
        packInt(byteBuffer, this.RegionInfo3_Field.CPURatio);
        packVariable(byteBuffer, this.RegionInfo3_Field.ColoName, 1);
        packVariable(byteBuffer, this.RegionInfo3_Field.ProductSKU, 1);
        packVariable(byteBuffer, this.RegionInfo3_Field.ProductName, 1);
        byteBuffer.put((byte) this.RegionInfo4_Fields.size());
        for (RegionInfo4 regionInfo4 : this.RegionInfo4_Fields) {
            packLong(byteBuffer, regionInfo4.RegionFlagsExtended);
            packLong(byteBuffer, regionInfo4.RegionProtocols);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.RegionInfo_Field.RegionFlags = unpackInt(byteBuffer);
        this.RegionInfo_Field.SimAccess = unpackByte(byteBuffer) & 0xFF;
        this.RegionInfo_Field.SimName = unpackVariable(byteBuffer, 1);
        this.RegionInfo_Field.SimOwner = unpackUUID(byteBuffer);
        this.RegionInfo_Field.IsEstateManager = unpackBoolean(byteBuffer);
        this.RegionInfo_Field.WaterHeight = unpackFloat(byteBuffer);
        this.RegionInfo_Field.BillableFactor = unpackFloat(byteBuffer);
        this.RegionInfo_Field.CacheID = unpackUUID(byteBuffer);
        this.RegionInfo_Field.TerrainBase0 = unpackUUID(byteBuffer);
        this.RegionInfo_Field.TerrainBase1 = unpackUUID(byteBuffer);
        this.RegionInfo_Field.TerrainBase2 = unpackUUID(byteBuffer);
        this.RegionInfo_Field.TerrainBase3 = unpackUUID(byteBuffer);
        this.RegionInfo_Field.TerrainDetail0 = unpackUUID(byteBuffer);
        this.RegionInfo_Field.TerrainDetail1 = unpackUUID(byteBuffer);
        this.RegionInfo_Field.TerrainDetail2 = unpackUUID(byteBuffer);
        this.RegionInfo_Field.TerrainDetail3 = unpackUUID(byteBuffer);
        this.RegionInfo_Field.TerrainStartHeight00 = unpackFloat(byteBuffer);
        this.RegionInfo_Field.TerrainStartHeight01 = unpackFloat(byteBuffer);
        this.RegionInfo_Field.TerrainStartHeight10 = unpackFloat(byteBuffer);
        this.RegionInfo_Field.TerrainStartHeight11 = unpackFloat(byteBuffer);
        this.RegionInfo_Field.TerrainHeightRange00 = unpackFloat(byteBuffer);
        this.RegionInfo_Field.TerrainHeightRange01 = unpackFloat(byteBuffer);
        this.RegionInfo_Field.TerrainHeightRange10 = unpackFloat(byteBuffer);
        this.RegionInfo_Field.TerrainHeightRange11 = unpackFloat(byteBuffer);
        this.RegionInfo2_Field.RegionID = unpackUUID(byteBuffer);
        this.RegionInfo3_Field.CPUClassID = unpackInt(byteBuffer);
        this.RegionInfo3_Field.CPURatio = unpackInt(byteBuffer);
        this.RegionInfo3_Field.ColoName = unpackVariable(byteBuffer, 1);
        this.RegionInfo3_Field.ProductSKU = unpackVariable(byteBuffer, 1);
        this.RegionInfo3_Field.ProductName = unpackVariable(byteBuffer, 1);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            RegionInfo4 regionInfo4 = new RegionInfo4();
            regionInfo4.RegionFlagsExtended = unpackLong(byteBuffer);
            regionInfo4.RegionProtocols = unpackLong(byteBuffer);
            this.RegionInfo4_Fields.add(regionInfo4);
        }
    }
}
