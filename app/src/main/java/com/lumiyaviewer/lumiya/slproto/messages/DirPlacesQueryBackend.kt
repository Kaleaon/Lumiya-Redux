package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * DirPlacesQueryBackend sim->dataserver
 * Used for the Find directory of places.
 *
 * <p>Template: {@code DirPlacesQueryBackend Low 34 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class DirPlacesQueryBackend : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var QueryData_Field: QueryData = QueryData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
    }

    /** Block QueryData, Single. */
    open class QueryData {
        @JvmField var Category: Int = 0
        @JvmField var EstateID: Int = 0
        @JvmField var Godlike: Boolean = false
        @JvmField var QueryFlags: Int = 0
        @JvmField var QueryID: UUID? = null
        @JvmField var QueryStart: Int = 0
        @JvmField var QueryText: ByteArray? = null
        @JvmField var SimName: ByteArray? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return QueryData_Field.QueryText!!.size + 17 + 4 + 1 + 1 + QueryData_Field.SimName!!.size + 4 + 1 + 4 + 20
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleDirPlacesQueryBackend(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 34 (DirPlacesQueryBackend).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x22).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, QueryData_Field.QueryID)
        packVariable(byteBuffer, QueryData_Field.QueryText, 1)
        packInt(byteBuffer, QueryData_Field.QueryFlags)
        packByte(byteBuffer, (QueryData_Field.Category).toByte())
        packVariable(byteBuffer, QueryData_Field.SimName, 1)
        packInt(byteBuffer, QueryData_Field.EstateID)
        packBoolean(byteBuffer, QueryData_Field.Godlike)
        packInt(byteBuffer, QueryData_Field.QueryStart)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        QueryData_Field.QueryID = unpackUUID(byteBuffer)
        QueryData_Field.QueryText = unpackVariable(byteBuffer, 1)
        QueryData_Field.QueryFlags = unpackInt(byteBuffer)
        QueryData_Field.Category = unpackByte(byteBuffer).toInt()
        QueryData_Field.SimName = unpackVariable(byteBuffer, 1)
        QueryData_Field.EstateID = unpackInt(byteBuffer)
        QueryData_Field.Godlike = unpackBoolean(byteBuffer)
        QueryData_Field.QueryStart = unpackInt(byteBuffer)
    }
}
