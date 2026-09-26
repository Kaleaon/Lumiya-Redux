package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * SetAlwaysRun
 * Lets the viewer choose between running and walking
 *
 * <p>Template: {@code SetAlwaysRun Low 88 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class SetAlwaysRun : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var AlwaysRun: Boolean = false
        @JvmField var SessionID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 37
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleSetAlwaysRun(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 88 (SetAlwaysRun).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x58).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packBoolean(byteBuffer, AgentData_Field.AlwaysRun)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        AgentData_Field.AlwaysRun = unpackBoolean(byteBuffer)
    }
}
