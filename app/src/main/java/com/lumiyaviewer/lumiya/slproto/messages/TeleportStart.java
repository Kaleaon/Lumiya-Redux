package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;

/**
 * TeleportStart sim->viewer
 * announce a successful teleport request to the viewer.
 *
 * <p>Template: {@code TeleportStart Low 73 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_teleport_start()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class TeleportStart extends SLMessage {
    public Info Info_Field;

    /** Block Info, Single. */
    public static class Info {
        public int TeleportFlags; // U32
    }

    public TeleportStart() {
        this.zeroCoded = false;
        this.Info_Field = new Info();
    }

    @Override
    public int CalcPayloadSize() {
        return 8;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleTeleportStart(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 73 (TeleportStart).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x49);
        packInt(byteBuffer, this.Info_Field.TeleportFlags);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.Info_Field.TeleportFlags = unpackInt(byteBuffer);
    }
}
