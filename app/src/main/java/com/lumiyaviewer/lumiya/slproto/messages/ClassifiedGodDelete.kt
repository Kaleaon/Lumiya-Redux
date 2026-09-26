package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ClassifiedGodDelete
 * Delete a classified from the database.
 * QueryID is needed so database can send a repeat list of
 * classified.
 * viewer -> simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code ClassifiedGodDelete Low 47 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class ClassifiedGodDelete : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var Data_Field: Data = Data()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block Data, Single. */
    open class Data {
        @JvmField var ClassifiedID: UUID? = null
        @JvmField var QueryID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 68
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleClassifiedGodDelete(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 47 (ClassifiedGodDelete).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x2F).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, Data_Field.ClassifiedID)
        packUUID(byteBuffer, Data_Field.QueryID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        Data_Field.ClassifiedID = unpackUUID(byteBuffer)
        Data_Field.QueryID = unpackUUID(byteBuffer)
    }
}
