package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.net.Inet4Address;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * CrossedRegion - new way to tell a viewer it has gone across a region
 * boundary
 *
 * <p>Template: {@code CrossedRegion Medium 7 Trusted Unencoded UDPBlackListed}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_crossed_region()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class CrossedRegion extends SLMessage {
    public AgentData AgentData_Field;
    public Info Info_Field;
    public RegionData RegionData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block Info, Single. */
    public static class Info {
        public LLVector3 LookAt; // LLVector3
        public LLVector3 Position; // LLVector3
    }

    /** Block RegionData, Single. */
    public static class RegionData {
        public long RegionHandle; // U64
        public byte[] SeedCapability; // Variable 2 - URL
        public Inet4Address SimIP; // IPADDR
        public int SimPort; // IPPORT
    }

    public CrossedRegion() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.RegionData_Field = new RegionData();
        this.Info_Field = new Info();
    }

    @Override
    public int CalcPayloadSize() {
        return this.RegionData_Field.SeedCapability.length + 16 + 34 + 24;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleCrossedRegion(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Medium 7 (CrossedRegion).
        byteBuffer.put((byte) 0xFF);
        byteBuffer.put((byte) 0x07);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packIPAddress(byteBuffer, this.RegionData_Field.SimIP);
        packShort(byteBuffer, (short) this.RegionData_Field.SimPort);
        packLong(byteBuffer, this.RegionData_Field.RegionHandle);
        packVariable(byteBuffer, this.RegionData_Field.SeedCapability, 2);
        packLLVector3(byteBuffer, this.Info_Field.Position);
        packLLVector3(byteBuffer, this.Info_Field.LookAt);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.RegionData_Field.SimIP = unpackIPAddress(byteBuffer);
        this.RegionData_Field.SimPort = unpackShort(byteBuffer) & 65535;
        this.RegionData_Field.RegionHandle = unpackLong(byteBuffer);
        this.RegionData_Field.SeedCapability = unpackVariable(byteBuffer, 2);
        this.Info_Field.Position = unpackLLVector3(byteBuffer);
        this.Info_Field.LookAt = unpackLLVector3(byteBuffer);
    }
}
