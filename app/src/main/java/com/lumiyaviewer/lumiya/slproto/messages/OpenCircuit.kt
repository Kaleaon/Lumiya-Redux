package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.net.Inet4Address
import java.nio.ByteBuffer

/**
 * OpenCircuit - Tells the recipient's messaging system to open the descibed circuit
 *
 * <p>Template: {@code OpenCircuit Fixed 0xFFFFFFFC NotTrusted Unencoded UDPBlackListed}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code open_circuit()} in indra/llmessage/message.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class OpenCircuit : SLMessage() {
    @JvmField var CircuitInfo_Field: CircuitInfo = CircuitInfo()

    /** Block CircuitInfo, Single. */
    open class CircuitInfo {
        @JvmField var IP: Inet4Address? = null
        @JvmField var Port: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 10
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleOpenCircuit(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Fixed 0xFFFFFFFC (OpenCircuit).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0xFF).toByte())
        byteBuffer.put((0xFC).toByte())
        packIPAddress(byteBuffer, CircuitInfo_Field.IP)
        packShort(byteBuffer, CircuitInfo_Field.Port.toShort())
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        CircuitInfo_Field.IP = unpackIPAddress(byteBuffer)
        CircuitInfo_Field.Port = unpackShort(byteBuffer).toInt() and 65535
    }
}
