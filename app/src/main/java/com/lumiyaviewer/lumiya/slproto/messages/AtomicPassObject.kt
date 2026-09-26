package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * This message is sent how objects get passed between regions.
 *
 * <p>Template: {@code AtomicPassObject High 28 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class AtomicPassObject : SLMessage() {
    @JvmField var TaskData_Field: TaskData = TaskData()

    /** Block TaskData, Single. */
    open class TaskData {
        @JvmField var AttachmentNeedsSave: Boolean = false
        @JvmField var TaskID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 18
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAtomicPassObject(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: High 28 (AtomicPassObject).
        byteBuffer.put((0x1C).toByte())
        packUUID(byteBuffer, TaskData_Field.TaskID)
        packBoolean(byteBuffer, TaskData_Field.AttachmentNeedsSave)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        TaskData_Field.TaskID = unpackUUID(byteBuffer)
        TaskData_Field.AttachmentNeedsSave = unpackBoolean(byteBuffer)
    }
}
