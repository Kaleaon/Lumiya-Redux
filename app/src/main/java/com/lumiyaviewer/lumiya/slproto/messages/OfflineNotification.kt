package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * OfflineNotification
 *
 * <p>Template: {@code OfflineNotification Low 323 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code processOfflineNotification()} in indra/newview/llcallingcard.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class OfflineNotification : SLMessage() {
    @JvmField val AgentBlock_Fields = ArrayList<AgentBlock>()

    /** Block AgentBlock, Variable. */
    open class AgentBlock {
        @JvmField var AgentID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (AgentBlock_Fields.size * 16) + 5
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleOfflineNotification(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 323 (OfflineNotification).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x43).toByte())
        byteBuffer.put((AgentBlock_Fields.size.toByte()))
        for (entry in AgentBlock_Fields) {
            packUUID(byteBuffer, entry.AgentID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val agentBlock = AgentBlock()
            agentBlock.AgentID = unpackUUID(byteBuffer)
            AgentBlock_Fields.add(agentBlock)
        }
    }
}
