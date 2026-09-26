package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.UUID

/**
 * SetStartLocationRequest
 * viewer -> sim
 * failure checked at sim and triggers ImprovedInstantMessage
 * success triggers SetStartLocation
 *
 * <p>Template: {@code SetStartLocationRequest Low 324 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class SetStartLocationRequest : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var StartLocationData_Field: StartLocationData = StartLocationData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block StartLocationData, Single. */
    open class StartLocationData {
        @JvmField var LocationID: Int = 0
        @JvmField var LocationLookAt: LLVector3? = null
        @JvmField var LocationPos: LLVector3? = null
        @JvmField var SimName: ByteArray? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return StartLocationData_Field.SimName!!.size + 1 + 4 + 12 + 12 + 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleSetStartLocationRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 324 (SetStartLocationRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x44).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packVariable(byteBuffer, StartLocationData_Field.SimName, 1)
        packInt(byteBuffer, StartLocationData_Field.LocationID)
        packLLVector3(byteBuffer, StartLocationData_Field.LocationPos)
        packLLVector3(byteBuffer, StartLocationData_Field.LocationLookAt)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        StartLocationData_Field.SimName = unpackVariable(byteBuffer, 1)
        StartLocationData_Field.LocationID = unpackInt(byteBuffer)
        StartLocationData_Field.LocationPos = unpackLLVector3(byteBuffer)
        StartLocationData_Field.LocationLookAt = unpackLLVector3(byteBuffer)
    }
}
