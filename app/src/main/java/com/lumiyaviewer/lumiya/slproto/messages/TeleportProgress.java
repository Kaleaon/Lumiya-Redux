package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * TeleportProgress sim->viewer
 * Tell the agent how the teleport is going.
 *
 * <p>Template: {@code TeleportProgress Low 66 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_teleport_progress()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class TeleportProgress extends SLMessage {
    public AgentData AgentData_Field;
    public Info Info_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
    }

    /** Block Info, Single. */
    public static class Info {
        public byte[] Message; // Variable 1 - string
        public int TeleportFlags; // U32
    }

    public TeleportProgress() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.Info_Field = new Info();
    }

    @Override
    public int CalcPayloadSize() {
        return this.Info_Field.Message.length + 5 + 20;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleTeleportProgress(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 66 (TeleportProgress).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x42);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packInt(byteBuffer, this.Info_Field.TeleportFlags);
        packVariable(byteBuffer, this.Info_Field.Message, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.Info_Field.TeleportFlags = unpackInt(byteBuffer);
        this.Info_Field.Message = unpackVariable(byteBuffer, 1);
    }
}
