package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * map messages
 * viewer -> sim
 * reliable
 * This message is sent up from the viewer to (eventually) get a list
 * of all map layers and NULL-layer sims.
 * Returns: MapLayerReply and MapBlockReply
 *
 * <p>Template: {@code MapLayerRequest Low 405 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class MapLayerRequest : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var EstateID: Int = 0
        @JvmField var Flags: Int = 0
        @JvmField var Godlike: Boolean = false
        @JvmField var SessionID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 45
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleMapLayerRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 405 (MapLayerRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x95).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, AgentData_Field.Flags)
        packInt(byteBuffer, AgentData_Field.EstateID)
        packBoolean(byteBuffer, AgentData_Field.Godlike)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        AgentData_Field.Flags = unpackInt(byteBuffer)
        AgentData_Field.EstateID = unpackInt(byteBuffer)
        AgentData_Field.Godlike = unpackBoolean(byteBuffer)
    }
}
