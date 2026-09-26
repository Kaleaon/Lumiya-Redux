package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ObjectSpinUpdate
 *
 * <p>Template: {@code ObjectSpinUpdate Low 121 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class ObjectSpinUpdate : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var ObjectData_Field: ObjectData = ObjectData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block ObjectData, Single. */
    open class ObjectData {
        @JvmField var ObjectID: UUID? = null
        @JvmField var Rotation: LLQuaternion? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 64
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleObjectSpinUpdate(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 121 (ObjectSpinUpdate).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x79).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, ObjectData_Field.ObjectID)
        packLLQuaternion(byteBuffer, ObjectData_Field.Rotation)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        ObjectData_Field.ObjectID = unpackUUID(byteBuffer)
        ObjectData_Field.Rotation = unpackLLQuaternion(byteBuffer)
    }
}
