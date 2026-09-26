package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * DetachAttachmentIntoInv
 *
 * <p>Template: {@code DetachAttachmentIntoInv Low 397 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class DetachAttachmentIntoInv : SLMessage() {
    @JvmField var ObjectData_Field: ObjectData = ObjectData()

    /** Block ObjectData, Single. */
    open class ObjectData {
        @JvmField var AgentID: UUID? = null
        @JvmField var ItemID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleDetachAttachmentIntoInv(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 397 (DetachAttachmentIntoInv).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x8D).toByte())
        packUUID(byteBuffer, ObjectData_Field.AgentID)
        packUUID(byteBuffer, ObjectData_Field.ItemID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        ObjectData_Field.AgentID = unpackUUID(byteBuffer)
        ObjectData_Field.ItemID = unpackUUID(byteBuffer)
    }
}
