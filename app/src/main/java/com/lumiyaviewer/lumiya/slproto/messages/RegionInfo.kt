package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
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
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var RegionInfo2_Field: RegionInfo2 = RegionInfo2()
    @JvmField val RegionInfo3_Fields = ArrayList<RegionInfo3>()
    @JvmField var RegionInfoData_Field: RegionInfoData = RegionInfoData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null // LLUUID
        @JvmField var SessionID: UUID? = null // LLUUID
    }

    /** Block RegionInfo2, Single. */
    open class RegionInfo2 {
        @JvmField var HardMaxAgents: Int = 0 // U32
        @JvmField var HardMaxObjects: Int = 0 // U32
        @JvmField var MaxAgents32: Int = 0 // U32 - Identical to RegionInfo.MaxAgents but allows greater range
        @JvmField var ProductName: ByteArray? = null // Variable 1 - string
        @JvmField var ProductSKU: ByteArray? = null // Variable 1 - string
    }

    /** Block RegionInfo3, Variable. */
    open class RegionInfo3 {
        @JvmField var RegionFlagsExtended: Long = 0L // U64
    }

    open class RegionInfoData {
        @JvmField var BillableFactor: Float = 0f // F32
        @JvmField var EstateID: Int = 0 // U32
        @JvmField var MaxAgents: Int = 0 // U8
        @JvmField var ObjectBonusFactor: Float = 0f // F32
        @JvmField var ParentEstateID: Int = 0 // U32
        @JvmField var PricePerMeter: Int = 0 // S32
        @JvmField var RedirectGridX: Int = 0 // S32
        @JvmField var RedirectGridY: Int = 0 // S32
        @JvmField var RegionFlags: Int = 0 // U32
        @JvmField var SimAccess: Int = 0 // U8
        @JvmField var SimName: ByteArray? = null // Variable 1 - string
        @JvmField var SunHour: Float = 0f // F32 - last value set by estate or region controls JC
        @JvmField var TerrainLowerLimit: Float = 0f // F32
        @JvmField var TerrainRaiseLimit: Float = 0f // F32
        @JvmField var UseEstateSun: Boolean = false // BOOL
        @JvmField var WaterHeight: Float = 0f // F32
    }

    init {
        this.zeroCoded = true
        this.AgentData_Field = AgentData()
        this.RegionInfoData_Field = RegionInfoData()
        this.RegionInfo2_Field = RegionInfo2()
    }

    override fun CalcPayloadSize(): Int {
        return this.RegionInfoData_Field.SimName.size + 1 + 4 + 4 + 4 + 1 + 1 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 1 + 4 + 36 + this.RegionInfo2_Field.ProductSKU.size + 1 + 1 + this.RegionInfo2_Field.ProductName.size + 4 + 4 + 4 + 1 + (this.RegionInfo3_Fields.size * 8)
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRegionInfo(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 142 (RegionInfo).
        byteBuffer.putShort((short) 0xFFFF)
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x8E).toByte())
        packUUID(byteBuffer, this.AgentData_Field.AgentID)
        packUUID(byteBuffer, this.AgentData_Field.SessionID)
        packVariable(byteBuffer, this.RegionInfoData_Field.SimName, 1)
        packInt(byteBuffer, this.RegionInfoData_Field.EstateID)
        packInt(byteBuffer, this.RegionInfoData_Field.ParentEstateID)
        packInt(byteBuffer, this.RegionInfoData_Field.RegionFlags)
        packByte(byteBuffer, (this.RegionInfoData_Field.SimAccess).toByte())
        packByte(byteBuffer, (this.RegionInfoData_Field.MaxAgents).toByte())
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
        byteBuffer.put((this.RegionInfo3_Fields.size).toByte())
        for (entry in this.RegionInfo3_Fields) {
            packLong(byteBuffer, entry.RegionFlagsExtended)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer)
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer)
        this.RegionInfoData_Field.SimName = unpackVariable(byteBuffer, 1)
        this.RegionInfoData_Field.EstateID = unpackInt(byteBuffer)
        this.RegionInfoData_Field.ParentEstateID = unpackInt(byteBuffer)
        this.RegionInfoData_Field.RegionFlags = unpackInt(byteBuffer)
        this.RegionInfoData_Field.SimAccess = unpackByte(byteBuffer) & 0xFF
        this.RegionInfoData_Field.MaxAgents = unpackByte(byteBuffer) & 0xFF
        this.RegionInfoData_Field.BillableFactor = unpackFloat(byteBuffer)
        this.RegionInfoData_Field.ObjectBonusFactor = unpackFloat(byteBuffer)
        this.RegionInfoData_Field.WaterHeight = unpackFloat(byteBuffer)
        this.RegionInfoData_Field.TerrainRaiseLimit = unpackFloat(byteBuffer)
        this.RegionInfoData_Field.TerrainLowerLimit = unpackFloat(byteBuffer)
        this.RegionInfoData_Field.PricePerMeter = unpackInt(byteBuffer)
        this.RegionInfoData_Field.RedirectGridX = unpackInt(byteBuffer)
        this.RegionInfoData_Field.RedirectGridY = unpackInt(byteBuffer)
        this.RegionInfoData_Field.UseEstateSun = unpackBoolean(byteBuffer)
        this.RegionInfoData_Field.SunHour = unpackFloat(byteBuffer)
        this.RegionInfo2_Field.ProductSKU = unpackVariable(byteBuffer, 1)
        this.RegionInfo2_Field.ProductName = unpackVariable(byteBuffer, 1)
        this.RegionInfo2_Field.MaxAgents32 = unpackInt(byteBuffer)
        this.RegionInfo2_Field.HardMaxAgents = unpackInt(byteBuffer)
        this.RegionInfo2_Field.HardMaxObjects = unpackInt(byteBuffer)
        val i = byteBuffer.get().toInt() and 0xFF
        repeat(i) {
            val regionInfo3 = RegionInfo3()
            regionInfo3.RegionFlagsExtended = unpackLong(byteBuffer)
            this.RegionInfo3_Fields.add(regionInfo3)
        }
    }
}
