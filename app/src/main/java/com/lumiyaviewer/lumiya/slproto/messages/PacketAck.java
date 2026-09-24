package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;

/**
 * Messaging Internal Data Management Message
 * List fixed messages first
 * Packet Ack - Ack a list of packets sent reliable
 *
 * <p>Template: {@code PacketAck Fixed 0xFFFFFFFB NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_packet_ack()} in indra/llmessage/message.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class PacketAck extends SLMessage {
    public ArrayList<Packets> Packets_Fields = new ArrayList<>();

    /** Block Packets, Variable. */
    public static class Packets {
        public int ID; // U32
    }

    public PacketAck() {
        this.zeroCoded = false;
    }

    @Override
    public int CalcPayloadSize() {
        return (this.Packets_Fields.size() * 4) + 5;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandlePacketAck(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Fixed 0xFFFFFFFB (PacketAck).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0xFF);
        byteBuffer.put((byte) 0xFB);
        byteBuffer.put((byte) this.Packets_Fields.size());
        Iterator<?> it = this.Packets_Fields.iterator();
        while (it.hasNext()) {
            packInt(byteBuffer, ((Packets) it.next()).ID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            Packets packets = new Packets();
            packets.ID = unpackInt(byteBuffer);
            this.Packets_Fields.add(packets);
        }
    }
}
