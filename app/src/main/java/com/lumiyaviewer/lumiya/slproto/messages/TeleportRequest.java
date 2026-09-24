package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Teleport messages
 * The teleport messages are numerous, so I have attempted to give them a
 * consistent naming convention. Since there is a bit of glob pattern
 * aliasing, the rules are applied in order.
 * Teleport* - viewer->sim or sim->viewer message which announces a
 * teleportation request, progrees, start, or end.
 * Data* - sim->data or data->sim trusted message.
 * Space* - sim->space or space->sim trusted messaging
 * *Lure - A lure message to pass around information.
 * All actual viewer teleports will begin with a Teleport* message and
 * end in a TeleportStart, TeleportLocal or TeleportFailed message. The TeleportFailed
 * message may be returned by any process and must be routed through the
 * teleporting agent's simulator and back to the viewer.
 * TeleportRequest
 * viewer -> sim specifying exact teleport destination
 *
 * <p>Template: {@code TeleportRequest Low 62 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class TeleportRequest extends SLMessage {
    public AgentData AgentData_Field;
    public Info Info_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block Info, Single. */
    public static class Info {
        public LLVector3 LookAt; // LLVector3
        public LLVector3 Position; // LLVector3
        public UUID RegionID; // LLUUID
    }

    public TeleportRequest() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.Info_Field = new Info();
    }

    @Override
    public int CalcPayloadSize() {
        return 76;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleTeleportRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 62 (TeleportRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x3E);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.Info_Field.RegionID);
        packLLVector3(byteBuffer, this.Info_Field.Position);
        packLLVector3(byteBuffer, this.Info_Field.LookAt);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.Info_Field.RegionID = unpackUUID(byteBuffer);
        this.Info_Field.Position = unpackLLVector3(byteBuffer);
        this.Info_Field.LookAt = unpackLLVector3(byteBuffer);
    }
}
