package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * AvatarTextureUpdate
 * simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code AvatarTextureUpdate Low 4 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class AvatarTextureUpdate : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val WearableData_Fields = ArrayList<WearableData>()
    @JvmField val TextureData_Fields = ArrayList<TextureData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var TexturesChanged: Boolean = false
    }

    /** Block TextureData, Variable. */
    open class TextureData {
        @JvmField var TextureID: UUID? = null
    }

    /** Block WearableData, Variable. */
    open class WearableData {
        @JvmField var CacheID: UUID? = null
        @JvmField var HostName: ByteArray? = null
        @JvmField var TextureIndex: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        var i = 22
        val it = WearableData_Fields.iterator()
        while (true) {
            val i2 = i
            if (!it.hasNext()) {
                return i2 + 1 + (TextureData_Fields.size * 16)
            }
            i = it.next().HostName!!.size + 18 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAvatarTextureUpdate(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 4 (AvatarTextureUpdate).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x04).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packBoolean(byteBuffer, AgentData_Field.TexturesChanged)
        byteBuffer.put((WearableData_Fields.size.toByte()))
        for (wearableData in WearableData_Fields) {
            packUUID(byteBuffer, wearableData.CacheID)
            packByte(byteBuffer, (wearableData.TextureIndex).toByte())
            packVariable(byteBuffer, wearableData.HostName, 1)
        }
        byteBuffer.put((TextureData_Fields.size.toByte()))
        for (entry in TextureData_Fields) {
            packUUID(byteBuffer, entry.TextureID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.TexturesChanged = unpackBoolean(byteBuffer)
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val wearableData = WearableData()
            wearableData.CacheID = unpackUUID(byteBuffer)
            wearableData.TextureIndex = unpackByte(byteBuffer).toInt() and 0xFF
            wearableData.HostName = unpackVariable(byteBuffer, 1)
            WearableData_Fields.add(wearableData)
        }
        val i3 = (byteBuffer.get().toInt() and 0xFF)
        repeat(i3) {
            val textureData = TextureData()
            textureData.TextureID = unpackUUID(byteBuffer)
            TextureData_Fields.add(textureData)
        }
    }
}
