package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * AgentWearablesUpdate
 * (a.k.a. "Here's what your avatar should be wearing now.")
 * dataserver -> userserver -> viewer
 * reliable
 * NEVER from viewer to sim
 *
 * <p>Template: {@code AgentWearablesUpdate Low 382 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class AgentWearablesUpdate : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val WearableData_Fields = ArrayList<WearableData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SerialNum: Int = 0
        @JvmField var SessionID: UUID? = null
    }

    /** Block WearableData, Variable. */
    open class WearableData {
        @JvmField var AssetID: UUID? = null
        @JvmField var ItemID: UUID? = null
        @JvmField var WearableType: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return (WearableData_Fields.size * 33) + 41
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAgentWearablesUpdate(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 382 (AgentWearablesUpdate).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x7E).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, AgentData_Field.SerialNum)
        byteBuffer.put((WearableData_Fields.size.toByte()))
        for (wearableData in WearableData_Fields) {
            packUUID(byteBuffer, wearableData.ItemID)
            packUUID(byteBuffer, wearableData.AssetID)
            packByte(byteBuffer, (wearableData.WearableType).toByte())
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        AgentData_Field.SerialNum = unpackInt(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val wearableData = WearableData()
            wearableData.ItemID = unpackUUID(byteBuffer)
            wearableData.AssetID = unpackUUID(byteBuffer)
            wearableData.WearableType = unpackByte(byteBuffer).toInt() and 0xFF
            WearableData_Fields.add(wearableData)
        }
    }
}
