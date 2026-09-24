package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;

/**
 * Health Message
 * Tells viewer what agent health is
 *
 * <p>Template: {@code HealthMessage Low 138 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_health_message()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class HealthMessage extends SLMessage {
    public HealthData HealthData_Field;

    /** Block HealthData, Single. */
    public static class HealthData {
        public float Health; // F32
    }

    public HealthMessage() {
        this.zeroCoded = true;
        this.HealthData_Field = new HealthData();
    }

    @Override
    public int CalcPayloadSize() {
        return 8;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleHealthMessage(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 138 (HealthMessage).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x8A);
        packFloat(byteBuffer, this.HealthData_Field.Health);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.HealthData_Field.Health = unpackFloat(byteBuffer);
    }
}
