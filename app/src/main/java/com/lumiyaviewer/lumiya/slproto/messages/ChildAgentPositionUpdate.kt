package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ChildAgentPositionUpdate
 * sent to child agents just to keep them alive
 *
 * <p>Template: {@code ChildAgentPositionUpdate High 27 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class ChildAgentPositionUpdate : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var AgentPos: LLVector3? = null
        @JvmField var AgentVel: LLVector3? = null
        @JvmField var AtAxis: LLVector3? = null
        @JvmField var Center: LLVector3? = null
        @JvmField var ChangedGrid: Boolean = false
        @JvmField var LeftAxis: LLVector3? = null
        @JvmField var RegionHandle: Long = 0L
        @JvmField var SessionID: UUID? = null
        @JvmField var Size: LLVector3? = null
        @JvmField var UpAxis: LLVector3? = null
        @JvmField var ViewerCircuitCode: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 130
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleChildAgentPositionUpdate(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: High 27 (ChildAgentPositionUpdate).
        byteBuffer.put((0x1B).toByte())
        packLong(byteBuffer, AgentData_Field.RegionHandle)
        packInt(byteBuffer, AgentData_Field.ViewerCircuitCode)
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packLLVector3(byteBuffer, AgentData_Field.AgentPos)
        packLLVector3(byteBuffer, AgentData_Field.AgentVel)
        packLLVector3(byteBuffer, AgentData_Field.Center)
        packLLVector3(byteBuffer, AgentData_Field.Size)
        packLLVector3(byteBuffer, AgentData_Field.AtAxis)
        packLLVector3(byteBuffer, AgentData_Field.LeftAxis)
        packLLVector3(byteBuffer, AgentData_Field.UpAxis)
        packBoolean(byteBuffer, AgentData_Field.ChangedGrid)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.RegionHandle = unpackLong(byteBuffer)
        AgentData_Field.ViewerCircuitCode = unpackInt(byteBuffer)
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        AgentData_Field.AgentPos = unpackLLVector3(byteBuffer)
        AgentData_Field.AgentVel = unpackLLVector3(byteBuffer)
        AgentData_Field.Center = unpackLLVector3(byteBuffer)
        AgentData_Field.Size = unpackLLVector3(byteBuffer)
        AgentData_Field.AtAxis = unpackLLVector3(byteBuffer)
        AgentData_Field.LeftAxis = unpackLLVector3(byteBuffer)
        AgentData_Field.UpAxis = unpackLLVector3(byteBuffer)
        AgentData_Field.ChangedGrid = unpackBoolean(byteBuffer)
    }
}
