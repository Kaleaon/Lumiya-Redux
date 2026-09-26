package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Simulator informs Dataserver that attachment has been taken off
 *
 * <p>Template: {@code RemoveAttachment Low 332 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class RemoveAttachment : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var AttachmentBlock_Field: AttachmentBlock = AttachmentBlock()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block AttachmentBlock, Single. */
    open class AttachmentBlock {
        @JvmField var AttachmentPoint: Int = 0
        @JvmField var ItemID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 53
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRemoveAttachment(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 332 (RemoveAttachment).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x4C).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packByte(byteBuffer, (AttachmentBlock_Field.AttachmentPoint).toByte())
        packUUID(byteBuffer, AttachmentBlock_Field.ItemID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        AttachmentBlock_Field.AttachmentPoint = unpackByte(byteBuffer).toInt() and 0xFF
        AttachmentBlock_Field.ItemID = unpackUUID(byteBuffer)
    }
}
