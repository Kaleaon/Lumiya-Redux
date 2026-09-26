package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * KillChildAgents - A new agent has connected to the simulator . . . make sure that any old child cameras are blitzed
 *
 * <p>Template: {@code KillChildAgents Low 242 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class KillChildAgents : SLMessage() {
    @JvmField var IDBlock_Field: IDBlock = IDBlock()

    /** Block IDBlock, Single. */
    open class IDBlock {
        @JvmField var AgentID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 20
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleKillChildAgents(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 242 (KillChildAgents).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xF2).toByte())
        packUUID(byteBuffer, IDBlock_Field.AgentID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        IDBlock_Field.AgentID = unpackUUID(byteBuffer)
    }
}
