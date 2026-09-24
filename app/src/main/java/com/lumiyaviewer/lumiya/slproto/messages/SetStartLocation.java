package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * SetStartLocation
 * sim -> dataserver
 *
 * <p>Template: {@code SetStartLocation Low 325 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class SetStartLocation extends SLMessage {
    public StartLocationData StartLocationData_Field;

    /** Block StartLocationData, Single. */
    public static class StartLocationData {
        public UUID AgentID; // LLUUID
        public int LocationID; // U32
        public LLVector3 LocationLookAt; // LLVector3
        public LLVector3 LocationPos; // LLVector3 - region coords
        public long RegionHandle; // U64
        public UUID RegionID; // LLUUID
    }

    public SetStartLocation() {
        this.zeroCoded = true;
        this.StartLocationData_Field = new StartLocationData();
    }

    @Override
    public int CalcPayloadSize() {
        return 72;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleSetStartLocation(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 325 (SetStartLocation).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x45);
        packUUID(byteBuffer, this.StartLocationData_Field.AgentID);
        packUUID(byteBuffer, this.StartLocationData_Field.RegionID);
        packInt(byteBuffer, this.StartLocationData_Field.LocationID);
        packLong(byteBuffer, this.StartLocationData_Field.RegionHandle);
        packLLVector3(byteBuffer, this.StartLocationData_Field.LocationPos);
        packLLVector3(byteBuffer, this.StartLocationData_Field.LocationLookAt);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.StartLocationData_Field.AgentID = unpackUUID(byteBuffer);
        this.StartLocationData_Field.RegionID = unpackUUID(byteBuffer);
        this.StartLocationData_Field.LocationID = unpackInt(byteBuffer);
        this.StartLocationData_Field.RegionHandle = unpackLong(byteBuffer);
        this.StartLocationData_Field.LocationPos = unpackLLVector3(byteBuffer);
        this.StartLocationData_Field.LocationLookAt = unpackLLVector3(byteBuffer);
    }
}
