package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Simulator to dataserver messages
 * Updates SimName, EstateID and SimAccess using RegionID as a key
 *
 * <p>Template: {@code UpdateSimulator Low 17 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class UpdateSimulator : SLMessage() {
    @JvmField var SimulatorInfo_Field: SimulatorInfo = SimulatorInfo()

    /** Block SimulatorInfo, Single. */
    open class SimulatorInfo {
        @JvmField var EstateID: Int = 0
        @JvmField var RegionID: UUID? = null
        @JvmField var SimAccess: Int = 0
        @JvmField var SimName: ByteArray? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return SimulatorInfo_Field.SimName!!.size + 17 + 4 + 1 + 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleUpdateSimulator(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 17 (UpdateSimulator).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x11).toByte())
        packUUID(byteBuffer, SimulatorInfo_Field.RegionID)
        packVariable(byteBuffer, SimulatorInfo_Field.SimName, 1)
        packInt(byteBuffer, SimulatorInfo_Field.EstateID)
        packByte(byteBuffer, (SimulatorInfo_Field.SimAccess).toByte())
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        SimulatorInfo_Field.RegionID = unpackUUID(byteBuffer)
        SimulatorInfo_Field.SimName = unpackVariable(byteBuffer, 1)
        SimulatorInfo_Field.EstateID = unpackInt(byteBuffer)
        SimulatorInfo_Field.SimAccess = unpackByte(byteBuffer).toInt() and 0xFF
    }
}
