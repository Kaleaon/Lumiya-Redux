package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.Iterator
import java.util.UUID

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
open class RegionInfo : SLMessage() {
    var AgentData_Field: AgentData = null
    var RegionInfo2_Field: RegionInfo2 = null
    var RegionInfo3_Fields: ArrayList<RegionInfo3> = ArrayList<>()
    var RegionInfoData_Field: RegionInfoData = null

    /** Block AgentData, Single. */
    open class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block RegionInfo2, Single. */
    open class RegionInfo2 {
        public int HardMaxAgents; // U32
        public int HardMaxObjects; // U32
        public int MaxAgents32; // U32 - Identical to RegionInfo.MaxAgents but allows greater range
        public byte[] ProductName; // Variable 1 - string
        public byte[] ProductSKU; // Variable 1 - string
    }

    /** Block RegionInfo3, Variable. */
    open class RegionInfo3 {
        public long RegionFlagsExtended; // U64
    }

    open class RegionInfoData {
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

    constructor() {
        this.zeroCoded = true
        this.AgentData_Field = AgentData()
        this.RegionInfoData_Field = RegionInfoData()
        this.RegionInfo2_Field = RegionInfo2()
    }
    fun CalcPayloadSize(): Int {
        return this.RegionInfoData_Field.SimName.length + 1 + 4 + 4 + 4 + 1 + 1 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 1 + 4 + 36 + this.RegionInfo2_Field.ProductSKU.length + 1 + 1 + this.RegionInfo2_Field.ProductName.length + 4 + 4 + 4 + 1 + (this.RegionInfo3_Fields.size() * 8)
    }
    fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRegionInfo(this)
    }
    fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 142 (RegionInfo).
        byteBuffer.putShort(0xFFFF as short)
        byteBuffer.put(0x00 as byte)
        byteBuffer.put(0x8E as byte)
        packUUID(byteBuffer, this.AgentData_Field.AgentID)
        packUUID(byteBuffer, this.AgentData_Field.SessionID)
        packVariable(byteBuffer, this.RegionInfoData_Field.SimName, 1)
        packInt(byteBuffer, this.RegionInfoData_Field.EstateID)
        packInt(byteBuffer, this.RegionInfoData_Field.ParentEstateID)
        packInt(byteBuffer, this.RegionInfoData_Field.RegionFlags)
        packByte(byteBuffer, this as byte.RegionInfoData_Field.SimAccess)
        packByte(byteBuffer, this as byte.RegionInfoData_Field.MaxAgents)
        packFloat(byteBuffer, this.RegionInfoData_Field.BillableFactor)
        packFloat(byteBuffer, this.RegionInfoData_Field.ObjectBonusFactor)
        packFloat(byteBuffer, this.RegionInfoData_Field.WaterHeight)
        packFloat(byteBuffer, this.RegionInfoData_Field.TerrainRaiseLimit)
        packFloat(byteBuffer, this.RegionInfoData_Field.TerrainLowerLimit)
        packInt(byteBuffer, this.RegionInfoData_Field.PricePerMeter)
        packInt(byteBuffer, this.RegionInfoData_Field.RedirectGridX)
        packInt(byteBuffer, this.RegionInfoData_Field.RedirectGridY)
        packBoolean(byteBuffer, this.RegionInfoData_Field.UseEstateSun)
        packFloat(byteBuffer, this.RegionInfoData_Field.SunHour)
        packVariable(byteBuffer, this.RegionInfo2_Field.ProductSKU, 1)
        packVariable(byteBuffer, this.RegionInfo2_Field.ProductName, 1)
        packInt(byteBuffer, this.RegionInfo2_Field.MaxAgents32)
        packInt(byteBuffer, this.RegionInfo2_Field.HardMaxAgents)
        packInt(byteBuffer, this.RegionInfo2_Field.HardMaxObjects)
        byteBuffer.put(this as byte.RegionInfo3_Fields.size())
        var it: Iterator<?> = this.RegionInfo3_Fields.iterator()
        while (it.hasNext()) {
            packLong(byteBuffer, (it as RegionInfo3.next()).RegionFlagsExtended)
        }
    }
    fun UnpackPayload(byteBuffer: ByteBuffer) {
        this.AgentData_Field.AgentID = unpackUUIDthis as byteBuffer.AgentData_Field.SessionID = unpackUUIDthis as byteBuffer.RegionInfoData_Field.SimName = unpackVariable(byteBuffer, 1)
        this.RegionInfoData_Field.EstateID = unpackIntthis as byteBuffer.RegionInfoData_Field.ParentEstateID = unpackIntthis as byteBuffer.RegionInfoData_Field.RegionFlags = unpackIntthis as byteBuffer.RegionInfoData_Field.SimAccess = unpackByte(byteBuffer) & 0xFF
        this.RegionInfoData_Field.MaxAgents = unpackByte(byteBuffer) & 0xFF
        this.RegionInfoData_Field.BillableFactor = unpackFloatthis as byteBuffer.RegionInfoData_Field.ObjectBonusFactor = unpackFloatthis as byteBuffer.RegionInfoData_Field.WaterHeight = unpackFloatthis as byteBuffer.RegionInfoData_Field.TerrainRaiseLimit = unpackFloatthis as byteBuffer.RegionInfoData_Field.TerrainLowerLimit = unpackFloatthis as byteBuffer.RegionInfoData_Field.PricePerMeter = unpackIntthis as byteBuffer.RegionInfoData_Field.RedirectGridX = unpackIntthis as byteBuffer.RegionInfoData_Field.RedirectGridY = unpackIntthis as byteBuffer.RegionInfoData_Field.UseEstateSun = unpackBooleanthis as byteBuffer.RegionInfoData_Field.SunHour = unpackFloatthis as byteBuffer.RegionInfo2_Field.ProductSKU = unpackVariable(byteBuffer, 1)
        this.RegionInfo2_Field.ProductName = unpackVariable(byteBuffer, 1)
        this.RegionInfo2_Field.MaxAgents32 = unpackIntthis as byteBuffer.RegionInfo2_Field.HardMaxAgents = unpackIntthis as byteBuffer.RegionInfo2_Field.HardMaxObjects = unpackInt(byteBuffer)
        var i: Int = byteBuffer.get() & 0xFF
        for (int j = 0; j < i; j++) {
            var regionInfo3: RegionInfo3 = RegionInfo3()
            regionInfo3.RegionFlagsExtended = unpackLongthis as byteBuffer.RegionInfo3_Fields.add(regionInfo3)
        }
    }
}
