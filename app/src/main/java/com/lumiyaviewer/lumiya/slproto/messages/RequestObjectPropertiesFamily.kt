package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * RequestObjectPropertiesFamily
 * Ask for extended information, such as creator, permissions, resources, etc.
 * Medium frequency because it is driven by mouse hovering over objects, which
 * occurs at high rates.
 *
 * <p>Template: {@code RequestObjectPropertiesFamily Medium 5 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class RequestObjectPropertiesFamily : SLMessage() {
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
        @JvmField var RequestFlags: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 54
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRequestObjectPropertiesFamily(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Medium 5 (RequestObjectPropertiesFamily).
        byteBuffer.put((0xFF).toByte())
        byteBuffer.put((0x05).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, ObjectData_Field.RequestFlags)
        packUUID(byteBuffer, ObjectData_Field.ObjectID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        ObjectData_Field.RequestFlags = unpackInt(byteBuffer)
        ObjectData_Field.ObjectID = unpackUUID(byteBuffer)
    }
}
