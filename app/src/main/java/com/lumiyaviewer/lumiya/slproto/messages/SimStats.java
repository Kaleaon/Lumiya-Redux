package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;

/**
 * Simulator statistics packet (goes out to viewer and dataserver/spaceserver)
 *
 * <p>Template: {@code SimStats Low 140 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_sim_stats()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class SimStats extends SLMessage {
    public PidStat PidStat_Field;
    public Region Region_Field;
    public ArrayList<Stat> Stat_Fields = new ArrayList<>();
    public ArrayList<RegionInfo> RegionInfo_Fields = new ArrayList<>();

    /** Block PidStat, Single. */
    public static class PidStat {
        public int PID; // S32
    }

    /** Block Region, Single. */
    public static class Region {
        public int ObjectCapacity; // U32
        public int RegionFlags; // U32
        public int RegionX; // U32
        public int RegionY; // U32
    }

    /** Block RegionInfo, Variable. */
    public static class RegionInfo {
        public long RegionFlagsExtended; // U64
    }

    /** Block Stat, Variable. */
    public static class Stat {
        public int StatID; // U32
        public float StatValue; // F32
    }

    public SimStats() {
        this.zeroCoded = false;
        this.Region_Field = new Region();
        this.PidStat_Field = new PidStat();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.Stat_Fields.size() * 8) + 21 + 4 + 1 + (this.RegionInfo_Fields.size() * 8);
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleSimStats(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 140 (SimStats).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x8C);
        packInt(byteBuffer, this.Region_Field.RegionX);
        packInt(byteBuffer, this.Region_Field.RegionY);
        packInt(byteBuffer, this.Region_Field.RegionFlags);
        packInt(byteBuffer, this.Region_Field.ObjectCapacity);
        byteBuffer.put((byte) this.Stat_Fields.size());
        for (Stat stat : this.Stat_Fields) {
            packInt(byteBuffer, stat.StatID);
            packFloat(byteBuffer, stat.StatValue);
        }
        packInt(byteBuffer, this.PidStat_Field.PID);
        byteBuffer.put((byte) this.RegionInfo_Fields.size());
        Iterator<?> it = this.RegionInfo_Fields.iterator();
        while (it.hasNext()) {
            packLong(byteBuffer, ((RegionInfo) it.next()).RegionFlagsExtended);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.Region_Field.RegionX = unpackInt(byteBuffer);
        this.Region_Field.RegionY = unpackInt(byteBuffer);
        this.Region_Field.RegionFlags = unpackInt(byteBuffer);
        this.Region_Field.ObjectCapacity = unpackInt(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            Stat stat = new Stat();
            stat.StatID = unpackInt(byteBuffer);
            stat.StatValue = unpackFloat(byteBuffer);
            this.Stat_Fields.add(stat);
        }
        this.PidStat_Field.PID = unpackInt(byteBuffer);
        int i3 = byteBuffer.get() & 0xFF;
        for (int k = 0; k < i3; k++) {
            RegionInfo regionInfo = new RegionInfo();
            regionInfo.RegionFlagsExtended = unpackLong(byteBuffer);
            this.RegionInfo_Fields.add(regionInfo);
        }
    }
}
