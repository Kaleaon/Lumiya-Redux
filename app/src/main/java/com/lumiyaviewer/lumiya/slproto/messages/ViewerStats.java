package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.net.Inet4Address;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * end viewer to simulator section
 *
 * <p>Template: {@code ViewerStats Low 131 NotTrusted Zerocoded UDPDeprecated}
 * (recovered/reference/message_template.msg).
 */
public class ViewerStats extends SLMessage {
    public AgentData AgentData_Field;
    public DownloadTotals DownloadTotals_Field;
    public FailStats FailStats_Field;
    public NetStats[] NetStats_Fields = new NetStats[2];
    public ArrayList<MiscStats> MiscStats_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
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
    public static class DownloadTotals {
        public int Objects; // U32
        public int Textures; // U32
        public int World; // U32
    }

    /** Block FailStats, Single. */
    public static class FailStats {
        public int Dropped; // U32
        public int FailedResends; // U32
        public int Invalid; // U32
        public int OffCircuit; // U32
        public int Resent; // U32
        public int SendPacket; // U32
    }

    /** Block MiscStats, Variable. */
    public static class MiscStats {
        public int Type; // U32
        public double Value; // F64
    }

    /** Block NetStats, Multiple 2. */
    public static class NetStats {
        public int Bytes; // U32
        public int Compressed; // U32
        public int Packets; // U32
        public int Savings; // U32
    }

    public ViewerStats() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.DownloadTotals_Field = new DownloadTotals();
        for (int i = 0; i < 2; i++) {
            this.NetStats_Fields[i] = new NetStats();
        }
        this.FailStats_Field = new FailStats();
    }

    @Override
    public int CalcPayloadSize() {
        return this.AgentData_Field.SysOS.length + 74 + 1 + this.AgentData_Field.SysCPU.length + 1 + this.AgentData_Field.SysGPU.length + 4 + 12 + 32 + 24 + 1 + (this.MiscStats_Fields.size() * 12);
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleViewerStats(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 131 (ViewerStats).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x83);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packIPAddress(byteBuffer, this.AgentData_Field.IP);
        packInt(byteBuffer, this.AgentData_Field.StartTime);
        packFloat(byteBuffer, this.AgentData_Field.RunTime);
        packFloat(byteBuffer, this.AgentData_Field.SimFPS);
        packFloat(byteBuffer, this.AgentData_Field.FPS);
        packByte(byteBuffer, (byte) this.AgentData_Field.AgentsInView);
        packFloat(byteBuffer, this.AgentData_Field.Ping);
        packDouble(byteBuffer, this.AgentData_Field.MetersTraveled);
        packInt(byteBuffer, this.AgentData_Field.RegionsVisited);
        packInt(byteBuffer, this.AgentData_Field.SysRAM);
        packVariable(byteBuffer, this.AgentData_Field.SysOS, 1);
        packVariable(byteBuffer, this.AgentData_Field.SysCPU, 1);
        packVariable(byteBuffer, this.AgentData_Field.SysGPU, 1);
        packInt(byteBuffer, this.DownloadTotals_Field.World);
        packInt(byteBuffer, this.DownloadTotals_Field.Objects);
        packInt(byteBuffer, this.DownloadTotals_Field.Textures);
        for (int i = 0; i < 2; i++) {
            packInt(byteBuffer, this.NetStats_Fields[i].Bytes);
            packInt(byteBuffer, this.NetStats_Fields[i].Packets);
            packInt(byteBuffer, this.NetStats_Fields[i].Compressed);
            packInt(byteBuffer, this.NetStats_Fields[i].Savings);
        }
        packInt(byteBuffer, this.FailStats_Field.SendPacket);
        packInt(byteBuffer, this.FailStats_Field.Dropped);
        packInt(byteBuffer, this.FailStats_Field.Resent);
        packInt(byteBuffer, this.FailStats_Field.FailedResends);
        packInt(byteBuffer, this.FailStats_Field.OffCircuit);
        packInt(byteBuffer, this.FailStats_Field.Invalid);
        byteBuffer.put((byte) this.MiscStats_Fields.size());
        for (MiscStats miscStats : this.MiscStats_Fields) {
            packInt(byteBuffer, miscStats.Type);
            packDouble(byteBuffer, miscStats.Value);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.IP = unpackIPAddress(byteBuffer);
        this.AgentData_Field.StartTime = unpackInt(byteBuffer);
        this.AgentData_Field.RunTime = unpackFloat(byteBuffer);
        this.AgentData_Field.SimFPS = unpackFloat(byteBuffer);
        this.AgentData_Field.FPS = unpackFloat(byteBuffer);
        this.AgentData_Field.AgentsInView = unpackByte(byteBuffer) & 0xFF;
        this.AgentData_Field.Ping = unpackFloat(byteBuffer);
        this.AgentData_Field.MetersTraveled = unpackDouble(byteBuffer);
        this.AgentData_Field.RegionsVisited = unpackInt(byteBuffer);
        this.AgentData_Field.SysRAM = unpackInt(byteBuffer);
        this.AgentData_Field.SysOS = unpackVariable(byteBuffer, 1);
        this.AgentData_Field.SysCPU = unpackVariable(byteBuffer, 1);
        this.AgentData_Field.SysGPU = unpackVariable(byteBuffer, 1);
        this.DownloadTotals_Field.World = unpackInt(byteBuffer);
        this.DownloadTotals_Field.Objects = unpackInt(byteBuffer);
        this.DownloadTotals_Field.Textures = unpackInt(byteBuffer);
        for (int i = 0; i < 2; i++) {
            this.NetStats_Fields[i].Bytes = unpackInt(byteBuffer);
            this.NetStats_Fields[i].Packets = unpackInt(byteBuffer);
            this.NetStats_Fields[i].Compressed = unpackInt(byteBuffer);
            this.NetStats_Fields[i].Savings = unpackInt(byteBuffer);
        }
        this.FailStats_Field.SendPacket = unpackInt(byteBuffer);
        this.FailStats_Field.Dropped = unpackInt(byteBuffer);
        this.FailStats_Field.Resent = unpackInt(byteBuffer);
        this.FailStats_Field.FailedResends = unpackInt(byteBuffer);
        this.FailStats_Field.OffCircuit = unpackInt(byteBuffer);
        this.FailStats_Field.Invalid = unpackInt(byteBuffer);
        int i2 = byteBuffer.get() & 0xFF;
        for (int i3 = 0; i3 < i2; i3++) {
            MiscStats miscStats = new MiscStats();
            miscStats.Type = unpackInt(byteBuffer);
            miscStats.Value = unpackDouble(byteBuffer);
            this.MiscStats_Fields.add(miscStats);
        }
    }
}
