package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * General file transfer
 * RequestXfer - request an arbitrary xfer
 *
 * <p>Template: {@code RequestXfer Low 156 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_request_xfer()} in indra/llmessage/llxfermanager.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class RequestXfer : SLMessage() {
    @JvmField var XferID_Field: XferID = XferID()

    /** Block XferID, Single. */
    open class XferID {
        @JvmField var DeleteOnCompletion: Boolean = false
        @JvmField var FilePath: Int = 0
        @JvmField var Filename: ByteArray? = null
        @JvmField var ID: Long = 0L
        @JvmField var UseBigPackets: Boolean = false
        @JvmField var VFileID: UUID? = null
        @JvmField var VFileType: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return XferID_Field.Filename!!.size + 9 + 1 + 1 + 1 + 16 + 2 + 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRequestXfer(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 156 (RequestXfer).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x9C).toByte())
        packLong(byteBuffer, XferID_Field.ID)
        packVariable(byteBuffer, XferID_Field.Filename, 1)
        packByte(byteBuffer, (XferID_Field.FilePath).toByte())
        packBoolean(byteBuffer, XferID_Field.DeleteOnCompletion)
        packBoolean(byteBuffer, XferID_Field.UseBigPackets)
        packUUID(byteBuffer, XferID_Field.VFileID)
        packShort(byteBuffer, XferID_Field.VFileType.toShort())
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        XferID_Field.ID = unpackLong(byteBuffer)
        XferID_Field.Filename = unpackVariable(byteBuffer, 1)
        XferID_Field.FilePath = unpackByte(byteBuffer).toInt() and 0xFF
        XferID_Field.DeleteOnCompletion = unpackBoolean(byteBuffer)
        XferID_Field.UseBigPackets = unpackBoolean(byteBuffer)
        XferID_Field.VFileID = unpackUUID(byteBuffer)
        XferID_Field.VFileType = unpackShort(byteBuffer).toInt()
    }
}
