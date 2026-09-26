package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList

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
open class PacketAck : SLMessage() {
    @JvmField val Packets_Fields = ArrayList<Packets>()

    /** Block Packets, Variable. */
    open class Packets {
        @JvmField var ID: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (Packets_Fields.size * 4) + 5
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandlePacketAck(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Fixed 0xFFFFFFFB (PacketAck).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0xFF).toByte())
        byteBuffer.put((0xFB).toByte())
        byteBuffer.put((Packets_Fields.size.toByte()))
        for (entry in Packets_Fields) {
            packInt(byteBuffer, entry.ID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val packets = Packets()
            packets.ID = unpackInt(byteBuffer)
            Packets_Fields.add(packets)
        }
    }
}
