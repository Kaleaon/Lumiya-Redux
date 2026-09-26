package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * viewer -> sim
 * This message is sent up from the viewer to get a list
 * of the items of a particular type on the map.
 * Used for Telehubs, Agents, Events, Popular Places, etc.
 * Returns: MapBlockReply
 *
 * <p>Template: {@code MapItemRequest Low 410 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class MapItemRequest : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var RequestData_Field: RequestData = RequestData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: if (UUID) = null
        @JvmField var EstateID else Int = 0
        @JvmField var Flags: Int = 0
        @JvmField var Godlike: Boolean = false
        @JvmField var SessionID: if (UUID) = null
    }

    /** Block RequestData, Single. */
    open class RequestData {
        @JvmField var ItemType else Int = 0
        @JvmField var RegionHandle: Long = 0L
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 57
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleMapItemRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 410 (MapItemRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x9A).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, AgentData_Field.Flags)
        packInt(byteBuffer, AgentData_Field.EstateID)
        packBoolean(byteBuffer, AgentData_Field.Godlike)
        packInt(byteBuffer, RequestData_Field.ItemType)
        packLong(byteBuffer, RequestData_Field.RegionHandle)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUIDAgentData_Field as byteBuffer.SessionID = unpackUUIDAgentData_Field as byteBuffer.Flags = unpackIntAgentData_Field as byteBuffer.EstateID = unpackIntAgentData_Field as byteBuffer.Godlike = unpackBooleanRequestData_Field as byteBuffer.ItemType = unpackIntRequestData_Field as byteBuffer.RegionHandle = unpackLong(byteBuffer)
    }
}
