package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * FreezeUser
 * Freeze someone who is on my land.
 * viewer -> sim
 * reliable
 *
 * <p>Template: {@code FreezeUser Low 168 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class FreezeUser : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var Data_Field: Data = Data()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block Data, Single. */
    open class Data {
        @JvmField var Flags: Int = 0
        @JvmField var TargetID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 56
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleFreezeUser(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 168 (FreezeUser).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xA8).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, Data_Field.TargetID)
        packInt(byteBuffer, Data_Field.Flags)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        Data_Field.TargetID = unpackUUID(byteBuffer)
        Data_Field.Flags = unpackInt(byteBuffer)
    }
}
