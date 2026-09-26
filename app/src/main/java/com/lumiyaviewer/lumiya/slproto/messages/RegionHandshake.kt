package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

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
open class RegionHandshake : SLMessage() {
    var RegionInfo2_Field: RegionInfo2 = null
    var RegionInfo3_Field: RegionInfo3 = null
    var RegionInfo4_Fields: ArrayList<RegionInfo4> = ArrayList<>()
    var RegionInfo_Field: RegionInfo = null

    /** Block RegionInfo, Single. */
    open class RegionInfo {
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
    open class RegionInfo2 {
        public UUID RegionID; // LLUUID
    }

    /** Block RegionInfo3, Single. */
    open class RegionInfo3 {
        public int CPUClassID; // S32
        public int CPURatio; // S32
        public byte[] ColoName; // Variable 1 - string
        public byte[] ProductName; // Variable 1 - string
        public byte[] ProductSKU; // Variable 1 - string
    }

    /** Block RegionInfo4, Variable. */
    open class RegionInfo4 {
        public long RegionFlagsExtended; // U64
        public long RegionProtocols; // U64
    }

    constructor() {
        this.zeroCoded = true
        this.RegionInfo_Field = RegionInfo()
        this.RegionInfo2_Field = RegionInfo2()
        this.RegionInfo3_Field = RegionInfo3()
    }
    fun CalcPayloadSize(): Int {
        return this.RegionInfo_Field.SimName.length + 6 + 16 + 1 + 4 + 4 + 16 + 16 + 16 + 16 + 16 + 16 + 16 + 16 + 16 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 16 + this.RegionInfo3_Field.ColoName.length + 9 + 1 + this.RegionInfo3_Field.ProductSKU.length + 1 + this.RegionInfo3_Field.ProductName.length + 1 + (this.RegionInfo4_Fields.size() * 16)
    }
    fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRegionHandshake(this)
    }
    fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 148 (RegionHandshake).
        byteBuffer.putShort(0xFFFF as short)
        byteBuffer.put(0x00 as byte)
        byteBuffer.put(0x94 as byte)
        packInt(byteBuffer, this.RegionInfo_Field.RegionFlags)
        packByte(byteBuffer, this as byte.RegionInfo_Field.SimAccess)
        packVariable(byteBuffer, this.RegionInfo_Field.SimName, 1)
        packUUID(byteBuffer, this.RegionInfo_Field.SimOwner)
        packBoolean(byteBuffer, this.RegionInfo_Field.IsEstateManager)
        packFloat(byteBuffer, this.RegionInfo_Field.WaterHeight)
        packFloat(byteBuffer, this.RegionInfo_Field.BillableFactor)
        packUUID(byteBuffer, this.RegionInfo_Field.CacheID)
        packUUID(byteBuffer, this.RegionInfo_Field.TerrainBase0)
        packUUID(byteBuffer, this.RegionInfo_Field.TerrainBase1)
        packUUID(byteBuffer, this.RegionInfo_Field.TerrainBase2)
        packUUID(byteBuffer, this.RegionInfo_Field.TerrainBase3)
        packUUID(byteBuffer, this.RegionInfo_Field.TerrainDetail0)
        packUUID(byteBuffer, this.RegionInfo_Field.TerrainDetail1)
        packUUID(byteBuffer, this.RegionInfo_Field.TerrainDetail2)
        packUUID(byteBuffer, this.RegionInfo_Field.TerrainDetail3)
        packFloat(byteBuffer, this.RegionInfo_Field.TerrainStartHeight00)
        packFloat(byteBuffer, this.RegionInfo_Field.TerrainStartHeight01)
        packFloat(byteBuffer, this.RegionInfo_Field.TerrainStartHeight10)
        packFloat(byteBuffer, this.RegionInfo_Field.TerrainStartHeight11)
        packFloat(byteBuffer, this.RegionInfo_Field.TerrainHeightRange00)
        packFloat(byteBuffer, this.RegionInfo_Field.TerrainHeightRange01)
        packFloat(byteBuffer, this.RegionInfo_Field.TerrainHeightRange10)
        packFloat(byteBuffer, this.RegionInfo_Field.TerrainHeightRange11)
        packUUID(byteBuffer, this.RegionInfo2_Field.RegionID)
        packInt(byteBuffer, this.RegionInfo3_Field.CPUClassID)
        packInt(byteBuffer, this.RegionInfo3_Field.CPURatio)
        packVariable(byteBuffer, this.RegionInfo3_Field.ColoName, 1)
        packVariable(byteBuffer, this.RegionInfo3_Field.ProductSKU, 1)
        packVariable(byteBuffer, this.RegionInfo3_Field.ProductName, 1)
        byteBuffer.put(this as byte.RegionInfo4_Fields.size())
        for (regionInfo4 in this.RegionInfo4_Fields) {
            packLong(byteBuffer, regionInfo4.RegionFlagsExtended)
            packLong(byteBuffer, regionInfo4.RegionProtocols)
        }
    }
    fun UnpackPayload(byteBuffer: ByteBuffer) {
        this.RegionInfo_Field.RegionFlags = unpackIntthis as byteBuffer.RegionInfo_Field.SimAccess = unpackByte(byteBuffer) & 0xFF
        this.RegionInfo_Field.SimName = unpackVariable(byteBuffer, 1)
        this.RegionInfo_Field.SimOwner = unpackUUIDthis as byteBuffer.RegionInfo_Field.IsEstateManager = unpackBooleanthis as byteBuffer.RegionInfo_Field.WaterHeight = unpackFloatthis as byteBuffer.RegionInfo_Field.BillableFactor = unpackFloatthis as byteBuffer.RegionInfo_Field.CacheID = unpackUUIDthis as byteBuffer.RegionInfo_Field.TerrainBase0 = unpackUUIDthis as byteBuffer.RegionInfo_Field.TerrainBase1 = unpackUUIDthis as byteBuffer.RegionInfo_Field.TerrainBase2 = unpackUUIDthis as byteBuffer.RegionInfo_Field.TerrainBase3 = unpackUUIDthis as byteBuffer.RegionInfo_Field.TerrainDetail0 = unpackUUIDthis as byteBuffer.RegionInfo_Field.TerrainDetail1 = unpackUUIDthis as byteBuffer.RegionInfo_Field.TerrainDetail2 = unpackUUIDthis as byteBuffer.RegionInfo_Field.TerrainDetail3 = unpackUUIDthis as byteBuffer.RegionInfo_Field.TerrainStartHeight00 = unpackFloatthis as byteBuffer.RegionInfo_Field.TerrainStartHeight01 = unpackFloatthis as byteBuffer.RegionInfo_Field.TerrainStartHeight10 = unpackFloatthis as byteBuffer.RegionInfo_Field.TerrainStartHeight11 = unpackFloatthis as byteBuffer.RegionInfo_Field.TerrainHeightRange00 = unpackFloatthis as byteBuffer.RegionInfo_Field.TerrainHeightRange01 = unpackFloatthis as byteBuffer.RegionInfo_Field.TerrainHeightRange10 = unpackFloatthis as byteBuffer.RegionInfo_Field.TerrainHeightRange11 = unpackFloatthis as byteBuffer.RegionInfo2_Field.RegionID = unpackUUIDthis as byteBuffer.RegionInfo3_Field.CPUClassID = unpackIntthis as byteBuffer.RegionInfo3_Field.CPURatio = unpackIntthis as byteBuffer.RegionInfo3_Field.ColoName = unpackVariable(byteBuffer, 1)
        this.RegionInfo3_Field.ProductSKU = unpackVariable(byteBuffer, 1)
        this.RegionInfo3_Field.ProductName = unpackVariable(byteBuffer, 1)
        var i: Int = byteBuffer.get() & 0xFF
        for (int j = 0; j < i; j++) {
            var regionInfo4: RegionInfo4 = RegionInfo4()
            regionInfo4.RegionFlagsExtended = unpackLongregionInfo4 as byteBuffer.RegionProtocols = unpackLongthis as byteBuffer.RegionInfo4_Fields.add(regionInfo4)
        }
    }
}
