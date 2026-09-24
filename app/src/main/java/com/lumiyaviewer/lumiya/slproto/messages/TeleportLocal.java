package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * TeleportLocal
 * sim -> viewer reply telling the viewer that we've successfully TP'd
 * to somewhere else within the sim
 *
 * <p>Template: {@code TeleportLocal Low 64 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_teleport_local()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class TeleportLocal extends SLMessage {
    public Info Info_Field;

    /** Block Info, Single. */
    public static class Info {
        public UUID AgentID; // LLUUID
        public int LocationID; // U32
        public LLVector3 LookAt; // LLVector3
        public LLVector3 Position; // LLVector3 - region
        public int TeleportFlags; // U32
    }

    public TeleportLocal() {
        this.zeroCoded = false;
        this.Info_Field = new Info();
    }

    @Override
    public int CalcPayloadSize() {
        return 52;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleTeleportLocal(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 64 (TeleportLocal).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x40);
        packUUID(byteBuffer, this.Info_Field.AgentID);
        packInt(byteBuffer, this.Info_Field.LocationID);
        packLLVector3(byteBuffer, this.Info_Field.Position);
        packLLVector3(byteBuffer, this.Info_Field.LookAt);
        packInt(byteBuffer, this.Info_Field.TeleportFlags);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.Info_Field.AgentID = unpackUUID(byteBuffer);
        this.Info_Field.LocationID = unpackInt(byteBuffer);
        this.Info_Field.Position = unpackLLVector3(byteBuffer);
        this.Info_Field.LookAt = unpackLLVector3(byteBuffer);
        this.Info_Field.TeleportFlags = unpackInt(byteBuffer);
    }
}
