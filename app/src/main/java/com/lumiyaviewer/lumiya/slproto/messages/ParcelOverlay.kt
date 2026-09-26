package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer

/**
 * Land Parcel system
 * ParcelOverlay
 * We send N packets per region to the viewer.
 * N = 4, currently.  At 256x256 meter regions, 4x4 meter parcel grid,
 * there are 4096 parcel units per region.  At N = 4, that's 1024 units
 * per packet, allowing 8 bit bytes.
 * sim -> viewer
 * reliable
 *
 * <p>Template: {@code ParcelOverlay Low 196 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLViewerParcelMgr::processParcelOverlay()} in indra/newview/llviewerparcelmgr.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class ParcelOverlay : SLMessage() {
    @JvmField var ParcelData_Field: ParcelData = ParcelData()

    /** Block ParcelData, Single. */
    open class ParcelData {
        @JvmField var Data: ByteArray? = null
        @JvmField var SequenceID: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return ParcelData_Field.Data!!.size + 6 + 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleParcelOverlay(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 196 (ParcelOverlay).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xC4).toByte())
        packInt(byteBuffer, ParcelData_Field.SequenceID)
        packVariable(byteBuffer, ParcelData_Field.Data, 2)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        ParcelData_Field.SequenceID = unpackInt(byteBuffer)
        ParcelData_Field.Data = unpackVariable(byteBuffer, 2)
    }
}
