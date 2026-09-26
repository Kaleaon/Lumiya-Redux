package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.UUID

/**
 * DataHomeLocationReply data->sim
 * response is the location of agent home.
 *
 * <p>Template: {@code DataHomeLocationReply Low 68 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class DataHomeLocationReply : SLMessage() {
    @JvmField var Info_Field: Info = Info()

    /** Block Info, Single. */
    open class Info {
        @JvmField var AgentID: UUID? = null
        @JvmField var LookAt: LLVector3? = null
        @JvmField var Position: LLVector3? = null
        @JvmField var RegionHandle: Long = 0L
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 52
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleDataHomeLocationReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 68 (DataHomeLocationReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x44).toByte())
        packUUID(byteBuffer, Info_Field.AgentID)
        packLong(byteBuffer, Info_Field.RegionHandle)
        packLLVector3(byteBuffer, Info_Field.Position)
        packLLVector3(byteBuffer, Info_Field.LookAt)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        Info_Field.AgentID = unpackUUID(byteBuffer)
        Info_Field.RegionHandle = unpackLong(byteBuffer)
        Info_Field.Position = unpackLLVector3(byteBuffer)
        Info_Field.LookAt = unpackLLVector3(byteBuffer)
    }
}
