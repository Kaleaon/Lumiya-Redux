package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.net.Inet4Address
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

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
open class FindAgent : SLMessage() {
    @JvmField var AgentBlock_Field: AgentBlock = AgentBlock()
    @JvmField val LocationBlock_Fields = ArrayList<LocationBlock>()

    /** Block AgentBlock, Single. */
    open class AgentBlock {
        @JvmField var Hunter: UUID? = null
        @JvmField var Prey: UUID? = null
        @JvmField var SpaceIP: Inet4Address? = null
    }

    /** Block LocationBlock, Variable. */
    open class LocationBlock {
        @JvmField var GlobalX: Double = 0.0
        @JvmField var GlobalY: Double = 0.0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (LocationBlock_Fields.size * 16) + 41
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleFindAgent(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 256 (FindAgent).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x00).toByte())
        packUUID(byteBuffer, AgentBlock_Field.Hunter)
        packUUID(byteBuffer, AgentBlock_Field.Prey)
        packIPAddress(byteBuffer, AgentBlock_Field.SpaceIP)
        byteBuffer.put((LocationBlock_Fields.size.toByte()))
        for (locationBlock in LocationBlock_Fields) {
            packDouble(byteBuffer, locationBlock.GlobalX)
            packDouble(byteBuffer, locationBlock.GlobalY)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentBlock_Field.Hunter = unpackUUID(byteBuffer)
        AgentBlock_Field.Prey = unpackUUID(byteBuffer)
        AgentBlock_Field.SpaceIP = unpackIPAddress(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val locationBlock = LocationBlock()
            locationBlock.GlobalX = unpackDouble(byteBuffer)
            locationBlock.GlobalY = unpackDouble(byteBuffer)
            LocationBlock_Fields.add(locationBlock)
        }
    }
}
