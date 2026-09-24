package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * SetStartLocationRequest
 * viewer -> sim
 * failure checked at sim and triggers ImprovedInstantMessage
 * success triggers SetStartLocation
 *
 * <p>Template: {@code SetStartLocationRequest Low 324 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class SetStartLocationRequest extends SLMessage {
    public AgentData AgentData_Field;
    public StartLocationData StartLocationData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block StartLocationData, Single. */
    public static class StartLocationData {
        public int LocationID; // U32
        public LLVector3 LocationLookAt; // LLVector3
        public LLVector3 LocationPos; // LLVector3 - region coords
        public byte[] SimName; // Variable 1 - string
    }

    public SetStartLocationRequest() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.StartLocationData_Field = new StartLocationData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.StartLocationData_Field.SimName.length + 1 + 4 + 12 + 12 + 36;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleSetStartLocationRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 324 (SetStartLocationRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x44);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packVariable(byteBuffer, this.StartLocationData_Field.SimName, 1);
        packInt(byteBuffer, this.StartLocationData_Field.LocationID);
        packLLVector3(byteBuffer, this.StartLocationData_Field.LocationPos);
        packLLVector3(byteBuffer, this.StartLocationData_Field.LocationLookAt);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.StartLocationData_Field.SimName = unpackVariable(byteBuffer, 1);
        this.StartLocationData_Field.LocationID = unpackInt(byteBuffer);
        this.StartLocationData_Field.LocationPos = unpackLLVector3(byteBuffer);
        this.StartLocationData_Field.LocationLookAt = unpackLLVector3(byteBuffer);
    }
}
