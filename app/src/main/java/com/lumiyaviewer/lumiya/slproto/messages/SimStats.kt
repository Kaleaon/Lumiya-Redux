package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList

/**
 * Simulator statistics packet (goes out to viewer and dataserver/spaceserver)
 *
 * <p>Template: {@code SimStats Low 140 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_sim_stats()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class SimStats : SLMessage() {
    @JvmField var PidStat_Field: PidStat = PidStat()
    @JvmField var Region_Field: Region = Region()
    @JvmField val Stat_Fields = ArrayList<Stat>()
    @JvmField val RegionInfo_Fields = ArrayList<RegionInfo>()

    /** Block PidStat, Single. */
    open class PidStat {
        @JvmField var PID: Int = 0
    }

    /** Block Region, Single. */
    open class Region {
        @JvmField var ObjectCapacity: Int = 0
        @JvmField var RegionFlags: Int = 0
        @JvmField var RegionX: Int = 0
        @JvmField var RegionY: Int = 0
    }

    /** Block RegionInfo, Variable. */
    open class RegionInfo {
        @JvmField var RegionFlagsExtended: Long = 0L
    }

    /** Block Stat, Variable. */
    open class Stat {
        @JvmField var StatID: Int = 0
        @JvmField var StatValue: Float = 0f
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (Stat_Fields.size * 8) + 21 + 4 + 1 + (RegionInfo_Fields.size * 8)
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleSimStats(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 140 (SimStats).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x8C).toByte())
        packInt(byteBuffer, Region_Field.RegionX)
        packInt(byteBuffer, Region_Field.RegionY)
        packInt(byteBuffer, Region_Field.RegionFlags)
        packInt(byteBuffer, Region_Field.ObjectCapacity)
        byteBuffer.put((Stat_Fields.size.toByte()))
        for (stat in Stat_Fields) {
            packInt(byteBuffer, stat.StatID)
            packFloat(byteBuffer, stat.StatValue)
        }
        packInt(byteBuffer, PidStat_Field.PID)
        byteBuffer.put((RegionInfo_Fields.size.toByte()))
        for (entry in RegionInfo_Fields) {
            packLong(byteBuffer, entry.RegionFlagsExtended)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        Region_Field.RegionX = unpackInt(byteBuffer)
        Region_Field.RegionY = unpackInt(byteBuffer)
        Region_Field.RegionFlags = unpackInt(byteBuffer)
        Region_Field.ObjectCapacity = unpackInt(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val stat = Stat()
            stat.StatID = unpackInt(byteBuffer)
            stat.StatValue = unpackFloat(byteBuffer)
            Stat_Fields.add(stat)
        }
        PidStat_Field.PID = unpackInt(byteBuffer)
        val i3 = (byteBuffer.get().toInt() and 0xFF)
        repeat(i3) {
            val regionInfo = RegionInfo()
            regionInfo.RegionFlagsExtended = unpackLong(byteBuffer)
            RegionInfo_Fields.add(regionInfo)
        }
    }
}
