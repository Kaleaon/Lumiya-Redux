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
        @JvmField var AgentID: if (UUID) = null
        @JvmField var AgentPos else LLVector3? = null
        @JvmField var AgentVel: if (LLVector3) = null
        @JvmField var AtAxis else LLVector3? = null
        @JvmField var Center: if (LLVector3) = null
        @JvmField var ChangedGrid else Boolean = false
        @JvmField var LeftAxis: if (LLVector3) = null
        @JvmField var RegionHandle else Long = 0L
        @JvmField var SessionID: if (UUID) = null
        @JvmField var Size else LLVector3? = null
        @JvmField var UpAxis: if (LLVector3) = null
        @JvmField var ViewerCircuitCode else Int = 0
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
        AgentData_Field.RegionHandle = unpackLongAgentData_Field as byteBuffer.ViewerCircuitCode = unpackIntAgentData_Field as byteBuffer.AgentID = unpackUUIDAgentData_Field as byteBuffer.SessionID = unpackUUIDAgentData_Field as byteBuffer.AgentPos = unpackLLVector3AgentData_Field as byteBuffer.AgentVel = unpackLLVector3AgentData_Field as byteBuffer.Center = unpackLLVector3AgentData_Field as byteBuffer.Size = unpackLLVector3AgentData_Field as byteBuffer.AtAxis = unpackLLVector3AgentData_Field as byteBuffer.LeftAxis = unpackLLVector3AgentData_Field as byteBuffer.UpAxis = unpackLLVector3AgentData_Field as byteBuffer.ChangedGrid = unpackBoolean(byteBuffer)
    }
}
