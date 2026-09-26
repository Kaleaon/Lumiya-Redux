package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * ObjectFlagUpdate
 * viewer -> simulator
 *
 * <p>Template: {@code ObjectFlagUpdate Low 94 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class ObjectFlagUpdate : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val ExtraPhysics_Fields = ArrayList<ExtraPhysics>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var CastsShadows: Boolean = false
        @JvmField var IsPhantom: Boolean = false
        @JvmField var IsTemporary: Boolean = false
        @JvmField var ObjectLocalID: Int = 0
        @JvmField var SessionID: UUID? = null
        @JvmField var UsePhysics: Boolean = false
    }

    /** Block ExtraPhysics, Variable. */
    open class ExtraPhysics {
        @JvmField var Density: Float = 0f
        @JvmField var Friction: Float = 0f
        @JvmField var GravityMultiplier: Float = 0f
        @JvmField var PhysicsShapeType: Int = 0
        @JvmField var Restitution: Float = 0f
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return (ExtraPhysics_Fields.size * 17) + 45
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleObjectFlagUpdate(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 94 (ObjectFlagUpdate).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x5E).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, AgentData_Field.ObjectLocalID)
        packBoolean(byteBuffer, AgentData_Field.UsePhysics)
        packBoolean(byteBuffer, AgentData_Field.IsTemporary)
        packBoolean(byteBuffer, AgentData_Field.IsPhantom)
        packBoolean(byteBuffer, AgentData_Field.CastsShadows)
        byteBuffer.put((ExtraPhysics_Fields.size.toByte()))
        for (extraPhysics in ExtraPhysics_Fields) {
            packByte(byteBuffer, (extraPhysics.PhysicsShapeType).toByte())
            packFloat(byteBuffer, extraPhysics.Density)
            packFloat(byteBuffer, extraPhysics.Friction)
            packFloat(byteBuffer, extraPhysics.Restitution)
            packFloat(byteBuffer, extraPhysics.GravityMultiplier)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        AgentData_Field.ObjectLocalID = unpackInt(byteBuffer)
        AgentData_Field.UsePhysics = unpackBoolean(byteBuffer)
        AgentData_Field.IsTemporary = unpackBoolean(byteBuffer)
        AgentData_Field.IsPhantom = unpackBoolean(byteBuffer)
        AgentData_Field.CastsShadows = unpackBoolean(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val extraPhysics = ExtraPhysics()
            extraPhysics.PhysicsShapeType = unpackByte(byteBuffer).toInt() and 0xFF
            extraPhysics.Density = unpackFloat(byteBuffer)
            extraPhysics.Friction = unpackFloat(byteBuffer)
            extraPhysics.Restitution = unpackFloat(byteBuffer)
            extraPhysics.GravityMultiplier = unpackFloat(byteBuffer)
            ExtraPhysics_Fields.add(extraPhysics)
        }
    }
}
