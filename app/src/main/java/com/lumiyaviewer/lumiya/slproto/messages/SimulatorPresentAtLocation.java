package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.net.Inet4Address;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * SimulatorPresentAtLocation - indicates that the sim is present at a grid
 * location and passes what it believes its neighbors are
 *
 * <p>Template: {@code SimulatorPresentAtLocation Low 11 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class SimulatorPresentAtLocation extends SLMessage {
    public SimulatorBlock SimulatorBlock_Field;
    public SimulatorPublicHostBlock SimulatorPublicHostBlock_Field;
    public NeighborBlock[] NeighborBlock_Fields = new NeighborBlock[4];
    public ArrayList<TelehubBlock> TelehubBlock_Fields = new ArrayList<>();

    /** Block NeighborBlock, Multiple 4. */
    public static class NeighborBlock {
        public Inet4Address IP; // IPADDR
        public int Port; // IPPORT
    }

    /** Block SimulatorBlock, Single. */
    public static class SimulatorBlock {
        public int EstateID; // U32
        public int ParentEstateID; // U32
        public int RegionFlags; // U32
        public UUID RegionID; // LLUUID
        public int SimAccess; // U8
        public byte[] SimName; // Variable 1
    }

    /** Block SimulatorPublicHostBlock, Single. */
    public static class SimulatorPublicHostBlock {
        public int GridX; // U32
        public int GridY; // U32
        public int Port; // IPPORT
        public Inet4Address SimulatorIP; // IPADDR
    }

    /** Block TelehubBlock, Variable. */
    public static class TelehubBlock {
        public boolean HasTelehub; // BOOL
        public LLVector3 TelehubPos; // LLVector3
    }

    public SimulatorPresentAtLocation() {
        this.zeroCoded = false;
        this.SimulatorPublicHostBlock_Field = new SimulatorPublicHostBlock();
        for (int i = 0; i < 4; i++) {
            this.NeighborBlock_Fields[i] = new NeighborBlock();
        }
        this.SimulatorBlock_Field = new SimulatorBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return this.SimulatorBlock_Field.SimName.length + 1 + 1 + 4 + 16 + 4 + 4 + 42 + 1 + (this.TelehubBlock_Fields.size() * 13);
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleSimulatorPresentAtLocation(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 11 (SimulatorPresentAtLocation).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x0B);
        packShort(byteBuffer, (short) this.SimulatorPublicHostBlock_Field.Port);
        packIPAddress(byteBuffer, this.SimulatorPublicHostBlock_Field.SimulatorIP);
        packInt(byteBuffer, this.SimulatorPublicHostBlock_Field.GridX);
        packInt(byteBuffer, this.SimulatorPublicHostBlock_Field.GridY);
        for (int i = 0; i < 4; i++) {
            packIPAddress(byteBuffer, this.NeighborBlock_Fields[i].IP);
            packShort(byteBuffer, (short) this.NeighborBlock_Fields[i].Port);
        }
        packVariable(byteBuffer, this.SimulatorBlock_Field.SimName, 1);
        packByte(byteBuffer, (byte) this.SimulatorBlock_Field.SimAccess);
        packInt(byteBuffer, this.SimulatorBlock_Field.RegionFlags);
        packUUID(byteBuffer, this.SimulatorBlock_Field.RegionID);
        packInt(byteBuffer, this.SimulatorBlock_Field.EstateID);
        packInt(byteBuffer, this.SimulatorBlock_Field.ParentEstateID);
        byteBuffer.put((byte) this.TelehubBlock_Fields.size());
        for (TelehubBlock telehubBlock : this.TelehubBlock_Fields) {
            packBoolean(byteBuffer, telehubBlock.HasTelehub);
            packLLVector3(byteBuffer, telehubBlock.TelehubPos);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.SimulatorPublicHostBlock_Field.Port = unpackShort(byteBuffer) & 65535;
        this.SimulatorPublicHostBlock_Field.SimulatorIP = unpackIPAddress(byteBuffer);
        this.SimulatorPublicHostBlock_Field.GridX = unpackInt(byteBuffer);
        this.SimulatorPublicHostBlock_Field.GridY = unpackInt(byteBuffer);
        for (int i = 0; i < 4; i++) {
            this.NeighborBlock_Fields[i].IP = unpackIPAddress(byteBuffer);
            this.NeighborBlock_Fields[i].Port = unpackShort(byteBuffer) & 65535;
        }
        this.SimulatorBlock_Field.SimName = unpackVariable(byteBuffer, 1);
        this.SimulatorBlock_Field.SimAccess = unpackByte(byteBuffer) & 0xFF;
        this.SimulatorBlock_Field.RegionFlags = unpackInt(byteBuffer);
        this.SimulatorBlock_Field.RegionID = unpackUUID(byteBuffer);
        this.SimulatorBlock_Field.EstateID = unpackInt(byteBuffer);
        this.SimulatorBlock_Field.ParentEstateID = unpackInt(byteBuffer);
        int i2 = byteBuffer.get() & 0xFF;
        for (int i3 = 0; i3 < i2; i3++) {
            TelehubBlock telehubBlock = new TelehubBlock();
            telehubBlock.HasTelehub = unpackBoolean(byteBuffer);
            telehubBlock.TelehubPos = unpackLLVector3(byteBuffer);
            this.TelehubBlock_Fields.add(telehubBlock);
        }
    }
}
