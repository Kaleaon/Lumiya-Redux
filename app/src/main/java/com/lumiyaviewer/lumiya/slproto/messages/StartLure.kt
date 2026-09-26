package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * StartLure viewer->sim
 * Sent from viewer to the local simulator to lure target id to near
 * agent id. This will generate an instant message that will be routed
 * through the space server and out to the userserver. When that IM
 * goes through the userserver and the TargetID is online, the
 * userserver will send an InitializeLure to the spaceserver. When that
 * packet is acked, the original instant message is finally forwarded to
 * TargetID.
 *
 * <p>Template: {@code StartLure Low 70 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class StartLure : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var Info_Field: Info = Info()
    @JvmField val TargetData_Fields = ArrayList<TargetData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block Info, Single. */
    open class Info {
        @JvmField var LureType: Int = 0
        @JvmField var Message: ByteArray? = null
    }

    /** Block TargetData, Variable. */
    open class TargetData {
        @JvmField var TargetID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return Info_Field.Message!!.size + 2 + 36 + 1 + (TargetData_Fields.size * 16)
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleStartLure(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 70 (StartLure).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x46).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packByte(byteBuffer, (Info_Field.LureType).toByte())
        packVariable(byteBuffer, Info_Field.Message, 1)
        byteBuffer.put((TargetData_Fields.size.toByte()))
        for (entry in TargetData_Fields) {
            packUUID(byteBuffer, entry.TargetID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        Info_Field.LureType = unpackByte(byteBuffer).toInt() and 0xFF
        Info_Field.Message = unpackVariable(byteBuffer, 1)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val targetData = TargetData()
            targetData.TargetID = unpackUUID(byteBuffer)
            TargetData_Fields.add(targetData)
        }
    }
}
