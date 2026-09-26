package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector4
import java.nio.ByteBuffer

/**
 * CameraConstraint - new camera distance limit (based on collision with objects)
 *
 * <p>Template: {@code CameraConstraint High 22 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_camera_constraint()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class CameraConstraint : SLMessage() {
    @JvmField var CameraCollidePlane_Field: CameraCollidePlane = CameraCollidePlane()

    /** Block CameraCollidePlane, Single. */
    open class CameraCollidePlane {
        @JvmField var Plane: LLVector4? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 17
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleCameraConstraint(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: High 22 (CameraConstraint).
        byteBuffer.put((0x16).toByte())
        packLLVector4(byteBuffer, CameraCollidePlane_Field.Plane)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        CameraCollidePlane_Field.Plane = unpackLLVector4(byteBuffer)
    }
}
