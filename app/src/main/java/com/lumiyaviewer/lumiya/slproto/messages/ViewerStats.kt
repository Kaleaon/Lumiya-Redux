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
    var AgentData_Field: AgentData = null
    var DownloadTotals_Field: DownloadTotals = null
    var FailStats_Field: FailStats = null
    var NetStats_Fields: Array<NetStats> = arrayOfNulls<NetStats>(2)
    var MiscStats_Fields: ArrayList<MiscStats> = ArrayList<>()

    /** Block AgentData, Single. */
    open class AgentData {
        public UUID AgentID; // LLUUID
        public int AgentsInView; // U8
        public float FPS; // F32
        public Inet4Address IP; // IPADDR
        public double MetersTraveled; // F64
        public float Ping; // F32
        public int RegionsVisited; // S32
        public float RunTime; // F32
        public UUID SessionID; // LLUUID
        public float SimFPS; // F32
        public int StartTime; // U32
        public byte[] SysCPU; // Variable 1 - String
        public byte[] SysGPU; // Variable 1 - String
        public byte[] SysOS; // Variable 1 - String
        public int SysRAM; // U32
    }

    /** Block DownloadTotals, Single. */
    open class DownloadTotals {
        public int Objects; // U32
        public int Textures; // U32
        public int World; // U32
    }

    /** Block FailStats, Single. */
    open class FailStats {
        public int Dropped; // U32
        public int FailedResends; // U32
        public int Invalid; // U32
        public int OffCircuit; // U32
        public int Resent; // U32
        public int SendPacket; // U32
    }

    /** Block MiscStats, Variable. */
    open class MiscStats {
        public int Type; // U32
        public double Value; // F64
    }

    /** Block NetStats, Multiple 2. */
    open class NetStats {
        public int Bytes; // U32
        public int Compressed; // U32
        public int Packets; // U32
        public int Savings; // U32
    }

    constructor() {
        this.zeroCoded = true
        this.AgentData_Field = AgentData()
        this.DownloadTotals_Field = DownloadTotals()
        for (int i = 0; i < 2; i++) {
            this.NetStats_Fields[i] = NetStats()
        }
        this.FailStats_Field = FailStats()
    }
    fun CalcPayloadSize(): Int {
        return this.AgentData_Field.SysOS.length + 74 + 1 + this.AgentData_Field.SysCPU.length + 1 + this.AgentData_Field.SysGPU.length + 4 + 12 + 32 + 24 + 1 + (this.MiscStats_Fields.size() * 12)
    }
    fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleViewerStats(this)
    }
    fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 131 (ViewerStats).
        byteBuffer.putShort(0xFFFF as short)
        byteBuffer.put(0x00 as byte)
        byteBuffer.put(0x83 as byte)
        packUUID(byteBuffer, this.AgentData_Field.AgentID)
        packUUID(byteBuffer, this.AgentData_Field.SessionID)
        packIPAddress(byteBuffer, this.AgentData_Field.IP)
        packInt(byteBuffer, this.AgentData_Field.StartTime)
        packFloat(byteBuffer, this.AgentData_Field.RunTime)
        packFloat(byteBuffer, this.AgentData_Field.SimFPS)
        packFloat(byteBuffer, this.AgentData_Field.FPS)
        packByte(byteBuffer, this as byte.AgentData_Field.AgentsInView)
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
        byteBuffer.put(this as byte.MiscStats_Fields.size())
        for (miscStats in this.MiscStats_Fields) {
            packInt(byteBuffer, miscStats.Type)
            packDouble(byteBuffer, miscStats.Value)
        }
    }
    fun UnpackPayload(byteBuffer: ByteBuffer) {
        this.AgentData_Field.AgentID = unpackUUIDthis as byteBuffer.AgentData_Field.SessionID = unpackUUIDthis as byteBuffer.AgentData_Field.IP = unpackIPAddressthis as byteBuffer.AgentData_Field.StartTime = unpackIntthis as byteBuffer.AgentData_Field.RunTime = unpackFloatthis as byteBuffer.AgentData_Field.SimFPS = unpackFloatthis as byteBuffer.AgentData_Field.FPS = unpackFloatthis as byteBuffer.AgentData_Field.AgentsInView = unpackByte(byteBuffer) & 0xFF
        this.AgentData_Field.Ping = unpackFloatthis as byteBuffer.AgentData_Field.MetersTraveled = unpackDoublethis as byteBuffer.AgentData_Field.RegionsVisited = unpackIntthis as byteBuffer.AgentData_Field.SysRAM = unpackIntthis as byteBuffer.AgentData_Field.SysOS = unpackVariable(byteBuffer, 1)
        this.AgentData_Field.SysCPU = unpackVariable(byteBuffer, 1)
        this.AgentData_Field.SysGPU = unpackVariable(byteBuffer, 1)
        this.DownloadTotals_Field.World = unpackIntthis as byteBuffer.DownloadTotals_Field.Objects = unpackIntthis as byteBuffer.DownloadTotals_Field.Textures = unpackInt(byteBuffer)
        for (int i = 0; i < 2; i++) {
            this.NetStats_Fields[i].Bytes = unpackIntthis as byteBuffer.NetStats_Fields[i].Packets = unpackIntthis as byteBuffer.NetStats_Fields[i].Compressed = unpackIntthis as byteBuffer.NetStats_Fields[i].Savings = unpackInt(byteBuffer)
        }
        this.FailStats_Field.SendPacket = unpackIntthis as byteBuffer.FailStats_Field.Dropped = unpackIntthis as byteBuffer.FailStats_Field.Resent = unpackIntthis as byteBuffer.FailStats_Field.FailedResends = unpackIntthis as byteBuffer.FailStats_Field.OffCircuit = unpackIntthis as byteBuffer.FailStats_Field.Invalid = unpackInt(byteBuffer)
        var i2: Int = byteBuffer.get() & 0xFF
        for (int j = 0; j < i2; j++) {
            var miscStats: MiscStats = MiscStats()
            miscStats.Type = unpackIntmiscStats as byteBuffer.Value = unpackDoublethis as byteBuffer.MiscStats_Fields.add(miscStats)
        }
    }
}
