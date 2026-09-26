package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.net.Inet4Address
import java.nio.ByteBuffer
import java.util.UUID

/**
 * SpaceServer to Simulator Messages
 * Neighbor List - Passed anytime neighbors change
 *
 * <p>Template: {@code NeighborList High 3 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class NeighborList : SLMessage() {
    @JvmField val NeighborBlock_Fields = Array(4) { NeighborBlock() }

    /** Block NeighborBlock, Multiple 4. */
    open class NeighborBlock {
        @JvmField var IP: Inet4Address? = null
        @JvmField var Name: ByteArray? = null
        @JvmField var Port: Int = 0
        @JvmField var PublicIP: Inet4Address? = null
        @JvmField var PublicPort: Int = 0
        @JvmField var RegionID: UUID? = null
        @JvmField var SimAccess: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        var i = 1
        (0 until 4).forEach { index ->
            i += NeighborBlock_Fields[index].Name!!.size + 29 + 1
        }
        return i
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleNeighborList(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: High 3 (NeighborList).
        byteBuffer.put((0x03).toByte())
        (0 until 4).forEach { index ->
            packIPAddress(byteBuffer, NeighborBlock_Fields[index].IP)
            packShort(byteBuffer, NeighborBlock_Fields[index].Port.toShort())
            packIPAddress(byteBuffer, NeighborBlock_Fields[index].PublicIP)
            packShort(byteBuffer, NeighborBlock_Fields[index].PublicPort.toShort())
            packUUID(byteBuffer, NeighborBlock_Fields[index].RegionID)
            packVariable(byteBuffer, NeighborBlock_Fields[index].Name, 1)
            packByte(byteBuffer, (NeighborBlock_Fields[index].SimAccess).toByte())
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        (0 until 4).forEach { index ->
            NeighborBlock_Fields[index].IP = unpackIPAddress(byteBuffer)
            NeighborBlock_Fields[index].Port = unpackShort(byteBuffer).toInt() and 65535
            NeighborBlock_Fields[index].PublicIP = unpackIPAddress(byteBuffer)
            NeighborBlock_Fields[index].PublicPort = unpackShort(byteBuffer).toInt() and 65535
            NeighborBlock_Fields[index].RegionID = unpackUUID(byteBuffer)
            NeighborBlock_Fields[index].Name = unpackVariable(byteBuffer, 1)
            NeighborBlock_Fields[index].SimAccess = unpackByte(byteBuffer).toInt() and 0xFF
        }
    }
}
