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
    @JvmField var RegionInfo2_Field: RegionInfo2 = RegionInfo2()
    @JvmField var RegionInfo3_Field: RegionInfo3 = RegionInfo3()
    @JvmField val RegionInfo4_Fields = ArrayList<RegionInfo4>()
    @JvmField var RegionInfo_Field: RegionInfo = RegionInfo()

    /** Block RegionInfo, Single. */
    open class RegionInfo {
        @JvmField var BillableFactor: Float = 0f // F32
        @JvmField var CacheID: UUID? = null // LLUUID
        @JvmField var IsEstateManager: Boolean = false // BOOL - this agent, for this sim
        @JvmField var RegionFlags: Int = 0 // U32
        @JvmField var SimAccess: Int = 0 // U8
        @JvmField var SimName: ByteArray? = null // Variable 1 - string
        @JvmField var SimOwner: UUID? = null // LLUUID
        @JvmField var TerrainBase0: UUID? = null // LLUUID
        @JvmField var TerrainBase1: UUID? = null // LLUUID
        @JvmField var TerrainBase2: UUID? = null // LLUUID
        @JvmField var TerrainBase3: UUID? = null // LLUUID
        @JvmField var TerrainDetail0: UUID? = null // LLUUID
        @JvmField var TerrainDetail1: UUID? = null // LLUUID
        @JvmField var TerrainDetail2: UUID? = null // LLUUID
        @JvmField var TerrainDetail3: UUID? = null // LLUUID
        @JvmField var TerrainHeightRange00: Float = 0f // F32
        @JvmField var TerrainHeightRange01: Float = 0f // F32
        @JvmField var TerrainHeightRange10: Float = 0f // F32
        @JvmField var TerrainHeightRange11: Float = 0f // F32
        @JvmField var TerrainStartHeight00: Float = 0f // F32
        @JvmField var TerrainStartHeight01: Float = 0f // F32
        @JvmField var TerrainStartHeight10: Float = 0f // F32
        @JvmField var TerrainStartHeight11: Float = 0f // F32
        @JvmField var WaterHeight: Float = 0f // F32
    }

    /** Block RegionInfo2, Single. */
    open class RegionInfo2 {
        @JvmField var RegionID: UUID? = null // LLUUID
    }

    /** Block RegionInfo3, Single. */
    open class RegionInfo3 {
        @JvmField var CPUClassID: Int = 0 // S32
        @JvmField var CPURatio: Int = 0 // S32
        @JvmField var ColoName: ByteArray? = null // Variable 1 - string
        @JvmField var ProductName: ByteArray? = null // Variable 1 - string
        @JvmField var ProductSKU: ByteArray? = null // Variable 1 - string
    }

    /** Block RegionInfo4, Variable. */
    open class RegionInfo4 {
        @JvmField var RegionFlagsExtended: Long = 0L // U64
        @JvmField var RegionProtocols: Long = 0L // U64
    }

    init {
        this.zeroCoded = true
        this.RegionInfo_Field = RegionInfo()
        this.RegionInfo2_Field = RegionInfo2()
        this.RegionInfo3_Field = RegionInfo3()
    }

    override fun CalcPayloadSize(): Int {
        return this.RegionInfo_Field.SimName.size + 6 + 16 + 1 + 4 + 4 + 16 + 16 + 16 + 16 + 16 + 16 + 16 + 16 + 16 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 16 + this.RegionInfo3_Field.ColoName.size + 9 + 1 + this.RegionInfo3_Field.ProductSKU.size + 1 + this.RegionInfo3_Field.ProductName.size + 1 + (this.RegionInfo4_Fields.size * 16)
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRegionHandshake(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 148 (RegionHandshake).
        byteBuffer.putShort((short) 0xFFFF)
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x94).toByte())
        packInt(byteBuffer, this.RegionInfo_Field.RegionFlags)
        packByte(byteBuffer, (this.RegionInfo_Field.SimAccess).toByte())
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
        byteBuffer.put((this.RegionInfo4_Fields.size).toByte())
        for (regionInfo4 in this.RegionInfo4_Fields) {
            packLong(byteBuffer, regionInfo4.RegionFlagsExtended)
            packLong(byteBuffer, regionInfo4.RegionProtocols)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        this.RegionInfo_Field.RegionFlags = unpackInt(byteBuffer)
        this.RegionInfo_Field.SimAccess = unpackByte(byteBuffer) & 0xFF
        this.RegionInfo_Field.SimName = unpackVariable(byteBuffer, 1)
        this.RegionInfo_Field.SimOwner = unpackUUID(byteBuffer)
        this.RegionInfo_Field.IsEstateManager = unpackBoolean(byteBuffer)
        this.RegionInfo_Field.WaterHeight = unpackFloat(byteBuffer)
        this.RegionInfo_Field.BillableFactor = unpackFloat(byteBuffer)
        this.RegionInfo_Field.CacheID = unpackUUID(byteBuffer)
        this.RegionInfo_Field.TerrainBase0 = unpackUUID(byteBuffer)
        this.RegionInfo_Field.TerrainBase1 = unpackUUID(byteBuffer)
        this.RegionInfo_Field.TerrainBase2 = unpackUUID(byteBuffer)
        this.RegionInfo_Field.TerrainBase3 = unpackUUID(byteBuffer)
        this.RegionInfo_Field.TerrainDetail0 = unpackUUID(byteBuffer)
        this.RegionInfo_Field.TerrainDetail1 = unpackUUID(byteBuffer)
        this.RegionInfo_Field.TerrainDetail2 = unpackUUID(byteBuffer)
        this.RegionInfo_Field.TerrainDetail3 = unpackUUID(byteBuffer)
        this.RegionInfo_Field.TerrainStartHeight00 = unpackFloat(byteBuffer)
        this.RegionInfo_Field.TerrainStartHeight01 = unpackFloat(byteBuffer)
        this.RegionInfo_Field.TerrainStartHeight10 = unpackFloat(byteBuffer)
        this.RegionInfo_Field.TerrainStartHeight11 = unpackFloat(byteBuffer)
        this.RegionInfo_Field.TerrainHeightRange00 = unpackFloat(byteBuffer)
        this.RegionInfo_Field.TerrainHeightRange01 = unpackFloat(byteBuffer)
        this.RegionInfo_Field.TerrainHeightRange10 = unpackFloat(byteBuffer)
        this.RegionInfo_Field.TerrainHeightRange11 = unpackFloat(byteBuffer)
        this.RegionInfo2_Field.RegionID = unpackUUID(byteBuffer)
        this.RegionInfo3_Field.CPUClassID = unpackInt(byteBuffer)
        this.RegionInfo3_Field.CPURatio = unpackInt(byteBuffer)
        this.RegionInfo3_Field.ColoName = unpackVariable(byteBuffer, 1)
        this.RegionInfo3_Field.ProductSKU = unpackVariable(byteBuffer, 1)
        this.RegionInfo3_Field.ProductName = unpackVariable(byteBuffer, 1)
        val i = byteBuffer.get().toInt() and 0xFF
        repeat(i) {
            val regionInfo4 = RegionInfo4()
            regionInfo4.RegionFlagsExtended = unpackLong(byteBuffer)
            regionInfo4.RegionProtocols = unpackLong(byteBuffer)
            this.RegionInfo4_Fields.add(regionInfo4)
        }
    }
}
