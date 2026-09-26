package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * sim -> viewer
 * Used to propperly handle buying asset containers
 *
 * <p>Template: {@code DerezContainer Low 104 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_derez_container()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class DerezContainer : SLMessage() {
    @JvmField var Data_Field: Data = Data()

    /** Block Data, Single. */
    open class Data {
        @JvmField var Delete: Boolean = false
        @JvmField var ObjectID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 21
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleDerezContainer(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 104 (DerezContainer).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x68).toByte())
        packUUID(byteBuffer, Data_Field.ObjectID)
        packBoolean(byteBuffer, Data_Field.Delete)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        Data_Field.ObjectID = unpackUUID(byteBuffer)
        Data_Field.Delete = unpackBoolean(byteBuffer)
    }
}
