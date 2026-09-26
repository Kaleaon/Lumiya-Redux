package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * RezMultipleAttachmentsFromInv
 *
 * <p>Template: {@code RezMultipleAttachmentsFromInv Low 396 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class RezMultipleAttachmentsFromInv : SLMessage() {
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
        @JvmField var CompoundMsgID: UUID? = null
        @JvmField var FirstDetachAll: Boolean = false
        @JvmField var TotalObjects: Int = 0
    }

    /** Block ObjectData, Variable. */
    open class ObjectData {
        @JvmField var AttachmentPt: Int = 0
        @JvmField var Description: ByteArray? = null
        @JvmField var EveryoneMask: Int = 0
        @JvmField var GroupMask: Int = 0
        @JvmField var ItemFlags: Int = 0
        @JvmField var ItemID: UUID? = null
        @JvmField var Name: ByteArray? = null
        @JvmField var NextOwnerMask: Int = 0
        @JvmField var OwnerID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        var i = 55
        val it = ObjectData_Fields.iterator()
        while (true) {
            val i2 = i
            if (!it.hasNext()) {
                return i2
            }
            val objectData = it.next()
            i = objectData.Description!!.size + objectData.Name!!.size + 50 + 1 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRezMultipleAttachmentsFromInv(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 396 (RezMultipleAttachmentsFromInv).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x8C).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, HeaderData_Field.CompoundMsgID)
        packByte(byteBuffer, (HeaderData_Field.TotalObjects).toByte())
        packBoolean(byteBuffer, HeaderData_Field.FirstDetachAll)
        byteBuffer.put((ObjectData_Fields.size.toByte()))
        for (objectData in ObjectData_Fields) {
            packUUID(byteBuffer, objectData.ItemID)
            packUUID(byteBuffer, objectData.OwnerID)
            packByte(byteBuffer, (objectData.AttachmentPt).toByte())
            packInt(byteBuffer, objectData.ItemFlags)
            packInt(byteBuffer, objectData.GroupMask)
            packInt(byteBuffer, objectData.EveryoneMask)
            packInt(byteBuffer, objectData.NextOwnerMask)
            packVariable(byteBuffer, objectData.Name, 1)
            packVariable(byteBuffer, objectData.Description, 1)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        HeaderData_Field.CompoundMsgID = unpackUUID(byteBuffer)
        HeaderData_Field.TotalObjects = unpackByte(byteBuffer).toInt() and 0xFF
        HeaderData_Field.FirstDetachAll = unpackBoolean(byteBuffer)
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val objectData = ObjectData()
            objectData.ItemID = unpackUUID(byteBuffer)
            objectData.OwnerID = unpackUUID(byteBuffer)
            objectData.AttachmentPt = unpackByte(byteBuffer).toInt() and 0xFF
            objectData.ItemFlags = unpackInt(byteBuffer)
            objectData.GroupMask = unpackInt(byteBuffer)
            objectData.EveryoneMask = unpackInt(byteBuffer)
            objectData.NextOwnerMask = unpackInt(byteBuffer)
            objectData.Name = unpackVariable(byteBuffer, 1)
            objectData.Description = unpackVariable(byteBuffer, 1)
            ObjectData_Fields.add(objectData)
        }
    }
}
