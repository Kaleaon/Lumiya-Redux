package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer

/**
 * AbortXfer
 *
 * <p>Template: {@code AbortXfer Low 157 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_abort_xfer()} in indra/llmessage/llxfermanager.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class AbortXfer : SLMessage() {
    @JvmField var XferID_Field: XferID = XferID()

    /** Block XferID, Single. */
    open class XferID {
        @JvmField var ID: Long = 0L
        @JvmField var Result: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 16
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAbortXfer(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 157 (AbortXfer).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x9D).toByte())
        packLong(byteBuffer, XferID_Field.ID)
        packInt(byteBuffer, XferID_Field.Result)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        XferID_Field.ID = unpackLong(byteBuffer)
        XferID_Field.Result = unpackInt(byteBuffer)
    }
}
