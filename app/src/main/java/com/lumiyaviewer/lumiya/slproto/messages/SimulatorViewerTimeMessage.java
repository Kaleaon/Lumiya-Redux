package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;

/**
 * SimulatorViewerTimeMessage - Allows viewer to resynch to world time
 *
 * <p>Template: {@code SimulatorViewerTimeMessage Low 150 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_time_synch()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class SimulatorViewerTimeMessage extends SLMessage {
    public TimeInfo TimeInfo_Field;

    /** Block TimeInfo, Single. */
    public static class TimeInfo {
        public int SecPerDay; // U32
        public int SecPerYear; // U32
        public LLVector3 SunAngVelocity; // LLVector3
        public LLVector3 SunDirection; // LLVector3
        public float SunPhase; // F32
        public long UsecSinceStart; // U64
    }

    public SimulatorViewerTimeMessage() {
        this.zeroCoded = false;
        this.TimeInfo_Field = new TimeInfo();
    }

    @Override
    public int CalcPayloadSize() {
        return 48;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleSimulatorViewerTimeMessage(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 150 (SimulatorViewerTimeMessage).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x96);
        packLong(byteBuffer, this.TimeInfo_Field.UsecSinceStart);
        packInt(byteBuffer, this.TimeInfo_Field.SecPerDay);
        packInt(byteBuffer, this.TimeInfo_Field.SecPerYear);
        packLLVector3(byteBuffer, this.TimeInfo_Field.SunDirection);
        packFloat(byteBuffer, this.TimeInfo_Field.SunPhase);
        packLLVector3(byteBuffer, this.TimeInfo_Field.SunAngVelocity);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.TimeInfo_Field.UsecSinceStart = unpackLong(byteBuffer);
        this.TimeInfo_Field.SecPerDay = unpackInt(byteBuffer);
        this.TimeInfo_Field.SecPerYear = unpackInt(byteBuffer);
        this.TimeInfo_Field.SunDirection = unpackLLVector3(byteBuffer);
        this.TimeInfo_Field.SunPhase = unpackFloat(byteBuffer);
        this.TimeInfo_Field.SunAngVelocity = unpackLLVector3(byteBuffer);
    }
}
