package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * DeclineFriendship
 *
 * <p>Template: {@code DeclineFriendship Low 298 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class DeclineFriendship : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var TransactionBlock_Field: TransactionBlock = TransactionBlock()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block TransactionBlock, Single. */
    open class TransactionBlock {
        @JvmField var TransactionID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 52
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleDeclineFriendship(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 298 (DeclineFriendship).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x2A).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, TransactionBlock_Field.TransactionID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        TransactionBlock_Field.TransactionID = unpackUUID(byteBuffer)
    }
}
