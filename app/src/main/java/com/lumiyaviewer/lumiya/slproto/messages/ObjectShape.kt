package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * ObjectShape
 *
 * <p>Template: {@code ObjectShape Low 98 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class ObjectShape : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val ObjectData_Fields = ArrayList<ObjectData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block ObjectData, Variable. */
    open class ObjectData {
        @JvmField var ObjectLocalID: Int = 0
        @JvmField var PathBegin: Int = 0
        @JvmField var PathCurve: Int = 0
        @JvmField var PathEnd: Int = 0
        @JvmField var PathRadiusOffset: Int = 0
        @JvmField var PathRevolutions: Int = 0
        @JvmField var PathScaleX: Int = 0
        @JvmField var PathScaleY: Int = 0
        @JvmField var PathShearX: Int = 0
        @JvmField var PathShearY: Int = 0
        @JvmField var PathSkew: Int = 0
        @JvmField var PathTaperX: Int = 0
        @JvmField var PathTaperY: Int = 0
        @JvmField var PathTwist: Int = 0
        @JvmField var PathTwistBegin: Int = 0
        @JvmField var ProfileBegin: Int = 0
        @JvmField var ProfileCurve: Int = 0
        @JvmField var ProfileEnd: Int = 0
        @JvmField var ProfileHollow: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return (ObjectData_Fields.size * 27) + 37
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleObjectShape(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 98 (ObjectShape).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x62).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        byteBuffer.put((ObjectData_Fields.size.toByte()))
        for (objectData in ObjectData_Fields) {
            packInt(byteBuffer, objectData.ObjectLocalID)
            packByte(byteBuffer, (objectData.PathCurve).toByte())
            packByte(byteBuffer, (objectData.ProfileCurve).toByte())
            packShort(byteBuffer, objectData.PathBegin.toShort())
            packShort(byteBuffer, objectData.PathEnd.toShort())
            packByte(byteBuffer, (objectData.PathScaleX).toByte())
            packByte(byteBuffer, (objectData.PathScaleY).toByte())
            packByte(byteBuffer, (objectData.PathShearX).toByte())
            packByte(byteBuffer, (objectData.PathShearY).toByte())
            packByte(byteBuffer, (objectData.PathTwist).toByte())
            packByte(byteBuffer, (objectData.PathTwistBegin).toByte())
            packByte(byteBuffer, (objectData.PathRadiusOffset).toByte())
            packByte(byteBuffer, (objectData.PathTaperX).toByte())
            packByte(byteBuffer, (objectData.PathTaperY).toByte())
            packByte(byteBuffer, (objectData.PathRevolutions).toByte())
            packByte(byteBuffer, (objectData.PathSkew).toByte())
            packShort(byteBuffer, objectData.ProfileBegin.toShort())
            packShort(byteBuffer, objectData.ProfileEnd.toShort())
            packShort(byteBuffer, objectData.ProfileHollow.toShort())
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val objectData = ObjectData()
            objectData.ObjectLocalID = unpackInt(byteBuffer)
            objectData.PathCurve = unpackByte(byteBuffer).toInt() and 0xFF
            objectData.ProfileCurve = unpackByte(byteBuffer).toInt() and 0xFF
            objectData.PathBegin = unpackShort(byteBuffer).toInt() and 65535
            objectData.PathEnd = unpackShort(byteBuffer).toInt() and 65535
            objectData.PathScaleX = unpackByte(byteBuffer).toInt() and 0xFF
            objectData.PathScaleY = unpackByte(byteBuffer).toInt() and 0xFF
            objectData.PathShearX = unpackByte(byteBuffer).toInt() and 0xFF
            objectData.PathShearY = unpackByte(byteBuffer).toInt() and 0xFF
            objectData.PathTwist = unpackByte(byteBuffer).toInt()
            objectData.PathTwistBegin = unpackByte(byteBuffer).toInt()
            objectData.PathRadiusOffset = unpackByte(byteBuffer).toInt()
            objectData.PathTaperX = unpackByte(byteBuffer).toInt()
            objectData.PathTaperY = unpackByte(byteBuffer).toInt()
            objectData.PathRevolutions = unpackByte(byteBuffer).toInt() and 0xFF
            objectData.PathSkew = unpackByte(byteBuffer).toInt()
            objectData.ProfileBegin = unpackShort(byteBuffer).toInt() and 65535
            objectData.ProfileEnd = unpackShort(byteBuffer).toInt() and 65535
            objectData.ProfileHollow = unpackShort(byteBuffer).toInt() and 65535
            ObjectData_Fields.add(objectData)
        }
    }
}
