package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Simulator to SpaceServer Messages
 * SimulatorReady - indicates the sim has finished loading its state
 * and is ready to receive updates from others
 *
 * <p>Template: {@code SimulatorReady Low 9 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class SimulatorReady extends SLMessage {
    public SimulatorBlock SimulatorBlock_Field;
    public TelehubBlock TelehubBlock_Field;

    /** Block SimulatorBlock, Single. */
    public static class SimulatorBlock {
        public int EstateID; // U32
        public int ParentEstateID; // U32
        public int RegionFlags; // U32
        public UUID RegionID; // LLUUID
        public int SimAccess; // U8
        public byte[] SimName; // Variable 1
    }

    /** Block TelehubBlock, Single. */
    public static class TelehubBlock {
        public boolean HasTelehub; // BOOL
        public LLVector3 TelehubPos; // LLVector3
    }

    public SimulatorReady() {
        this.zeroCoded = true;
        this.SimulatorBlock_Field = new SimulatorBlock();
        this.TelehubBlock_Field = new TelehubBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return this.SimulatorBlock_Field.SimName.length + 1 + 1 + 4 + 16 + 4 + 4 + 4 + 13;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleSimulatorReady(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 9 (SimulatorReady).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x09);
        packVariable(byteBuffer, this.SimulatorBlock_Field.SimName, 1);
        packByte(byteBuffer, (byte) this.SimulatorBlock_Field.SimAccess);
        packInt(byteBuffer, this.SimulatorBlock_Field.RegionFlags);
        packUUID(byteBuffer, this.SimulatorBlock_Field.RegionID);
        packInt(byteBuffer, this.SimulatorBlock_Field.EstateID);
        packInt(byteBuffer, this.SimulatorBlock_Field.ParentEstateID);
        packBoolean(byteBuffer, this.TelehubBlock_Field.HasTelehub);
        packLLVector3(byteBuffer, this.TelehubBlock_Field.TelehubPos);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.SimulatorBlock_Field.SimName = unpackVariable(byteBuffer, 1);
        this.SimulatorBlock_Field.SimAccess = unpackByte(byteBuffer) & 0xFF;
        this.SimulatorBlock_Field.RegionFlags = unpackInt(byteBuffer);
        this.SimulatorBlock_Field.RegionID = unpackUUID(byteBuffer);
        this.SimulatorBlock_Field.EstateID = unpackInt(byteBuffer);
        this.SimulatorBlock_Field.ParentEstateID = unpackInt(byteBuffer);
        this.TelehubBlock_Field.HasTelehub = unpackBoolean(byteBuffer);
        this.TelehubBlock_Field.TelehubPos = unpackLLVector3(byteBuffer);
    }
}
