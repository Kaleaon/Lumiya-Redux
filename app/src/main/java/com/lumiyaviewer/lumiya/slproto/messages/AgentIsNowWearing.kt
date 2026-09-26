package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * AgentIsNowWearing
 * (a.k.a. "Here's what I'm wearing now.")
 * viewer->sim->dataserver
 * reliable
 *
 * <p>Template: {@code AgentIsNowWearing Low 383 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class AgentIsNowWearing : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val WearableData_Fields = ArrayList<WearableData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block WearableData, Variable. */
    open class WearableData {
        @JvmField var ItemID: UUID? = null
        @JvmField var WearableType: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return (WearableData_Fields.size * 17) + 37
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAgentIsNowWearing(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 383 (AgentIsNowWearing).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x7F).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        byteBuffer.put((WearableData_Fields.size.toByte()))
        for (wearableData in WearableData_Fields) {
            packUUID(byteBuffer, wearableData.ItemID)
            packByte(byteBuffer, (wearableData.WearableType).toByte())
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val wearableData = WearableData()
            wearableData.ItemID = unpackUUID(byteBuffer)
            wearableData.WearableType = unpackByte(byteBuffer).toInt() and 0xFF
            WearableData_Fields.add(wearableData)
        }
    }
}
