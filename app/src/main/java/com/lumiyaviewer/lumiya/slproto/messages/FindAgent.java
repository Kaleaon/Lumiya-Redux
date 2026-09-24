package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.net.Inet4Address;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * FindAgent - used to find an agent's global position. I used a
 * variable sized LocationBlock so that the message can be recycled with
 * minimum new messages and handlers.
 *
 * <p>Template: {@code FindAgent Low 256 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code processAgentFound()} in indra/newview/llcallingcard.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class FindAgent extends SLMessage {
    public AgentBlock AgentBlock_Field;
    public ArrayList<LocationBlock> LocationBlock_Fields = new ArrayList<>();

    /** Block AgentBlock, Single. */
    public static class AgentBlock {
        public UUID Hunter; // LLUUID
        public UUID Prey; // LLUUID
        public Inet4Address SpaceIP; // IPADDR
    }

    /** Block LocationBlock, Variable. */
    public static class LocationBlock {
        public double GlobalX; // F64
        public double GlobalY; // F64
    }

    public FindAgent() {
        this.zeroCoded = false;
        this.AgentBlock_Field = new AgentBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.LocationBlock_Fields.size() * 16) + 41;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleFindAgent(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 256 (FindAgent).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x00);
        packUUID(byteBuffer, this.AgentBlock_Field.Hunter);
        packUUID(byteBuffer, this.AgentBlock_Field.Prey);
        packIPAddress(byteBuffer, this.AgentBlock_Field.SpaceIP);
        byteBuffer.put((byte) this.LocationBlock_Fields.size());
        for (LocationBlock locationBlock : this.LocationBlock_Fields) {
            packDouble(byteBuffer, locationBlock.GlobalX);
            packDouble(byteBuffer, locationBlock.GlobalY);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentBlock_Field.Hunter = unpackUUID(byteBuffer);
        this.AgentBlock_Field.Prey = unpackUUID(byteBuffer);
        this.AgentBlock_Field.SpaceIP = unpackIPAddress(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            LocationBlock locationBlock = new LocationBlock();
            locationBlock.GlobalX = unpackDouble(byteBuffer);
            locationBlock.GlobalY = unpackDouble(byteBuffer);
            this.LocationBlock_Fields.add(locationBlock);
        }
    }
}
