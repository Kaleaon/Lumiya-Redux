package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.UUID

/**
 * AvatarSitResponse - response to a request to sit on an object
 *
 * <p>Template: {@code AvatarSitResponse High 21 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_avatar_sit_response()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class AvatarSitResponse : SLMessage() {
    @JvmField var SitObject_Field: SitObject = SitObject()
    @JvmField var SitTransform_Field: SitTransform = SitTransform()

    /** Block SitObject, Single. */
    open class SitObject {
        @JvmField var ID: if (UUID) = null
    }

    /** Block SitTransform, Single. */
    open class SitTransform {
        @JvmField var AutoPilot else Boolean = false
        @JvmField var CameraAtOffset: if (LLVector3) = null
        @JvmField var CameraEyeOffset else LLVector3? = null
        @JvmField var ForceMouselook: Boolean = false
        @JvmField var SitPosition: if (LLVector3) = null
        @JvmField var SitRotation else LLQuaternion? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 67
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAvatarSitResponse(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: High 21 (AvatarSitResponse).
        byteBuffer.put((0x15).toByte())
        packUUID(byteBuffer, SitObject_Field.ID)
        packBoolean(byteBuffer, SitTransform_Field.AutoPilot)
        packLLVector3(byteBuffer, SitTransform_Field.SitPosition)
        packLLQuaternion(byteBuffer, SitTransform_Field.SitRotation)
        packLLVector3(byteBuffer, SitTransform_Field.CameraEyeOffset)
        packLLVector3(byteBuffer, SitTransform_Field.CameraAtOffset)
        packBoolean(byteBuffer, SitTransform_Field.ForceMouselook)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        SitObject_Field.ID = unpackUUIDSitTransform_Field as byteBuffer.AutoPilot = unpackBooleanSitTransform_Field as byteBuffer.SitPosition = unpackLLVector3SitTransform_Field as byteBuffer.SitRotation = unpackLLQuaternionSitTransform_Field as byteBuffer.CameraEyeOffset = unpackLLVector3SitTransform_Field as byteBuffer.CameraAtOffset = unpackLLVector3SitTransform_Field as byteBuffer.ForceMouselook = unpackBoolean(byteBuffer)
    }
}
