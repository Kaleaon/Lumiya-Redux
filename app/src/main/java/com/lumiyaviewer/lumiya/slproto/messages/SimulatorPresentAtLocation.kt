package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.net.Inet4Address
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * SimulatorPresentAtLocation - indicates that the sim is present at a grid
 * location and passes what it believes its neighbors are
 *
 * <p>Template: {@code SimulatorPresentAtLocation Low 11 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class SimulatorPresentAtLocation : SLMessage() {
    @JvmField var SimulatorBlock_Field: SimulatorBlock = SimulatorBlock()
    @JvmField var SimulatorPublicHostBlock_Field: SimulatorPublicHostBlock = SimulatorPublicHostBlock()
    @JvmField val NeighborBlock_Fields = Array(4) { NeighborBlock() }
    @JvmField val TelehubBlock_Fields = ArrayList<TelehubBlock>()

    /** Block NeighborBlock, Multiple 4. */
    open class NeighborBlock {
        @JvmField var IP: Inet4Address? = null
        @JvmField var Port: Int = 0
    }

    /** Block SimulatorBlock, Single. */
    open class SimulatorBlock {
        @JvmField var EstateID: Int = 0
        @JvmField var ParentEstateID: Int = 0
        @JvmField var RegionFlags: Int = 0
        @JvmField var RegionID: UUID? = null
        @JvmField var SimAccess: Int = 0
        @JvmField var SimName: ByteArray? = null
    }

    /** Block SimulatorPublicHostBlock, Single. */
    open class SimulatorPublicHostBlock {
        @JvmField var GridX: Int = 0
        @JvmField var GridY: Int = 0
        @JvmField var Port: Int = 0
        @JvmField var SimulatorIP: Inet4Address? = null
    }

    /** Block TelehubBlock, Variable. */
    open class TelehubBlock {
        @JvmField var HasTelehub: Boolean = false
        @JvmField var TelehubPos: LLVector3? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return SimulatorBlock_Field.SimName!!.size + 1 + 1 + 4 + 16 + 4 + 4 + 42 + 1 + (TelehubBlock_Fields.size * 13)
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleSimulatorPresentAtLocation(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 11 (SimulatorPresentAtLocation).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x0B).toByte())
        packShort(byteBuffer, SimulatorPublicHostBlock_Field.Port.toShort())
        packIPAddress(byteBuffer, SimulatorPublicHostBlock_Field.SimulatorIP)
        packInt(byteBuffer, SimulatorPublicHostBlock_Field.GridX)
        packInt(byteBuffer, SimulatorPublicHostBlock_Field.GridY)
        (0 until 4).forEach { index ->
            packIPAddress(byteBuffer, NeighborBlock_Fields[index].IP)
            packShort(byteBuffer, NeighborBlock_Fields[index].Port.toShort())
        }
        packVariable(byteBuffer, SimulatorBlock_Field.SimName, 1)
        packByte(byteBuffer, (SimulatorBlock_Field.SimAccess).toByte())
        packInt(byteBuffer, SimulatorBlock_Field.RegionFlags)
        packUUID(byteBuffer, SimulatorBlock_Field.RegionID)
        packInt(byteBuffer, SimulatorBlock_Field.EstateID)
        packInt(byteBuffer, SimulatorBlock_Field.ParentEstateID)
        byteBuffer.put((TelehubBlock_Fields.size.toByte()))
        for (telehubBlock in TelehubBlock_Fields) {
            packBoolean(byteBuffer, telehubBlock.HasTelehub)
            packLLVector3(byteBuffer, telehubBlock.TelehubPos)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        SimulatorPublicHostBlock_Field.Port = unpackShort(byteBuffer).toInt() and 65535
        SimulatorPublicHostBlock_Field.SimulatorIP = unpackIPAddress(byteBuffer)
        SimulatorPublicHostBlock_Field.GridX = unpackInt(byteBuffer)
        SimulatorPublicHostBlock_Field.GridY = unpackInt(byteBuffer)
        (0 until 4).forEach { index ->
            NeighborBlock_Fields[index].IP = unpackIPAddress(byteBuffer)
            NeighborBlock_Fields[index].Port = unpackShort(byteBuffer).toInt() and 65535
        }
        SimulatorBlock_Field.SimName = unpackVariable(byteBuffer, 1)
        SimulatorBlock_Field.SimAccess = unpackByte(byteBuffer).toInt() and 0xFF
        SimulatorBlock_Field.RegionFlags = unpackInt(byteBuffer)
        SimulatorBlock_Field.RegionID = unpackUUID(byteBuffer)
        SimulatorBlock_Field.EstateID = unpackInt(byteBuffer)
        SimulatorBlock_Field.ParentEstateID = unpackInt(byteBuffer)
        val i2 = (byteBuffer.get().toInt() and 0xFF)
        repeat(i2) {
            val telehubBlock = TelehubBlock()
            telehubBlock.HasTelehub = unpackBoolean(byteBuffer)
            telehubBlock.TelehubPos = unpackLLVector3(byteBuffer)
            TelehubBlock_Fields.add(telehubBlock)
        }
    }
}
