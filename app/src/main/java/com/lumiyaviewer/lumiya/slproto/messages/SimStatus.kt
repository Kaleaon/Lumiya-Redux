package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer

/**
 * Sim status, condition of this sim
 * sent reliably, when dirty
 *
 * <p>Template: {@code SimStatus Medium 12 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class SimStatus : SLMessage() {
    @JvmField var SimStatusData_Field: SimStatusData = SimStatusData()

    open class SimStatusData {
        @JvmField var CanAcceptAgents: Boolean = false
        @JvmField var CanAcceptTasks: Boolean = false
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleSimStatus(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Medium 12 (SimStatus).
        byteBuffer.put((0xFF).toByte())
        byteBuffer.put((0x0C).toByte())
        packBoolean(byteBuffer, SimStatusData_Field.CanAcceptAgents)
        packBoolean(byteBuffer, SimStatusData_Field.CanAcceptTasks)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        SimStatusData_Field.CanAcceptAgents = unpackBoolean(byteBuffer)
        SimStatusData_Field.CanAcceptTasks = unpackBoolean(byteBuffer)
    }
}
