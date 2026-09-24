package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * MeanCollisionAlert
 * Specifies the text to be posted in an alert dialog
 *
 * <p>Template: {@code MeanCollisionAlert Low 136 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_mean_collision_alert_message()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class MeanCollisionAlert extends SLMessage {
    public ArrayList<MeanCollision> MeanCollision_Fields = new ArrayList<>();

    /** Block MeanCollision, Variable. */
    public static class MeanCollision {
        public float Mag; // F32
        public UUID Perp; // LLUUID
        public int Time; // U32
        public int Type; // U8
        public UUID Victim; // LLUUID
    }

    public MeanCollisionAlert() {
        this.zeroCoded = true;
    }

    @Override
    public int CalcPayloadSize() {
        return (this.MeanCollision_Fields.size() * 41) + 5;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleMeanCollisionAlert(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 136 (MeanCollisionAlert).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x88);
        byteBuffer.put((byte) this.MeanCollision_Fields.size());
        for (MeanCollision meanCollision : this.MeanCollision_Fields) {
            packUUID(byteBuffer, meanCollision.Victim);
            packUUID(byteBuffer, meanCollision.Perp);
            packInt(byteBuffer, meanCollision.Time);
            packFloat(byteBuffer, meanCollision.Mag);
            packByte(byteBuffer, (byte) meanCollision.Type);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            MeanCollision meanCollision = new MeanCollision();
            meanCollision.Victim = unpackUUID(byteBuffer);
            meanCollision.Perp = unpackUUID(byteBuffer);
            meanCollision.Time = unpackInt(byteBuffer);
            meanCollision.Mag = unpackFloat(byteBuffer);
            meanCollision.Type = unpackByte(byteBuffer) & 0xFF;
            this.MeanCollision_Fields.add(meanCollision);
        }
    }
}
