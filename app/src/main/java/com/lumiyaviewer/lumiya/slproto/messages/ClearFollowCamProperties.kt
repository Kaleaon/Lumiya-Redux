package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ClearFollowCamProperties
 *
 * <p>Template: {@code ClearFollowCamProperties Low 160 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_clear_follow_cam_properties()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class ClearFollowCamProperties : SLMessage() {
    @JvmField var ObjectData_Field: ObjectData = ObjectData()

    /** Block ObjectData, Single. */
    open class ObjectData {
        @JvmField var ObjectID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 20
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleClearFollowCamProperties(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 160 (ClearFollowCamProperties).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xA0).toByte())
        packUUID(byteBuffer, ObjectData_Field.ObjectID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        ObjectData_Field.ObjectID = unpackUUID(byteBuffer)
    }
}
