package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * SetFollowCamProperties
 *
 * <p>Template: {@code SetFollowCamProperties Low 159 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_set_follow_cam_properties()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class SetFollowCamProperties : SLMessage() {
    @JvmField val CameraProperty_Fields = ArrayList<CameraProperty>()
    @JvmField var ObjectData_Field: ObjectData = ObjectData()

    /** Block CameraProperty, Variable. */
    open class CameraProperty {
        @JvmField var Type: Int = 0
        @JvmField var Value: Float = 0f
    }

    /** Block ObjectData, Single. */
    open class ObjectData {
        @JvmField var ObjectID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (CameraProperty_Fields.size * 8) + 21
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleSetFollowCamProperties(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 159 (SetFollowCamProperties).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x9F).toByte())
        packUUID(byteBuffer, ObjectData_Field.ObjectID)
        byteBuffer.put((CameraProperty_Fields.size.toByte()))
        for (cameraProperty in CameraProperty_Fields) {
            packInt(byteBuffer, cameraProperty.Type)
            packFloat(byteBuffer, cameraProperty.Value)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        ObjectData_Field.ObjectID = unpackUUID(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val cameraProperty = CameraProperty()
            cameraProperty.Type = unpackInt(byteBuffer)
            cameraProperty.Value = unpackFloat(byteBuffer)
            CameraProperty_Fields.add(cameraProperty)
        }
    }
}
