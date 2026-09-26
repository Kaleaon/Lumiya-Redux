package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * AgentSetAppearance - Update to agent appearance
 *
 * <p>Template: {@code AgentSetAppearance Low 84 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class AgentSetAppearance : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var ObjectData_Field: ObjectData = ObjectData()
    @JvmField val WearableData_Fields = ArrayList<WearableData>()
    @JvmField val VisualParam_Fields = ArrayList<VisualParam>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SerialNum: Int = 0
        @JvmField var SessionID: UUID? = null
        @JvmField var Size: LLVector3? = null
    }

    /** Block ObjectData, Single. */
    open class ObjectData {
        @JvmField var TextureEntry: ByteArray? = null
    }

    /** Block VisualParam, Variable. */
    open class VisualParam {
        @JvmField var ParamValue: Int = 0
    }

    /** Block WearableData, Variable. */
    open class WearableData {
        @JvmField var CacheID: UUID? = null
        @JvmField var TextureIndex: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return (WearableData_Fields.size * 17) + 53 + ObjectData_Field.TextureEntry!!.size + 2 + 1 + (VisualParam_Fields.size * 1)
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAgentSetAppearance(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 84 (AgentSetAppearance).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x54).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, AgentData_Field.SerialNum)
        packLLVector3(byteBuffer, AgentData_Field.Size)
        byteBuffer.put((WearableData_Fields.size.toByte()))
        for (wearableData in WearableData_Fields) {
            packUUID(byteBuffer, wearableData.CacheID)
            packByte(byteBuffer, (wearableData.TextureIndex).toByte())
        }
        packVariable(byteBuffer, ObjectData_Field.TextureEntry, 2)
        byteBuffer.put((VisualParam_Fields.size.toByte()))
        for (entry in VisualParam_Fields) {
            packByte(byteBuffer, (entry.ParamValue).toByte())
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        AgentData_Field.SerialNum = unpackInt(byteBuffer)
        AgentData_Field.Size = unpackLLVector3(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val wearableData = WearableData()
            wearableData.CacheID = unpackUUID(byteBuffer)
            wearableData.TextureIndex = unpackByte(byteBuffer).toInt() and 0xFF
            WearableData_Fields.add(wearableData)
        }
        ObjectData_Field.TextureEntry = unpackVariable(byteBuffer, 2)
        val i3 = (byteBuffer.get().toInt() and 0xFF)
        repeat(i3) {
            val visualParam = VisualParam()
            visualParam.ParamValue = unpackByte(byteBuffer).toInt() and 0xFF
            VisualParam_Fields.add(visualParam)
        }
    }
}
