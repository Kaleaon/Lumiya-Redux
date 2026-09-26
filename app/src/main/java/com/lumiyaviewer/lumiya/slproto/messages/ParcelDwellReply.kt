package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * dataserver -> sim -> viewer
 * reliable
 *
 * <p>Template: {@code ParcelDwellReply Low 219 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLViewerParcelMgr::processParcelDwellReply()} in indra/newview/llviewerparcelmgr.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class ParcelDwellReply : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var Data_Field: Data = Data()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
    }

    /** Block Data, Single. */
    open class Data {
        @JvmField var Dwell: Float = 0f
        @JvmField var LocalID: Int = 0
        @JvmField var ParcelID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 44
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleParcelDwellReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 219 (ParcelDwellReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xDB).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packInt(byteBuffer, Data_Field.LocalID)
        packUUID(byteBuffer, Data_Field.ParcelID)
        packFloat(byteBuffer, Data_Field.Dwell)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        Data_Field.LocalID = unpackInt(byteBuffer)
        Data_Field.ParcelID = unpackUUID(byteBuffer)
        Data_Field.Dwell = unpackFloat(byteBuffer)
    }
}
