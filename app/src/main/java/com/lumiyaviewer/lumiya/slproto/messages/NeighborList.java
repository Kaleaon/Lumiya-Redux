package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.net.Inet4Address;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * SpaceServer to Simulator Messages
 * Neighbor List - Passed anytime neighbors change
 *
 * <p>Template: {@code NeighborList High 3 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class NeighborList extends SLMessage {
    public NeighborBlock[] NeighborBlock_Fields = new NeighborBlock[4];

    /** Block NeighborBlock, Multiple 4. */
    public static class NeighborBlock {
        public Inet4Address IP; // IPADDR
        public byte[] Name; // Variable 1 - string
        public int Port; // IPPORT
        public Inet4Address PublicIP; // IPADDR
        public int PublicPort; // IPPORT
        public UUID RegionID; // LLUUID
        public int SimAccess; // U8
    }

    public NeighborList() {
        this.zeroCoded = false;
        for (int i = 0; i < 4; i++) {
            this.NeighborBlock_Fields[i] = new NeighborBlock();
        }
    }

    @Override
    public int CalcPayloadSize() {
        int i = 1;
        for (int i2 = 0; i2 < 4; i2++) {
            i += this.NeighborBlock_Fields[i2].Name.length + 29 + 1;
        }
        return i;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleNeighborList(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: High 3 (NeighborList).
        byteBuffer.put((byte) 0x03);
        for (int i = 0; i < 4; i++) {
            packIPAddress(byteBuffer, this.NeighborBlock_Fields[i].IP);
            packShort(byteBuffer, (short) this.NeighborBlock_Fields[i].Port);
            packIPAddress(byteBuffer, this.NeighborBlock_Fields[i].PublicIP);
            packShort(byteBuffer, (short) this.NeighborBlock_Fields[i].PublicPort);
            packUUID(byteBuffer, this.NeighborBlock_Fields[i].RegionID);
            packVariable(byteBuffer, this.NeighborBlock_Fields[i].Name, 1);
            packByte(byteBuffer, (byte) this.NeighborBlock_Fields[i].SimAccess);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        for (int i = 0; i < 4; i++) {
            this.NeighborBlock_Fields[i].IP = unpackIPAddress(byteBuffer);
            this.NeighborBlock_Fields[i].Port = unpackShort(byteBuffer) & 65535;
            this.NeighborBlock_Fields[i].PublicIP = unpackIPAddress(byteBuffer);
            this.NeighborBlock_Fields[i].PublicPort = unpackShort(byteBuffer) & 65535;
            this.NeighborBlock_Fields[i].RegionID = unpackUUID(byteBuffer);
            this.NeighborBlock_Fields[i].Name = unpackVariable(byteBuffer, 1);
            this.NeighborBlock_Fields[i].SimAccess = unpackByte(byteBuffer) & 0xFF;
        }
    }
}
