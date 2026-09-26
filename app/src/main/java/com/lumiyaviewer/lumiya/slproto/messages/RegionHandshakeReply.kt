package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * RegionHandshakeReply
 * viewer -> sim
 * reliable
 * Sent after viewer has initialized the (pre-existing)
 * LLViewerRegion with the name, access level, etc. and
 * has loaded the cache for the region.
 * After the simulator receives this, it will start sending
 * data about objects.
 *
 * <p>Template: {@code RegionHandshakeReply Low 149 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class RegionHandshakeReply : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var RegionInfo_Field: RegionInfo = RegionInfo()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block RegionInfo, Single. */
    open class RegionInfo {
        @JvmField var Flags: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 40
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRegionHandshakeReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 149 (RegionHandshakeReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x95).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, RegionInfo_Field.Flags)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        RegionInfo_Field.Flags = unpackInt(byteBuffer)
    }
}
