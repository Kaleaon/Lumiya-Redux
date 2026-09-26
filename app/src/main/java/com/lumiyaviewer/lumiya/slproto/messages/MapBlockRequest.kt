package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * viewer -> sim
 * This message is sent up from the viewer to get a list
 * of the sims in a specified region.
 * Returns: MapBlockReply
 *
 * <p>Template: {@code MapBlockRequest Low 407 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class MapBlockRequest : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var PositionData_Field: PositionData = PositionData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var EstateID: Int = 0
        @JvmField var Flags: Int = 0
        @JvmField var Godlike: Boolean = false
        @JvmField var SessionID: UUID? = null
    }

    /** Block PositionData, Single. */
    open class PositionData {
        @JvmField var MaxX: Int = 0
        @JvmField var MaxY: Int = 0
        @JvmField var MinX: Int = 0
        @JvmField var MinY: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 53
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleMapBlockRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 407 (MapBlockRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x97).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, AgentData_Field.Flags)
        packInt(byteBuffer, AgentData_Field.EstateID)
        packBoolean(byteBuffer, AgentData_Field.Godlike)
        packShort(byteBuffer, PositionData_Field.MinX.toShort())
        packShort(byteBuffer, PositionData_Field.MaxX.toShort())
        packShort(byteBuffer, PositionData_Field.MinY.toShort())
        packShort(byteBuffer, PositionData_Field.MaxY.toShort())
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        AgentData_Field.Flags = unpackInt(byteBuffer)
        AgentData_Field.EstateID = unpackInt(byteBuffer)
        AgentData_Field.Godlike = unpackBoolean(byteBuffer)
        PositionData_Field.MinX = unpackShort(byteBuffer).toInt() and 65535
        PositionData_Field.MaxX = unpackShort(byteBuffer).toInt() and 65535
        PositionData_Field.MinY = unpackShort(byteBuffer).toInt() and 65535
        PositionData_Field.MaxY = unpackShort(byteBuffer).toInt() and 65535
    }
}
