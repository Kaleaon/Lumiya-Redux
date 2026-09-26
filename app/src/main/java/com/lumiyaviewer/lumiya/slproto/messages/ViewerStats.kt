package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.net.Inet4Address
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * end viewer to simulator section
 *
 * <p>Template: {@code ViewerStats Low 131 NotTrusted Zerocoded UDPDeprecated}
 * (recovered/reference/message_template.msg).
 */
open class ViewerStats : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var DownloadTotals_Field: DownloadTotals = DownloadTotals()
    @JvmField var FailStats_Field: FailStats = FailStats()
    @JvmField val NetStats_Fields = Array(2) { NetStats() }
    @JvmField val MiscStats_Fields = ArrayList<MiscStats>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null // LLUUID
        @JvmField var AgentsInView: Int = 0 // U8
        @JvmField var FPS: Float = 0f // F32
        @JvmField var IP: Inet4Address? = null // IPADDR
        @JvmField var MetersTraveled: Double = 0.0 // F64
        @JvmField var Ping: Float = 0f // F32
        @JvmField var RegionsVisited: Int = 0 // S32
        @JvmField var RunTime: Float = 0f // F32
        @JvmField var SessionID: UUID? = null // LLUUID
        @JvmField var SimFPS: Float = 0f // F32
        @JvmField var StartTime: Int = 0 // U32
        @JvmField var SysCPU: ByteArray? = null // Variable 1 - String
        @JvmField var SysGPU: ByteArray? = null // Variable 1 - String
        @JvmField var SysOS: ByteArray? = null // Variable 1 - String
        @JvmField var SysRAM: Int = 0 // U32
    }

    /** Block DownloadTotals, Single. */
    open class DownloadTotals {
        @JvmField var Objects: Int = 0 // U32
        @JvmField var Textures: Int = 0 // U32
        @JvmField var World: Int = 0 // U32
    }

    /** Block FailStats, Single. */
    open class FailStats {
        @JvmField var Dropped: Int = 0 // U32
        @JvmField var FailedResends: Int = 0 // U32
        @JvmField var Invalid: Int = 0 // U32
        @JvmField var OffCircuit: Int = 0 // U32
        @JvmField var Resent: Int = 0 // U32
        @JvmField var SendPacket: Int = 0 // U32
    }

    /** Block MiscStats, Variable. */
    open class MiscStats {
        @JvmField var Type: Int = 0 // U32
        @JvmField var Value: Double = 0.0 // F64
    }

    /** Block NetStats, Multiple 2. */
    open class NetStats {
        @JvmField var Bytes: Int = 0 // U32
        @JvmField var Compressed: Int = 0 // U32
        @JvmField var Packets: Int = 0 // U32
        @JvmField var Savings: Int = 0 // U32
    }

    init {
        this.zeroCoded = true
        this.AgentData_Field = AgentData()
        this.DownloadTotals_Field = DownloadTotals()
        this.FailStats_Field = FailStats()
    }

    override fun CalcPayloadSize(): Int {
        return this.AgentData_Field.SysOS.size + 74 + 1 + this.AgentData_Field.SysCPU.size + 1 + this.AgentData_Field.SysGPU.size + 4 + 12 + 32 + 24 + 1 + (this.MiscStats_Fields.size * 12)
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleViewerStats(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 131 (ViewerStats).
        byteBuffer.putShort((short) 0xFFFF)
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x83).toByte())
        packUUID(byteBuffer, this.AgentData_Field.AgentID)
        packUUID(byteBuffer, this.AgentData_Field.SessionID)
        packIPAddress(byteBuffer, this.AgentData_Field.IP)
        packInt(byteBuffer, this.AgentData_Field.StartTime)
        packFloat(byteBuffer, this.AgentData_Field.RunTime)
        packFloat(byteBuffer, this.AgentData_Field.SimFPS)
        packFloat(byteBuffer, this.AgentData_Field.FPS)
        packByte(byteBuffer, (this.AgentData_Field.AgentsInView).toByte())
        packFloat(byteBuffer, this.AgentData_Field.Ping)
        packDouble(byteBuffer, this.AgentData_Field.MetersTraveled)
        packInt(byteBuffer, this.AgentData_Field.RegionsVisited)
        packInt(byteBuffer, this.AgentData_Field.SysRAM)
        packVariable(byteBuffer, this.AgentData_Field.SysOS, 1)
        packVariable(byteBuffer, this.AgentData_Field.SysCPU, 1)
        packVariable(byteBuffer, this.AgentData_Field.SysGPU, 1)
        packInt(byteBuffer, this.DownloadTotals_Field.World)
        packInt(byteBuffer, this.DownloadTotals_Field.Objects)
        packInt(byteBuffer, this.DownloadTotals_Field.Textures)
        for (int i = 0; i < 2; i++) {
            packInt(byteBuffer, this.NetStats_Fields[i].Bytes)
            packInt(byteBuffer, this.NetStats_Fields[i].Packets)
            packInt(byteBuffer, this.NetStats_Fields[i].Compressed)
            packInt(byteBuffer, this.NetStats_Fields[i].Savings)
        }
        packInt(byteBuffer, this.FailStats_Field.SendPacket)
        packInt(byteBuffer, this.FailStats_Field.Dropped)
        packInt(byteBuffer, this.FailStats_Field.Resent)
        packInt(byteBuffer, this.FailStats_Field.FailedResends)
        packInt(byteBuffer, this.FailStats_Field.OffCircuit)
        packInt(byteBuffer, this.FailStats_Field.Invalid)
        byteBuffer.put((this.MiscStats_Fields.size).toByte())
        for (miscStats in this.MiscStats_Fields) {
            packInt(byteBuffer, miscStats.Type)
            packDouble(byteBuffer, miscStats.Value)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer)
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer)
        this.AgentData_Field.IP = unpackIPAddress(byteBuffer)
        this.AgentData_Field.StartTime = unpackInt(byteBuffer)
        this.AgentData_Field.RunTime = unpackFloat(byteBuffer)
        this.AgentData_Field.SimFPS = unpackFloat(byteBuffer)
        this.AgentData_Field.FPS = unpackFloat(byteBuffer)
        this.AgentData_Field.AgentsInView = unpackByte(byteBuffer) & 0xFF
        this.AgentData_Field.Ping = unpackFloat(byteBuffer)
        this.AgentData_Field.MetersTraveled = unpackDouble(byteBuffer)
        this.AgentData_Field.RegionsVisited = unpackInt(byteBuffer)
        this.AgentData_Field.SysRAM = unpackInt(byteBuffer)
        this.AgentData_Field.SysOS = unpackVariable(byteBuffer, 1)
        this.AgentData_Field.SysCPU = unpackVariable(byteBuffer, 1)
        this.AgentData_Field.SysGPU = unpackVariable(byteBuffer, 1)
        this.DownloadTotals_Field.World = unpackInt(byteBuffer)
        this.DownloadTotals_Field.Objects = unpackInt(byteBuffer)
        this.DownloadTotals_Field.Textures = unpackInt(byteBuffer)
        for (int i = 0; i < 2; i++) {
            this.NetStats_Fields[i].Bytes = unpackInt(byteBuffer)
            this.NetStats_Fields[i].Packets = unpackInt(byteBuffer)
            this.NetStats_Fields[i].Compressed = unpackInt(byteBuffer)
            this.NetStats_Fields[i].Savings = unpackInt(byteBuffer)
        }
        this.FailStats_Field.SendPacket = unpackInt(byteBuffer)
        this.FailStats_Field.Dropped = unpackInt(byteBuffer)
        this.FailStats_Field.Resent = unpackInt(byteBuffer)
        this.FailStats_Field.FailedResends = unpackInt(byteBuffer)
        this.FailStats_Field.OffCircuit = unpackInt(byteBuffer)
        this.FailStats_Field.Invalid = unpackInt(byteBuffer)
        val i2 = byteBuffer.get().toInt() and 0xFF
        repeat(i2) {
            val miscStats = MiscStats()
            miscStats.Type = unpackInt(byteBuffer)
            miscStats.Value = unpackDouble(byteBuffer)
            this.MiscStats_Fields.add(miscStats)
        }
    }
}

