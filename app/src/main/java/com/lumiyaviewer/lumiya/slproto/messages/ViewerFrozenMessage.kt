package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer

/**
 * ViewerFrozenMessage
 * Specifies the text to be posted in an alert dialog
 *
 * <p>Template: {@code ViewerFrozenMessage Low 137 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_frozen_message()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class ViewerFrozenMessage : SLMessage() {
    @JvmField var FrozenData_Field: FrozenData = FrozenData()

    /** Block FrozenData, Single. */
    open class FrozenData {
        @JvmField var Data: Boolean = false
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 5
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleViewerFrozenMessage(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 137 (ViewerFrozenMessage).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x89).toByte())
        packBoolean(byteBuffer, FrozenData_Field.Data)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        FrozenData_Field.Data = unpackBoolean(byteBuffer)
    }
}
