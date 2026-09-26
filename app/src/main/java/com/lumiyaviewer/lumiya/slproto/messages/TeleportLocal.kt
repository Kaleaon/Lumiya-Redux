package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.UUID

/**
 * TeleportLocal
 * sim -> viewer reply telling the viewer that we've successfully TP'd
 * to somewhere else within the sim
 *
 * <p>Template: {@code TeleportLocal Low 64 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_teleport_local()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class TeleportLocal : SLMessage() {
    @JvmField var Info_Field: Info = Info()

    /** Block Info, Single. */
    open class Info {
        @JvmField var AgentID: UUID? = null
        @JvmField var LocationID: Int = 0
        @JvmField var LookAt: LLVector3? = null
        @JvmField var Position: LLVector3? = null
        @JvmField var TeleportFlags: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 52
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleTeleportLocal(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 64 (TeleportLocal).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x40).toByte())
        packUUID(byteBuffer, Info_Field.AgentID)
        packInt(byteBuffer, Info_Field.LocationID)
        packLLVector3(byteBuffer, Info_Field.Position)
        packLLVector3(byteBuffer, Info_Field.LookAt)
        packInt(byteBuffer, Info_Field.TeleportFlags)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        Info_Field.AgentID = unpackUUID(byteBuffer)
        Info_Field.LocationID = unpackInt(byteBuffer)
        Info_Field.Position = unpackLLVector3(byteBuffer)
        Info_Field.LookAt = unpackLLVector3(byteBuffer)
        Info_Field.TeleportFlags = unpackInt(byteBuffer)
    }
}
