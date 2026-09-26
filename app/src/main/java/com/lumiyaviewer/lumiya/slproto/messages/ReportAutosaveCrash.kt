package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer

/**
 * ReportAutosaveCrash
 * sim->launcher
 *
 * <p>Template: {@code ReportAutosaveCrash Low 128 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class ReportAutosaveCrash : SLMessage() {
    @JvmField var AutosaveData_Field: AutosaveData = AutosaveData()

    /** Block AutosaveData, Single. */
    open class AutosaveData {
        @JvmField var PID: Int = 0
        @JvmField var Status: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 12
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleReportAutosaveCrash(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 128 (ReportAutosaveCrash).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x80).toByte())
        packInt(byteBuffer, AutosaveData_Field.PID)
        packInt(byteBuffer, AutosaveData_Field.Status)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AutosaveData_Field.PID = unpackInt(byteBuffer)
        AutosaveData_Field.Status = unpackInt(byteBuffer)
    }
}
