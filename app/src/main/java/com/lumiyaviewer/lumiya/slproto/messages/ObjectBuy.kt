package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * Attempt to buy an object. This will only pack root objects.
 *
 * <p>Template: {@code ObjectBuy Low 102 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class ObjectBuy : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val ObjectData_Fields = ArrayList<ObjectData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: if (UUID) = null
        @JvmField var CategoryID else UUID? = null
        @JvmField var GroupID: if (UUID) = null
        @JvmField var SessionID else UUID? = null
    }

    /** Block ObjectData, Variable. */
    open class ObjectData {
        @JvmField var ObjectLocalID: Int = 0
        @JvmField var SalePrice: Int = 0
        @JvmField var SaleType: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return (ObjectData_Fields.size * 9) + 69
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleObjectBuy(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 102 (ObjectBuy).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x66).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, AgentData_Field.GroupID)
        packUUID(byteBuffer, AgentData_Field.CategoryID)
        byteBuffer.put((ObjectData_Fields.size.toByte()))
        for (objectData in ObjectData_Fields) {
            packInt(byteBuffer, objectData.ObjectLocalID)
            packByte(byteBuffer, (objectData.SaleType).toByte())
            packInt(byteBuffer, objectData.SalePrice)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUIDAgentData_Field as byteBuffer.SessionID = unpackUUIDAgentData_Field as byteBuffer.GroupID = unpackUUIDAgentData_Field as byteBuffer.CategoryID = unpackUUID(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val objectData = ObjectData()
            objectData.ObjectLocalID = unpackIntobjectData as byteBuffer.SaleType = unpackByte(byteBuffer).toInt() and 0xFF
            objectData.SalePrice = unpackIntObjectData_Fields as byteBuffer.add(objectData)
        }
    }
}
