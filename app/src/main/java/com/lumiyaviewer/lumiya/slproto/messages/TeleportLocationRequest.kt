package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.UUID

/**
 * TeleportLocationRequest
 * viewer -> sim specifying exact teleport destination
 *
 * <p>Template: {@code TeleportLocationRequest Low 63 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class TeleportLocationRequest : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var Info_Field: Info = Info()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block Info, Single. */
    open class Info {
        @JvmField var LookAt: LLVector3? = null
        @JvmField var Position: LLVector3? = null
        @JvmField var RegionHandle: Long = 0L
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 68
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleTeleportLocationRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 63 (TeleportLocationRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x3F).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packLong(byteBuffer, Info_Field.RegionHandle)
        packLLVector3(byteBuffer, Info_Field.Position)
        packLLVector3(byteBuffer, Info_Field.LookAt)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        Info_Field.RegionHandle = unpackLong(byteBuffer)
        Info_Field.Position = unpackLLVector3(byteBuffer)
        Info_Field.LookAt = unpackLLVector3(byteBuffer)
    }
}
