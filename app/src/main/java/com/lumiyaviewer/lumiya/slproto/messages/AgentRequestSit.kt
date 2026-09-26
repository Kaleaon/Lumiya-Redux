package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.UUID

/**
 * AgentRequestSit - Try to sit on an object
 *
 * <p>Template: {@code AgentRequestSit High 6 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class AgentRequestSit : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var TargetObject_Field: TargetObject = TargetObject()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block TargetObject, Single. */
    open class TargetObject {
        @JvmField var Offset: LLVector3? = null
        @JvmField var TargetID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 61
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAgentRequestSit(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: High 6 (AgentRequestSit).
        byteBuffer.put((0x06).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, TargetObject_Field.TargetID)
        packLLVector3(byteBuffer, TargetObject_Field.Offset)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        TargetObject_Field.TargetID = unpackUUID(byteBuffer)
        TargetObject_Field.Offset = unpackLLVector3(byteBuffer)
    }
}
