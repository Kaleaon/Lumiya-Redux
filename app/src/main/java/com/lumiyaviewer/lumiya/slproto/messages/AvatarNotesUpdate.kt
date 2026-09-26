package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * AvatarNotesUpdate
 * viewer -> simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code AvatarNotesUpdate Low 177 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class AvatarNotesUpdate : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var Data_Field: Data = Data()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block Data, Single. */
    open class Data {
        @JvmField var Notes: ByteArray? = null
        @JvmField var TargetID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return Data_Field.Notes!!.size + 18 + 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAvatarNotesUpdate(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 177 (AvatarNotesUpdate).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xB1).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, Data_Field.TargetID)
        packVariable(byteBuffer, Data_Field.Notes, 2)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        Data_Field.TargetID = unpackUUID(byteBuffer)
        Data_Field.Notes = unpackVariable(byteBuffer, 2)
    }
}
