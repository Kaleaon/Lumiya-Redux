package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * viewer -> sim
 * start an auction. viewer fills in the appropriate date, simulator
 * validates and fills in the rest of the information to start an auction
 * on a parcel. Processing currently requires that AgentID is a god.
 *
 * <p>Template: {@code ViewerStartAuction Low 228 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class ViewerStartAuction : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var ParcelData_Field: ParcelData = ParcelData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block ParcelData, Single. */
    open class ParcelData {
        @JvmField var LocalID: Int = 0
        @JvmField var SnapshotID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 56
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleViewerStartAuction(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 228 (ViewerStartAuction).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xE4).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, ParcelData_Field.LocalID)
        packUUID(byteBuffer, ParcelData_Field.SnapshotID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        ParcelData_Field.LocalID = unpackInt(byteBuffer)
        ParcelData_Field.SnapshotID = unpackUUID(byteBuffer)
    }
}
