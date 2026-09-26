package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * ObjectPermissions
 * Field - see llpermissionsflags.h
 * If Set is true, tries to turn on bits in mask.
 * If set is false, tries to turn off bits in mask.
 * BUG: This just forces the permissions field.
 *
 * <p>Template: {@code ObjectPermissions Low 105 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class ObjectPermissions : SLMessage() {
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
        @JvmField var Override: Boolean = false
    }

    /** Block ObjectData, Variable. */
    open class ObjectData {
        @JvmField var Field: Int = 0
        @JvmField var Mask: Int = 0
        @JvmField var ObjectLocalID: Int = 0
        @JvmField var Set: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return (ObjectData_Fields.size * 10) + 38
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleObjectPermissions(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 105 (ObjectPermissions).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x69).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packBoolean(byteBuffer, HeaderData_Field.Override)
        byteBuffer.put((ObjectData_Fields.size.toByte()))
        for (objectData in ObjectData_Fields) {
            packInt(byteBuffer, objectData.ObjectLocalID)
            packByte(byteBuffer, (objectData.Field).toByte())
            packByte(byteBuffer, (objectData.Set).toByte())
            packInt(byteBuffer, objectData.Mask)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        HeaderData_Field.Override = unpackBoolean(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val objectData = ObjectData()
            objectData.ObjectLocalID = unpackInt(byteBuffer)
            objectData.Field = unpackByte(byteBuffer).toInt() and 0xFF
            objectData.Set = unpackByte(byteBuffer).toInt() and 0xFF
            objectData.Mask = unpackInt(byteBuffer)
            ObjectData_Fields.add(objectData)
        }
    }
}
