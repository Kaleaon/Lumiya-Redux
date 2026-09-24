package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * sim -> viewer
 *
 * <p>Template: {@code AgentMovementComplete Low 250 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_agent_movement_complete()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class AgentMovementComplete extends SLMessage {
    public AgentData AgentData_Field;
    public Data Data_Field;
    public SimData SimData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block Data, Single. */
    public static class Data {
        public LLVector3 LookAt; // LLVector3
        public LLVector3 Position; // LLVector3
        public long RegionHandle; // U64
        public int Timestamp; // U32
    }

    /** Block SimData, Single. */
    public static class SimData {
        public byte[] ChannelVersion; // Variable 2
    }

    public AgentMovementComplete() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.Data_Field = new Data();
        this.SimData_Field = new SimData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.SimData_Field.ChannelVersion.length + 2 + 72;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleAgentMovementComplete(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 250 (AgentMovementComplete).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xFA);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packLLVector3(byteBuffer, this.Data_Field.Position);
        packLLVector3(byteBuffer, this.Data_Field.LookAt);
        packLong(byteBuffer, this.Data_Field.RegionHandle);
        packInt(byteBuffer, this.Data_Field.Timestamp);
        packVariable(byteBuffer, this.SimData_Field.ChannelVersion, 2);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.Data_Field.Position = unpackLLVector3(byteBuffer);
        this.Data_Field.LookAt = unpackLLVector3(byteBuffer);
        this.Data_Field.RegionHandle = unpackLong(byteBuffer);
        this.Data_Field.Timestamp = unpackInt(byteBuffer);
        this.SimData_Field.ChannelVersion = unpackVariable(byteBuffer, 2);
    }
}
