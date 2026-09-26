package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Simulator to SpaceServer Messages
 * SimulatorReady - indicates the sim has finished loading its state
 * and is ready to receive updates from others
 *
 * <p>Template: {@code SimulatorReady Low 9 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class SimulatorReady : SLMessage() {
    @JvmField var SimulatorBlock_Field: SimulatorBlock = SimulatorBlock()
    @JvmField var TelehubBlock_Field: TelehubBlock = TelehubBlock()

    /** Block SimulatorBlock, Single. */
    open class SimulatorBlock {
        @JvmField var EstateID: Int = 0
        @JvmField var ParentEstateID: Int = 0
        @JvmField var RegionFlags: Int = 0
        @JvmField var RegionID: UUID? = null
        @JvmField var SimAccess: Int = 0
        @JvmField var SimName: ByteArray? = null
    }

    /** Block TelehubBlock, Single. */
    open class TelehubBlock {
        @JvmField var HasTelehub: Boolean = false
        @JvmField var TelehubPos: LLVector3? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return SimulatorBlock_Field.SimName!!.size + 1 + 1 + 4 + 16 + 4 + 4 + 4 + 13
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleSimulatorReady(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 9 (SimulatorReady).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x09).toByte())
        packVariable(byteBuffer, SimulatorBlock_Field.SimName, 1)
        packByte(byteBuffer, (SimulatorBlock_Field.SimAccess).toByte())
        packInt(byteBuffer, SimulatorBlock_Field.RegionFlags)
        packUUID(byteBuffer, SimulatorBlock_Field.RegionID)
        packInt(byteBuffer, SimulatorBlock_Field.EstateID)
        packInt(byteBuffer, SimulatorBlock_Field.ParentEstateID)
        packBoolean(byteBuffer, TelehubBlock_Field.HasTelehub)
        packLLVector3(byteBuffer, TelehubBlock_Field.TelehubPos)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        SimulatorBlock_Field.SimName = unpackVariable(byteBuffer, 1)
        SimulatorBlock_Field.SimAccess = unpackByte(byteBuffer).toInt() and 0xFF
        SimulatorBlock_Field.RegionFlags = unpackInt(byteBuffer)
        SimulatorBlock_Field.RegionID = unpackUUID(byteBuffer)
        SimulatorBlock_Field.EstateID = unpackInt(byteBuffer)
        SimulatorBlock_Field.ParentEstateID = unpackInt(byteBuffer)
        TelehubBlock_Field.HasTelehub = unpackBoolean(byteBuffer)
        TelehubBlock_Field.TelehubPos = unpackLLVector3(byteBuffer)
    }
}
