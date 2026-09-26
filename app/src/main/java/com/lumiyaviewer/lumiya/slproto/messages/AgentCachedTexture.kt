package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * AgentCachedTexture
 * viewer queries for cached textures on dataserver (via simulator)
 * viewer -> simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code AgentCachedTexture Low 384 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class AgentCachedTexture : SLMessage() {
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
        @JvmField var ID: UUID? = null
        @JvmField var TextureIndex: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (WearableData_Fields.size * 17) + 41
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAgentCachedTexture(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 384 (AgentCachedTexture).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x80).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, AgentData_Field.SerialNum)
        byteBuffer.put((WearableData_Fields.size.toByte()))
        for (wearableData in WearableData_Fields) {
            packUUID(byteBuffer, wearableData.ID)
            packByte(byteBuffer, (wearableData.TextureIndex).toByte())
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        AgentData_Field.SerialNum = unpackInt(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val wearableData = WearableData()
            wearableData.ID = unpackUUID(byteBuffer)
            wearableData.TextureIndex = unpackByte(byteBuffer).toInt() and 0xFF
            WearableData_Fields.add(wearableData)
        }
    }
}
