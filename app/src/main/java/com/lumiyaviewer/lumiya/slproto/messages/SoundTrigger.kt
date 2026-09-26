package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.UUID

/**
 * GUIDed Sound messages
 * SoundTrigger - Sent by simulator to viewer to trigger sound outside current region
 *
 * <p>Template: {@code SoundTrigger High 29 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code null_message_callback()} in indra/llmessage/message.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class SoundTrigger : SLMessage() {
    @JvmField var SoundData_Field: SoundData = SoundData()

    /** Block SoundData, Single. */
    open class SoundData {
        @JvmField var Gain: Float = 0f
        @JvmField var Handle: Long = 0L
        @JvmField var ObjectID: UUID? = null
        @JvmField var OwnerID: UUID? = null
        @JvmField var ParentID: UUID? = null
        @JvmField var Position: LLVector3? = null
        @JvmField var SoundID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 89
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleSoundTrigger(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: High 29 (SoundTrigger).
        byteBuffer.put((0x1D).toByte())
        packUUID(byteBuffer, SoundData_Field.SoundID)
        packUUID(byteBuffer, SoundData_Field.OwnerID)
        packUUID(byteBuffer, SoundData_Field.ObjectID)
        packUUID(byteBuffer, SoundData_Field.ParentID)
        packLong(byteBuffer, SoundData_Field.Handle)
        packLLVector3(byteBuffer, SoundData_Field.Position)
        packFloat(byteBuffer, SoundData_Field.Gain)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        SoundData_Field.SoundID = unpackUUID(byteBuffer)
        SoundData_Field.OwnerID = unpackUUID(byteBuffer)
        SoundData_Field.ObjectID = unpackUUID(byteBuffer)
        SoundData_Field.ParentID = unpackUUID(byteBuffer)
        SoundData_Field.Handle = unpackLong(byteBuffer)
        SoundData_Field.Position = unpackLLVector3(byteBuffer)
        SoundData_Field.Gain = unpackFloat(byteBuffer)
    }
}
