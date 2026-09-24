package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;

/**
 * ReportAutosaveCrash
 * sim->launcher
 *
 * <p>Template: {@code ReportAutosaveCrash Low 128 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class ReportAutosaveCrash extends SLMessage {
    public AutosaveData AutosaveData_Field;

    /** Block AutosaveData, Single. */
    public static class AutosaveData {
        public int PID; // S32
        public int Status; // S32
    }

    public ReportAutosaveCrash() {
        this.zeroCoded = false;
        this.AutosaveData_Field = new AutosaveData();
    }

    @Override
    public int CalcPayloadSize() {
        return 12;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleReportAutosaveCrash(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 128 (ReportAutosaveCrash).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x80);
        packInt(byteBuffer, this.AutosaveData_Field.PID);
        packInt(byteBuffer, this.AutosaveData_Field.Status);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AutosaveData_Field.PID = unpackInt(byteBuffer);
        this.AutosaveData_Field.Status = unpackInt(byteBuffer);
    }
}
