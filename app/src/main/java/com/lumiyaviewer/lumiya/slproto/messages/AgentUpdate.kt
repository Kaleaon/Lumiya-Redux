package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.UUID

/**
 * AgentUpdate - Camera info sent from viewer to simulator
 * or, more simply, two axes and compute cross product
 * State data is temporary, indicates current behavior state:
 * 0 = walking
 * 1 = mouselook
 * 2 = typing
 * Center is region local (JNC 8.16.2001)
 * Camera center is region local (JNC 8.29.2001)
 *
 * <p>Template: {@code AgentUpdate High 4 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class AgentUpdate : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var BodyRotation: LLQuaternion? = null
        @JvmField var CameraAtAxis: LLVector3? = null
        @JvmField var CameraCenter: LLVector3? = null
        @JvmField var CameraLeftAxis: LLVector3? = null
        @JvmField var CameraUpAxis: LLVector3? = null
        @JvmField var ControlFlags: Int = 0
        @JvmField var Far: Float = 0f
        @JvmField var Flags: Int = 0
        @JvmField var HeadRotation: LLQuaternion? = null
        @JvmField var SessionID: UUID? = null
        @JvmField var State: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 115
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAgentUpdate(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: High 4 (AgentUpdate).
        byteBuffer.put((0x04).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packLLQuaternion(byteBuffer, AgentData_Field.BodyRotation)
        packLLQuaternion(byteBuffer, AgentData_Field.HeadRotation)
        packByte(byteBuffer, (AgentData_Field.State).toByte())
        packLLVector3(byteBuffer, AgentData_Field.CameraCenter)
        packLLVector3(byteBuffer, AgentData_Field.CameraAtAxis)
        packLLVector3(byteBuffer, AgentData_Field.CameraLeftAxis)
        packLLVector3(byteBuffer, AgentData_Field.CameraUpAxis)
        packFloat(byteBuffer, AgentData_Field.Far)
        packInt(byteBuffer, AgentData_Field.ControlFlags)
        packByte(byteBuffer, (AgentData_Field.Flags).toByte())
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        AgentData_Field.BodyRotation = unpackLLQuaternion(byteBuffer)
        AgentData_Field.HeadRotation = unpackLLQuaternion(byteBuffer)
        AgentData_Field.State = unpackByte(byteBuffer).toInt() and 0xFF
        AgentData_Field.CameraCenter = unpackLLVector3(byteBuffer)
        AgentData_Field.CameraAtAxis = unpackLLVector3(byteBuffer)
        AgentData_Field.CameraLeftAxis = unpackLLVector3(byteBuffer)
        AgentData_Field.CameraUpAxis = unpackLLVector3(byteBuffer)
        AgentData_Field.Far = unpackFloat(byteBuffer)
        AgentData_Field.ControlFlags = unpackInt(byteBuffer)
        AgentData_Field.Flags = unpackByte(byteBuffer).toInt() and 0xFF
    }
}
