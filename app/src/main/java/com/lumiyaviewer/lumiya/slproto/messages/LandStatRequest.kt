package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * LandStatRequest
 * Sent by the viewer to request collider/script information for a parcel
 *
 * <p>Template: {@code LandStatRequest Low 421 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class LandStatRequest : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var RequestData_Field: RequestData = RequestData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block RequestData, Single. */
    open class RequestData {
        @JvmField var Filter: ByteArray? = null
        @JvmField var ParcelLocalID: Int = 0
        @JvmField var ReportType: Int = 0
        @JvmField var RequestFlags: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return RequestData_Field.Filter!!.size + 9 + 4 + 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleLandStatRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 421 (LandStatRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0xA5).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, RequestData_Field.ReportType)
        packInt(byteBuffer, RequestData_Field.RequestFlags)
        packVariable(byteBuffer, RequestData_Field.Filter, 1)
        packInt(byteBuffer, RequestData_Field.ParcelLocalID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        RequestData_Field.ReportType = unpackInt(byteBuffer)
        RequestData_Field.RequestFlags = unpackInt(byteBuffer)
        RequestData_Field.Filter = unpackVariable(byteBuffer, 1)
        RequestData_Field.ParcelLocalID = unpackInt(byteBuffer)
    }
}
