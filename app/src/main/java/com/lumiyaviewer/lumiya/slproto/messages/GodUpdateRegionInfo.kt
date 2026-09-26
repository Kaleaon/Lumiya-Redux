package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

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
open class GodUpdateRegionInfo : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val RegionInfo2_Fields = ArrayList<RegionInfo2>()
    @JvmField var RegionInfo_Field: RegionInfo = RegionInfo()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block RegionInfo, Single. */
    open class RegionInfo {
        @JvmField var BillableFactor: Float = 0f
        @JvmField var EstateID: Int = 0
        @JvmField var ParentEstateID: Int = 0
        @JvmField var PricePerMeter: Int = 0
        @JvmField var RedirectGridX: Int = 0
        @JvmField var RedirectGridY: Int = 0
        @JvmField var RegionFlags: Int = 0
        @JvmField var SimName: ByteArray? = null
    }

    /** Block RegionInfo2, Variable. */
    open class RegionInfo2 {
        @JvmField var RegionFlagsExtended: Long = 0L
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return RegionInfo_Field.SimName!!.size + 1 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 36 + 1 + (RegionInfo2_Fields.size * 8)
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleGodUpdateRegionInfo(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 143 (GodUpdateRegionInfo).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x8F).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packVariable(byteBuffer, RegionInfo_Field.SimName, 1)
        packInt(byteBuffer, RegionInfo_Field.EstateID)
        packInt(byteBuffer, RegionInfo_Field.ParentEstateID)
        packInt(byteBuffer, RegionInfo_Field.RegionFlags)
        packFloat(byteBuffer, RegionInfo_Field.BillableFactor)
        packInt(byteBuffer, RegionInfo_Field.PricePerMeter)
        packInt(byteBuffer, RegionInfo_Field.RedirectGridX)
        packInt(byteBuffer, RegionInfo_Field.RedirectGridY)
        byteBuffer.put((RegionInfo2_Fields.size.toByte()))
        for (entry in RegionInfo2_Fields) {
            packLong(byteBuffer, entry.RegionFlagsExtended)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        RegionInfo_Field.SimName = unpackVariable(byteBuffer, 1)
        RegionInfo_Field.EstateID = unpackInt(byteBuffer)
        RegionInfo_Field.ParentEstateID = unpackInt(byteBuffer)
        RegionInfo_Field.RegionFlags = unpackInt(byteBuffer)
        RegionInfo_Field.BillableFactor = unpackFloat(byteBuffer)
        RegionInfo_Field.PricePerMeter = unpackInt(byteBuffer)
        RegionInfo_Field.RedirectGridX = unpackInt(byteBuffer)
        RegionInfo_Field.RedirectGridY = unpackInt(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val regionInfo2 = RegionInfo2()
            regionInfo2.RegionFlagsExtended = unpackLong(byteBuffer)
            RegionInfo2_Fields.add(regionInfo2)
        }
    }
}
