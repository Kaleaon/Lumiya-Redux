package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * This message is sent from the simulator to the viewer to indicate a
 * targets granted rights. This is only sent to the originator of the
 * request and the target agent if it is a modify or map
 * right. Adding/removing online status rights will show up as an
 * online/offline notification.
 *
 * <p>Template: {@code ChangeUserRights Low 321 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code processChangeUserRights()} in indra/newview/llcallingcard.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class ChangeUserRights : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val Rights_Fields = ArrayList<Rights>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
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
        return (Rights_Fields.size * 20) + 21
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleChangeUserRights(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 321 (ChangeUserRights).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x41).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        byteBuffer.put((Rights_Fields.size.toByte()))
        for (rights in Rights_Fields) {
            packUUID(byteBuffer, rights.AgentRelated)
            packInt(byteBuffer, rights.RelatedRights)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val rights = Rights()
            rights.AgentRelated = unpackUUID(byteBuffer)
            rights.RelatedRights = unpackInt(byteBuffer)
            Rights_Fields.add(rights)
        }
    }
}
