package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * ObjectOwner
 * To make public, set OwnerID to LLUUID::null.
 * TODO: Eliminate god-bit. Maybe not. God-bit is ok, because it's
 * known on the server.
 *
 * <p>Template: {@code ObjectOwner Low 100 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class ObjectOwner : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var HeaderData_Field: HeaderData = HeaderData()
    @JvmField val ObjectData_Fields = ArrayList<ObjectData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block HeaderData, Single. */
    open class HeaderData {
        @JvmField var GroupID: UUID? = null
        @JvmField var Override: Boolean = false
        @JvmField var OwnerID: UUID? = null
    }

    /** Block ObjectData, Variable. */
    open class ObjectData {
        @JvmField var ObjectLocalID: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return (ObjectData_Fields.size * 4) + 70
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleObjectOwner(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 100 (ObjectOwner).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x64).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packBoolean(byteBuffer, HeaderData_Field.Override)
        packUUID(byteBuffer, HeaderData_Field.OwnerID)
        packUUID(byteBuffer, HeaderData_Field.GroupID)
        byteBuffer.put((ObjectData_Fields.size.toByte()))
        for (entry in ObjectData_Fields) {
            packInt(byteBuffer, entry.ObjectLocalID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        HeaderData_Field.Override = unpackBoolean(byteBuffer)
        HeaderData_Field.OwnerID = unpackUUID(byteBuffer)
        HeaderData_Field.GroupID = unpackUUID(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val objectData = ObjectData()
            objectData.ObjectLocalID = unpackInt(byteBuffer)
            ObjectData_Fields.add(objectData)
        }
    }
}
