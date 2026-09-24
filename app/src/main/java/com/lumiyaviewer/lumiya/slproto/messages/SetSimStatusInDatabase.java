package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * SetSimStatusInDatabase
 * alters the "simulator" table in the database
 * sim -> dataserver
 * reliable
 *
 * <p>Template: {@code SetSimStatusInDatabase Low 22 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class SetSimStatusInDatabase extends SLMessage {
    public Data Data_Field;

    /** Block Data, Single. */
    public static class Data {
        public int AgentCount; // S32
        public byte[] HostName; // Variable 1
        public int PID; // S32
        public UUID RegionID; // LLUUID
        public byte[] Status; // Variable 1
        public int TimeToLive; // S32 - in seconds
        public int X; // S32
        public int Y; // S32
    }

    public SetSimStatusInDatabase() {
        this.zeroCoded = false;
        this.Data_Field = new Data();
    }

    @Override
    public int CalcPayloadSize() {
        return this.Data_Field.HostName.length + 17 + 4 + 4 + 4 + 4 + 4 + 1 + this.Data_Field.Status.length + 4;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleSetSimStatusInDatabase(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 22 (SetSimStatusInDatabase).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x16);
        packUUID(byteBuffer, this.Data_Field.RegionID);
        packVariable(byteBuffer, this.Data_Field.HostName, 1);
        packInt(byteBuffer, this.Data_Field.X);
        packInt(byteBuffer, this.Data_Field.Y);
        packInt(byteBuffer, this.Data_Field.PID);
        packInt(byteBuffer, this.Data_Field.AgentCount);
        packInt(byteBuffer, this.Data_Field.TimeToLive);
        packVariable(byteBuffer, this.Data_Field.Status, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.Data_Field.RegionID = unpackUUID(byteBuffer);
        this.Data_Field.HostName = unpackVariable(byteBuffer, 1);
        this.Data_Field.X = unpackInt(byteBuffer);
        this.Data_Field.Y = unpackInt(byteBuffer);
        this.Data_Field.PID = unpackInt(byteBuffer);
        this.Data_Field.AgentCount = unpackInt(byteBuffer);
        this.Data_Field.TimeToLive = unpackInt(byteBuffer);
        this.Data_Field.Status = unpackVariable(byteBuffer, 1);
    }
}
