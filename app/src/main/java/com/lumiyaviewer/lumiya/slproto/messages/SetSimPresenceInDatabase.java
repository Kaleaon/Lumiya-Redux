package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * SetSimPresenceInDatabase
 * updates the "presence" table in the database to ensure
 * that a given simulator is present and valid for a set amount of
 * time
 *
 * <p>Template: {@code SetSimPresenceInDatabase Low 23 Trusted Unencoded UDPDeprecated}
 * (recovered/reference/message_template.msg).
 */
public class SetSimPresenceInDatabase extends SLMessage {
    public SimData SimData_Field;

    /** Block SimData, Single. */
    public static class SimData {
        public int AgentCount; // S32
        public int GridX; // U32
        public int GridY; // U32
        public byte[] HostName; // Variable 1
        public int PID; // S32
        public UUID RegionID; // LLUUID
        public byte[] Status; // Variable 1
        public int TimeToLive; // S32 - in seconds
    }

    public SetSimPresenceInDatabase() {
        this.zeroCoded = false;
        this.SimData_Field = new SimData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.SimData_Field.HostName.length + 17 + 4 + 4 + 4 + 4 + 4 + 1 + this.SimData_Field.Status.length + 4;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleSetSimPresenceInDatabase(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 23 (SetSimPresenceInDatabase).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x17);
        packUUID(byteBuffer, this.SimData_Field.RegionID);
        packVariable(byteBuffer, this.SimData_Field.HostName, 1);
        packInt(byteBuffer, this.SimData_Field.GridX);
        packInt(byteBuffer, this.SimData_Field.GridY);
        packInt(byteBuffer, this.SimData_Field.PID);
        packInt(byteBuffer, this.SimData_Field.AgentCount);
        packInt(byteBuffer, this.SimData_Field.TimeToLive);
        packVariable(byteBuffer, this.SimData_Field.Status, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.SimData_Field.RegionID = unpackUUID(byteBuffer);
        this.SimData_Field.HostName = unpackVariable(byteBuffer, 1);
        this.SimData_Field.GridX = unpackInt(byteBuffer);
        this.SimData_Field.GridY = unpackInt(byteBuffer);
        this.SimData_Field.PID = unpackInt(byteBuffer);
        this.SimData_Field.AgentCount = unpackInt(byteBuffer);
        this.SimData_Field.TimeToLive = unpackInt(byteBuffer);
        this.SimData_Field.Status = unpackVariable(byteBuffer, 1);
    }
}
