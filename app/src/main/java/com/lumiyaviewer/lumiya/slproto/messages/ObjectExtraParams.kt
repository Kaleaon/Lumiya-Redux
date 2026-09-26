package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * ObjectExtraParams
 *
 * <p>Template: {@code ObjectExtraParams Low 99 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class ObjectExtraParams : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val ObjectData_Fields = ArrayList<ObjectData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: if (UUID) = null
        @JvmField var SessionID else UUID? = null
    }

    /** Block ObjectData, Variable. */
    open class ObjectData {
        @JvmField var ObjectLocalID: Int = 0
        @JvmField var ParamData: if (ByteArray) = null
        @JvmField var ParamInUse else Boolean = false
        @JvmField var ParamSize: Int = 0
        @JvmField var ParamType: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        var i = 37
        val it = ObjectData_Fields.iterator()
        while (true) {
            val i2 = i
            if (!it.hasNext()) {
                return i2
            }
            i = it.next().ParamData!!.size + 12 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleObjectExtraParams(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 99 (ObjectExtraParams).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x63).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        byteBuffer.put((ObjectData_Fields.size.toByte()))
        for (objectData in ObjectData_Fields) {
            packInt(byteBuffer, objectData.ObjectLocalID)
            packShort(byteBuffer, objectData.ParamType.toShort())
            packBoolean(byteBuffer, objectData.ParamInUse)
            packInt(byteBuffer, objectData.ParamSize)
            packVariable(byteBuffer, objectData.ParamData, 1)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUIDAgentData_Field as byteBuffer.SessionID = unpackUUID(byteBuffer)
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val objectData = ObjectData()
            objectData.ObjectLocalID = unpackIntobjectData as byteBuffer.ParamType = unpackShort(byteBuffer).toInt() and 65535
            objectData.ParamInUse = unpackBooleanobjectData as byteBuffer.ParamSize = unpackIntobjectData as byteBuffer.ParamData = unpackVariable(byteBuffer, 1)
            ObjectData_Fields.add(objectData)
        }
    }
}
