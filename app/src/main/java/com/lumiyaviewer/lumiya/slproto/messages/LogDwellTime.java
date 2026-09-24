package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * record dwell time.
 *
 * <p>Template: {@code LogDwellTime Low 18 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class LogDwellTime extends SLMessage {
    public DwellInfo DwellInfo_Field;

    /** Block DwellInfo, Single. */
    public static class DwellInfo {
        public UUID AgentID; // LLUUID
        public int AvgAgentsInView; // U8
        public int AvgViewerFPS; // U8
        public float Duration; // F32
        public int RegionX; // U32
        public int RegionY; // U32
        public UUID SessionID; // LLUUID
        public byte[] SimName; // Variable 1
    }

    public LogDwellTime() {
        this.zeroCoded = false;
        this.DwellInfo_Field = new DwellInfo();
    }

    @Override
    public int CalcPayloadSize() {
        return this.DwellInfo_Field.SimName.length + 37 + 4 + 4 + 1 + 1 + 4;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleLogDwellTime(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 18 (LogDwellTime).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x12);
        packUUID(byteBuffer, this.DwellInfo_Field.AgentID);
        packUUID(byteBuffer, this.DwellInfo_Field.SessionID);
        packFloat(byteBuffer, this.DwellInfo_Field.Duration);
        packVariable(byteBuffer, this.DwellInfo_Field.SimName, 1);
        packInt(byteBuffer, this.DwellInfo_Field.RegionX);
        packInt(byteBuffer, this.DwellInfo_Field.RegionY);
        packByte(byteBuffer, (byte) this.DwellInfo_Field.AvgAgentsInView);
        packByte(byteBuffer, (byte) this.DwellInfo_Field.AvgViewerFPS);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.DwellInfo_Field.AgentID = unpackUUID(byteBuffer);
        this.DwellInfo_Field.SessionID = unpackUUID(byteBuffer);
        this.DwellInfo_Field.Duration = unpackFloat(byteBuffer);
        this.DwellInfo_Field.SimName = unpackVariable(byteBuffer, 1);
        this.DwellInfo_Field.RegionX = unpackInt(byteBuffer);
        this.DwellInfo_Field.RegionY = unpackInt(byteBuffer);
        this.DwellInfo_Field.AvgAgentsInView = unpackByte(byteBuffer) & 0xFF;
        this.DwellInfo_Field.AvgViewerFPS = unpackByte(byteBuffer) & 0xFF;
    }
}
