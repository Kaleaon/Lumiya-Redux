package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * SimWideDeletes
 *
 * <p>Template: {@code SimWideDeletes Low 129 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class SimWideDeletes : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var DataBlock_Field: DataBlock = DataBlock()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block DataBlock, Single. */
    open class DataBlock {
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
        messageHandler.HandleSimWideDeletes(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 129 (SimWideDeletes).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x81).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, DataBlock_Field.TargetID)
        packInt(byteBuffer, DataBlock_Field.Flags)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        DataBlock_Field.TargetID = unpackUUID(byteBuffer)
        DataBlock_Field.Flags = unpackInt(byteBuffer)
    }
}
