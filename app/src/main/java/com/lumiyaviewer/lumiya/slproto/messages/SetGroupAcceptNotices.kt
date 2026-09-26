package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * viewer -> simulator -> dataserver
 *
 * <p>Template: {@code SetGroupAcceptNotices Low 370 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class SetGroupAcceptNotices : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var Data_Field: Data = Data()
    @JvmField var NewData_Field: NewData = NewData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block Data, Single. */
    open class Data {
        @JvmField var AcceptNotices: Boolean = false
        @JvmField var GroupID: UUID? = null
    }

    /** Block NewData, Single. */
    open class NewData {
        @JvmField var ListInProfile: Boolean = false
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 54
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleSetGroupAcceptNotices(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 370 (SetGroupAcceptNotices).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x72).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, Data_Field.GroupID)
        packBoolean(byteBuffer, Data_Field.AcceptNotices)
        packBoolean(byteBuffer, NewData_Field.ListInProfile)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        Data_Field.GroupID = unpackUUID(byteBuffer)
        Data_Field.AcceptNotices = unpackBoolean(byteBuffer)
        NewData_Field.ListInProfile = unpackBoolean(byteBuffer)
    }
}
