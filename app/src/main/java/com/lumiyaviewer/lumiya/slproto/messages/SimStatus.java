package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;

/**
 * Sim status, condition of this sim
 * sent reliably, when dirty
 *
 * <p>Template: {@code SimStatus Medium 12 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class SimStatus extends SLMessage {
    public SimStatusData SimStatusData_Field;

    public static class SimStatusData {
        public boolean CanAcceptAgents; // BOOL
        public boolean CanAcceptTasks; // BOOL
    }

    public SimStatus() {
        this.zeroCoded = false;
        this.SimStatusData_Field = new SimStatusData();
    }

    @Override
    public int CalcPayloadSize() {
        return 4;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleSimStatus(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Medium 12 (SimStatus).
        byteBuffer.put((byte) 0xFF);
        byteBuffer.put((byte) 0x0C);
        packBoolean(byteBuffer, this.SimStatusData_Field.CanAcceptAgents);
        packBoolean(byteBuffer, this.SimStatusData_Field.CanAcceptTasks);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.SimStatusData_Field.CanAcceptAgents = unpackBoolean(byteBuffer);
        this.SimStatusData_Field.CanAcceptTasks = unpackBoolean(byteBuffer);
    }
}
