package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Simulator to dataserver messages
 * Updates SimName, EstateID and SimAccess using RegionID as a key
 *
 * <p>Template: {@code UpdateSimulator Low 17 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class UpdateSimulator extends SLMessage {
    public SimulatorInfo SimulatorInfo_Field;

    /** Block SimulatorInfo, Single. */
    public static class SimulatorInfo {
        public int EstateID; // U32
        public UUID RegionID; // LLUUID
        public int SimAccess; // U8
        public byte[] SimName; // Variable 1
    }

    public UpdateSimulator() {
        this.zeroCoded = false;
        this.SimulatorInfo_Field = new SimulatorInfo();
    }

    @Override
    public int CalcPayloadSize() {
        return this.SimulatorInfo_Field.SimName.length + 17 + 4 + 1 + 4;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleUpdateSimulator(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 17 (UpdateSimulator).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x11);
        packUUID(byteBuffer, this.SimulatorInfo_Field.RegionID);
        packVariable(byteBuffer, this.SimulatorInfo_Field.SimName, 1);
        packInt(byteBuffer, this.SimulatorInfo_Field.EstateID);
        packByte(byteBuffer, (byte) this.SimulatorInfo_Field.SimAccess);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.SimulatorInfo_Field.RegionID = unpackUUID(byteBuffer);
        this.SimulatorInfo_Field.SimName = unpackVariable(byteBuffer, 1);
        this.SimulatorInfo_Field.EstateID = unpackInt(byteBuffer);
        this.SimulatorInfo_Field.SimAccess = unpackByte(byteBuffer) & 0xFF;
    }
}
