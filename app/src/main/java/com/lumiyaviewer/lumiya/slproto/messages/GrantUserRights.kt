package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * Sent from viewer to simulator to set user rights. This message will be
 * relayed up to the dataserver through a PUT. If that
 * succeeds, an UpdateUserRights will be relayed to the originating
 * viewer, and a presence lookup will be performed to find
 * agent-related and the same PUT will be issued to the sim host if
 * they are online.
 *
 * <p>Template: {@code GrantUserRights Low 320 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class GrantUserRights : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val Rights_Fields = ArrayList<Rights>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block Rights, Variable. */
    open class Rights {
        @JvmField var AgentRelated: UUID? = null
        @JvmField var RelatedRights: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (Rights_Fields.size * 20) + 37
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleGrantUserRights(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 320 (GrantUserRights).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x40).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        byteBuffer.put((Rights_Fields.size.toByte()))
        for (rights in Rights_Fields) {
            packUUID(byteBuffer, rights.AgentRelated)
            packInt(byteBuffer, rights.RelatedRights)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val rights = Rights()
            rights.AgentRelated = unpackUUID(byteBuffer)
            rights.RelatedRights = unpackInt(byteBuffer)
            Rights_Fields.add(rights)
        }
    }
}
