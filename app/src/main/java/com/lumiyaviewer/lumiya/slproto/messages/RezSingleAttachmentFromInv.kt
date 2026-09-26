package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * RezSingleAttachmentFromInv
 *
 * <p>Template: {@code RezSingleAttachmentFromInv Low 395 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class RezSingleAttachmentFromInv : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var ObjectData_Field: ObjectData = ObjectData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block ObjectData, Single. */
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
        return ObjectData_Field.Name!!.size + 50 + 1 + ObjectData_Field.Description!!.size + 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRezSingleAttachmentFromInv(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 395 (RezSingleAttachmentFromInv).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x8B).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, ObjectData_Field.ItemID)
        packUUID(byteBuffer, ObjectData_Field.OwnerID)
        packByte(byteBuffer, (ObjectData_Field.AttachmentPt).toByte())
        packInt(byteBuffer, ObjectData_Field.ItemFlags)
        packInt(byteBuffer, ObjectData_Field.GroupMask)
        packInt(byteBuffer, ObjectData_Field.EveryoneMask)
        packInt(byteBuffer, ObjectData_Field.NextOwnerMask)
        packVariable(byteBuffer, ObjectData_Field.Name, 1)
        packVariable(byteBuffer, ObjectData_Field.Description, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        ObjectData_Field.ItemID = unpackUUID(byteBuffer)
        ObjectData_Field.OwnerID = unpackUUID(byteBuffer)
        ObjectData_Field.AttachmentPt = unpackByte(byteBuffer).toInt() and 0xFF
        ObjectData_Field.ItemFlags = unpackInt(byteBuffer)
        ObjectData_Field.GroupMask = unpackInt(byteBuffer)
        ObjectData_Field.EveryoneMask = unpackInt(byteBuffer)
        ObjectData_Field.NextOwnerMask = unpackInt(byteBuffer)
        ObjectData_Field.Name = unpackVariable(byteBuffer, 1)
        ObjectData_Field.Description = unpackVariable(byteBuffer, 1)
    }
}
