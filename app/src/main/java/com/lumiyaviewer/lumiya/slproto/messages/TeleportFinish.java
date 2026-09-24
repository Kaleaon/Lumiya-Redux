package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.net.Inet4Address;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * TeleportFinish sim->viewer
 * called when all of the information has been collected and readied for
 * the agent.
 *
 * <p>Template: {@code TeleportFinish Low 69 Trusted Unencoded UDPBlackListed}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_teleport_finish()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class TeleportFinish extends SLMessage {
    public Info Info_Field;

    /** Block Info, Single. */
    public static class Info {
        public UUID AgentID; // LLUUID
        public int LocationID; // U32
        public long RegionHandle; // U64
        public byte[] SeedCapability; // Variable 2 - URL
        public int SimAccess; // U8
        public Inet4Address SimIP; // IPADDR
        public int SimPort; // IPPORT
        public int TeleportFlags; // U32
    }

    public TeleportFinish() {
        this.zeroCoded = false;
        this.Info_Field = new Info();
    }

    @Override
    public int CalcPayloadSize() {
        return this.Info_Field.SeedCapability.length + 36 + 1 + 4 + 4;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleTeleportFinish(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 69 (TeleportFinish).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x45);
        packUUID(byteBuffer, this.Info_Field.AgentID);
        packInt(byteBuffer, this.Info_Field.LocationID);
        packIPAddress(byteBuffer, this.Info_Field.SimIP);
        packShort(byteBuffer, (short) this.Info_Field.SimPort);
        packLong(byteBuffer, this.Info_Field.RegionHandle);
        packVariable(byteBuffer, this.Info_Field.SeedCapability, 2);
        packByte(byteBuffer, (byte) this.Info_Field.SimAccess);
        packInt(byteBuffer, this.Info_Field.TeleportFlags);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.Info_Field.AgentID = unpackUUID(byteBuffer);
        this.Info_Field.LocationID = unpackInt(byteBuffer);
        this.Info_Field.SimIP = unpackIPAddress(byteBuffer);
        this.Info_Field.SimPort = unpackShort(byteBuffer) & 65535;
        this.Info_Field.RegionHandle = unpackLong(byteBuffer);
        this.Info_Field.SeedCapability = unpackVariable(byteBuffer, 2);
        this.Info_Field.SimAccess = unpackByte(byteBuffer) & 0xFF;
        this.Info_Field.TeleportFlags = unpackInt(byteBuffer);
    }
}
