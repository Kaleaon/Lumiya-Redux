package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * backend implementation which tracks if the user is a god.
 *
 * <p>Template: {@code AvatarPickerRequestBackend Low 27 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class AvatarPickerRequestBackend : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var Data_Field: Data = Data()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var GodLevel: Int = 0
        @JvmField var QueryID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block Data, Single. */
    open class Data {
        @JvmField var Name: ByteArray? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return Data_Field.Name!!.size + 1 + 53
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAvatarPickerRequestBackend(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 27 (AvatarPickerRequestBackend).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x1B).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, AgentData_Field.QueryID)
        packByte(byteBuffer, (AgentData_Field.GodLevel).toByte())
        packVariable(byteBuffer, Data_Field.Name, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        AgentData_Field.QueryID = unpackUUID(byteBuffer)
        AgentData_Field.GodLevel = unpackByte(byteBuffer).toInt() and 0xFF
        Data_Field.Name = unpackVariable(byteBuffer, 1)
    }
}
