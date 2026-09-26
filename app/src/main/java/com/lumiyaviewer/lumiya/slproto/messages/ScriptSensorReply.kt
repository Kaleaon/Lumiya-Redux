package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * ScriptSensorReply - returns the request script search information back to the requester
 *
 * <p>Template: {@code ScriptSensorReply Low 248 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class ScriptSensorReply : SLMessage() {
    @JvmField var Requester_Field: Requester = Requester()
    @JvmField val SensedData_Fields = ArrayList<SensedData>()

    /** Block Requester, Single. */
    open class Requester {
        @JvmField var SourceID: UUID? = null
    }

    /** Block SensedData, Variable. */
    open class SensedData {
        @JvmField var GroupID: UUID? = null
        @JvmField var Name: ByteArray? = null
        @JvmField var ObjectID: UUID? = null
        @JvmField var OwnerID: UUID? = null
        @JvmField var Position: LLVector3? = null
        @JvmField var Range: Float = 0f
        @JvmField var Rotation: LLQuaternion? = null
        @JvmField var Type: Int = 0
        @JvmField var Velocity: LLVector3? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        var i = 21
        val it = SensedData_Fields.iterator()
        while (true) {
            val i2 = i
            if (!it.hasNext()) {
                return i2
            }
            i = it.next().Name!!.size + 85 + 4 + 4 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleScriptSensorReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 248 (ScriptSensorReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xF8).toByte())
        packUUID(byteBuffer, Requester_Field.SourceID)
        byteBuffer.put((SensedData_Fields.size.toByte()))
        for (sensedData in SensedData_Fields) {
            packUUID(byteBuffer, sensedData.ObjectID)
            packUUID(byteBuffer, sensedData.OwnerID)
            packUUID(byteBuffer, sensedData.GroupID)
            packLLVector3(byteBuffer, sensedData.Position)
            packLLVector3(byteBuffer, sensedData.Velocity)
            packLLQuaternion(byteBuffer, sensedData.Rotation)
            packVariable(byteBuffer, sensedData.Name, 1)
            packInt(byteBuffer, sensedData.Type)
            packFloat(byteBuffer, sensedData.Range)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        Requester_Field.SourceID = unpackUUID(byteBuffer)
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val sensedData = SensedData()
            sensedData.ObjectID = unpackUUID(byteBuffer)
            sensedData.OwnerID = unpackUUID(byteBuffer)
            sensedData.GroupID = unpackUUID(byteBuffer)
            sensedData.Position = unpackLLVector3(byteBuffer)
            sensedData.Velocity = unpackLLVector3(byteBuffer)
            sensedData.Rotation = unpackLLQuaternion(byteBuffer)
            sensedData.Name = unpackVariable(byteBuffer, 1)
            sensedData.Type = unpackInt(byteBuffer)
            sensedData.Range = unpackFloat(byteBuffer)
            SensedData_Fields.add(sensedData)
        }
    }
}
