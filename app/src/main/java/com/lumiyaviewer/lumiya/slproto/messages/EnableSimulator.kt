package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.net.Inet4Address
import java.nio.ByteBuffer

/**
 * EnableSimulator - Preps a viewer to receive data from a simulator
 *
 * <p>Template: {@code EnableSimulator Low 151 Trusted Unencoded UDPBlackListed}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_enable_simulator()} in indra/newview/llworld.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class EnableSimulator : SLMessage() {
    @JvmField var SimulatorInfo_Field: SimulatorInfo = SimulatorInfo()

    /** Block SimulatorInfo, Single. */
    open class SimulatorInfo {
        @JvmField var Handle: Long = 0L
        @JvmField var IP: Inet4Address? = null
        @JvmField var Port: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 18
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleEnableSimulator(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 151 (EnableSimulator).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x97).toByte())
        packLong(byteBuffer, SimulatorInfo_Field.Handle)
        packIPAddress(byteBuffer, SimulatorInfo_Field.IP)
        packShort(byteBuffer, SimulatorInfo_Field.Port.toShort())
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        SimulatorInfo_Field.Handle = unpackLong(byteBuffer)
        SimulatorInfo_Field.IP = unpackIPAddress(byteBuffer)
        SimulatorInfo_Field.Port = unpackShort(byteBuffer).toInt() and 65535
    }
}
