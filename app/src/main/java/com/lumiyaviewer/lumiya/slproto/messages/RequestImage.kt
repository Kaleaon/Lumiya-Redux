package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * Request Image - Sent by the viewer to request a specified image at a specified resolution
 *
 * <p>Template: {@code RequestImage High 8 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class RequestImage : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val RequestImageData_Fields = ArrayList<RequestImageData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    open class RequestImageData {
        @JvmField var DiscardLevel: Int = 0
        @JvmField var DownloadPriority: Float = 0f
        @JvmField var Image: UUID? = null
        @JvmField var Packet: Int = 0
        @JvmField var Type: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (RequestImageData_Fields.size * 26) + 34
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRequestImage(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: High 8 (RequestImage).
        byteBuffer.put((0x08).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        byteBuffer.put((RequestImageData_Fields.size.toByte()))
        for (requestImageData in RequestImageData_Fields) {
            packUUID(byteBuffer, requestImageData.Image)
            packByte(byteBuffer, (requestImageData.DiscardLevel).toByte())
            packFloat(byteBuffer, requestImageData.DownloadPriority)
            packInt(byteBuffer, requestImageData.Packet)
            packByte(byteBuffer, (requestImageData.Type).toByte())
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val requestImageData = RequestImageData()
            requestImageData.Image = unpackUUID(byteBuffer)
            requestImageData.DiscardLevel = unpackByte(byteBuffer).toInt()
            requestImageData.DownloadPriority = unpackFloat(byteBuffer)
            requestImageData.Packet = unpackInt(byteBuffer)
            requestImageData.Type = unpackByte(byteBuffer).toInt() and 0xFF
            RequestImageData_Fields.add(requestImageData)
        }
    }
}
