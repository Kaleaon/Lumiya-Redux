package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.UUID

/**
 * sim -> viewer
 *
 * <p>Template: {@code AgentMovementComplete Low 250 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_agent_movement_complete()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class AgentMovementComplete : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var Data_Field: Data = Data()
    @JvmField var SimData_Field: SimData = SimData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block Data, Single. */
    open class Data {
        @JvmField var LookAt: LLVector3? = null
        @JvmField var Position: LLVector3? = null
        @JvmField var RegionHandle: Long = 0L
        @JvmField var Timestamp: Int = 0
    }

    /** Block SimData, Single. */
    open class SimData {
        @JvmField var ChannelVersion: ByteArray? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return SimData_Field.ChannelVersion!!.size + 2 + 72
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAgentMovementComplete(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 250 (AgentMovementComplete).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xFA).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packLLVector3(byteBuffer, Data_Field.Position)
        packLLVector3(byteBuffer, Data_Field.LookAt)
        packLong(byteBuffer, Data_Field.RegionHandle)
        packInt(byteBuffer, Data_Field.Timestamp)
        packVariable(byteBuffer, SimData_Field.ChannelVersion, 2)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        Data_Field.Position = unpackLLVector3(byteBuffer)
        Data_Field.LookAt = unpackLLVector3(byteBuffer)
        Data_Field.RegionHandle = unpackLong(byteBuffer)
        Data_Field.Timestamp = unpackInt(byteBuffer)
        SimData_Field.ChannelVersion = unpackVariable(byteBuffer, 2)
    }
}
