package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * AgentCachedTextureResponse
 * response to viewer queries for cached textures on dataserver (via simulator)
 * dataserver -> simulator -> viewer
 * reliable
 *
 * <p>Template: {@code AgentCachedTextureResponse Low 385 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class AgentCachedTextureResponse : SLMessage() {
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
        @JvmField var HostName: ByteArray? = null
        @JvmField var TextureID: UUID? = null
        @JvmField var TextureIndex: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        var i = 41
        val it = WearableData_Fields.iterator()
        while (true) {
            val i2 = i
            if (!it.hasNext()) {
                return i2
            }
            i = it.next().HostName!!.size + 18 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAgentCachedTextureResponse(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 385 (AgentCachedTextureResponse).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x81).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, AgentData_Field.SerialNum)
        byteBuffer.put((WearableData_Fields.size.toByte()))
        for (wearableData in WearableData_Fields) {
            packUUID(byteBuffer, wearableData.TextureID)
            packByte(byteBuffer, (wearableData.TextureIndex).toByte())
            packVariable(byteBuffer, wearableData.HostName, 1)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        AgentData_Field.SerialNum = unpackInt(byteBuffer)
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val wearableData = WearableData()
            wearableData.TextureID = unpackUUID(byteBuffer)
            wearableData.TextureIndex = unpackByte(byteBuffer).toInt() and 0xFF
            wearableData.HostName = unpackVariable(byteBuffer, 1)
            WearableData_Fields.add(wearableData)
        }
    }
}
