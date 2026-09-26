package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * SystemKickUser
 * user->space, reliable
 *
 * <p>Template: {@code SystemKickUser Low 166 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class SystemKickUser : SLMessage() {
    @JvmField val AgentInfo_Fields = ArrayList<AgentInfo>()

    /** Block AgentInfo, Variable. */
    open class AgentInfo {
        @JvmField var AgentID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (AgentInfo_Fields.size * 16) + 5
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleSystemKickUser(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 166 (SystemKickUser).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xA6).toByte())
        byteBuffer.put((AgentInfo_Fields.size.toByte()))
        for (entry in AgentInfo_Fields) {
            packUUID(byteBuffer, entry.AgentID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val agentInfo = AgentInfo()
            agentInfo.AgentID = unpackUUID(byteBuffer)
            AgentInfo_Fields.add(agentInfo)
        }
    }
}
