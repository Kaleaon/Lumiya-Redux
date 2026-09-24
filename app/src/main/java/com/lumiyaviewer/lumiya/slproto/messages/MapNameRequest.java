package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * viewer -> sim
 * This message is sent up from the viewer to get a list
 * of the sims with a given name.
 * Returns: MapBlockReply
 *
 * <p>Template: {@code MapNameRequest Low 408 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class MapNameRequest extends SLMessage {
    public AgentData AgentData_Field;
    public NameData NameData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public int EstateID; // U32 - filled in on sim
        public int Flags; // U32
        public boolean Godlike; // BOOL - filled in on sim
        public UUID SessionID; // LLUUID
    }

    /** Block NameData, Single. */
    public static class NameData {
        public byte[] Name; // Variable 1 - string
    }

    public MapNameRequest() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.NameData_Field = new NameData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.NameData_Field.Name.length + 1 + 45;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleMapNameRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 408 (MapNameRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x98);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.AgentData_Field.Flags);
        packInt(byteBuffer, this.AgentData_Field.EstateID);
        packBoolean(byteBuffer, this.AgentData_Field.Godlike);
        packVariable(byteBuffer, this.NameData_Field.Name, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.Flags = unpackInt(byteBuffer);
        this.AgentData_Field.EstateID = unpackInt(byteBuffer);
        this.AgentData_Field.Godlike = unpackBoolean(byteBuffer);
        this.NameData_Field.Name = unpackVariable(byteBuffer, 1);
    }
}
