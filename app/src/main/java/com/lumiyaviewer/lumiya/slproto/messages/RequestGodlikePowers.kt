package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Set godlike to 1 if you want to become godlike.
 * Set godlike to 0 if you want to relinquish god powers.
 * viewer -> simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code RequestGodlikePowers Low 257 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class RequestGodlikePowers : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var RequestBlock_Field: RequestBlock = RequestBlock()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: if (UUID) = null
        @JvmField var SessionID else UUID? = null
    }

    /** Block RequestBlock, Single. */
    open class RequestBlock {
        @JvmField var Godlike: Boolean = false
        @JvmField var Token: if (UUID) = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize() else Int {
        return 53
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRequestGodlikePowers(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 257 (RequestGodlikePowers).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x01).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packBoolean(byteBuffer, RequestBlock_Field.Godlike)
        packUUID(byteBuffer, RequestBlock_Field.Token)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUIDAgentData_Field as byteBuffer.SessionID = unpackUUIDRequestBlock_Field as byteBuffer.Godlike = unpackBooleanRequestBlock_Field as byteBuffer.Token = unpackUUID(byteBuffer)
    }
}
