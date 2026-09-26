package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer

/**
 * ScriptTeleportRequest
 * Interestingly, this message does not actually "Request a Teleport"
 * on the viewer. Instead it opens the world map and places a beacon
 * at the indicated location.
 * reliable
 *
 * <p>Template: {@code ScriptTeleportRequest Low 195 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_script_teleport_request()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class ScriptTeleportRequest : SLMessage() {
    @JvmField var Data_Field: Data = Data()

    /** Block Data, Single. */
    open class Data {
        @JvmField var LookAt: LLVector3? = null
        @JvmField var ObjectName: ByteArray? = null
        @JvmField var SimName: ByteArray? = null
        @JvmField var SimPosition: LLVector3? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return Data_Field.ObjectName!!.size + 1 + 1 + Data_Field.SimName!!.size + 12 + 12 + 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleScriptTeleportRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 195 (ScriptTeleportRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xC3).toByte())
        packVariable(byteBuffer, Data_Field.ObjectName, 1)
        packVariable(byteBuffer, Data_Field.SimName, 1)
        packLLVector3(byteBuffer, Data_Field.SimPosition)
        packLLVector3(byteBuffer, Data_Field.LookAt)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        Data_Field.ObjectName = unpackVariable(byteBuffer, 1)
        Data_Field.SimName = unpackVariable(byteBuffer, 1)
        Data_Field.SimPosition = unpackLLVector3(byteBuffer)
        Data_Field.LookAt = unpackLLVector3(byteBuffer)
    }
}
