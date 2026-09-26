package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * set object sale information
 *
 * <p>Template: {@code ObjectSaleInfo Low 106 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class ObjectSaleInfo : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val ObjectData_Fields = ArrayList<ObjectData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block ObjectData, Variable. */
    open class ObjectData {
        @JvmField var LocalID: Int = 0
        @JvmField var SalePrice: Int = 0
        @JvmField var SaleType: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return (ObjectData_Fields.size * 9) + 37
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleObjectSaleInfo(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 106 (ObjectSaleInfo).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x6A).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        byteBuffer.put((ObjectData_Fields.size.toByte()))
        for (objectData in ObjectData_Fields) {
            packInt(byteBuffer, objectData.LocalID)
            packByte(byteBuffer, (objectData.SaleType).toByte())
            packInt(byteBuffer, objectData.SalePrice)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val objectData = ObjectData()
            objectData.LocalID = unpackInt(byteBuffer)
            objectData.SaleType = unpackByte(byteBuffer).toInt() and 0xFF
            objectData.SalePrice = unpackInt(byteBuffer)
            ObjectData_Fields.add(objectData)
        }
    }
}
