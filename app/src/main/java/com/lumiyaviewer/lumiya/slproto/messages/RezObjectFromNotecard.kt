package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * This message is sent from viewer -> simulator when the viewer wants
 * to rez an object from a notecard.
 *
 * <p>Template: {@code RezObjectFromNotecard Low 294 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class RezObjectFromNotecard : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val InventoryData_Fields = ArrayList<InventoryData>()
    @JvmField var NotecardData_Field: NotecardData = NotecardData()
    @JvmField var RezData_Field: RezData = RezData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var GroupID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block InventoryData, Variable. */
    open class InventoryData {
        @JvmField var ItemID: UUID? = null
    }

    /** Block NotecardData, Single. */
    open class NotecardData {
        @JvmField var NotecardItemID: UUID? = null
        @JvmField var ObjectID: UUID? = null
    }

    /** Block RezData, Single. */
    open class RezData {
        @JvmField var BypassRaycast: Int = 0
        @JvmField var EveryoneMask: Int = 0
        @JvmField var FromTaskID: UUID? = null
        @JvmField var GroupMask: Int = 0
        @JvmField var ItemFlags: Int = 0
        @JvmField var NextOwnerMask: Int = 0
        @JvmField var RayEnd: LLVector3? = null
        @JvmField var RayEndIsIntersection: Boolean = false
        @JvmField var RayStart: LLVector3? = null
        @JvmField var RayTargetID: UUID? = null
        @JvmField var RemoveItem: Boolean = false
        @JvmField var RezSelected: Boolean = false
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return (InventoryData_Fields.size * 16) + 161
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRezObjectFromNotecard(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 294 (RezObjectFromNotecard).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x26).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, AgentData_Field.GroupID)
        packUUID(byteBuffer, RezData_Field.FromTaskID)
        packByte(byteBuffer, (RezData_Field.BypassRaycast).toByte())
        packLLVector3(byteBuffer, RezData_Field.RayStart)
        packLLVector3(byteBuffer, RezData_Field.RayEnd)
        packUUID(byteBuffer, RezData_Field.RayTargetID)
        packBoolean(byteBuffer, RezData_Field.RayEndIsIntersection)
        packBoolean(byteBuffer, RezData_Field.RezSelected)
        packBoolean(byteBuffer, RezData_Field.RemoveItem)
        packInt(byteBuffer, RezData_Field.ItemFlags)
        packInt(byteBuffer, RezData_Field.GroupMask)
        packInt(byteBuffer, RezData_Field.EveryoneMask)
        packInt(byteBuffer, RezData_Field.NextOwnerMask)
        packUUID(byteBuffer, NotecardData_Field.NotecardItemID)
        packUUID(byteBuffer, NotecardData_Field.ObjectID)
        byteBuffer.put((InventoryData_Fields.size.toByte()))
        for (entry in InventoryData_Fields) {
            packUUID(byteBuffer, entry.ItemID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        AgentData_Field.GroupID = unpackUUID(byteBuffer)
        RezData_Field.FromTaskID = unpackUUID(byteBuffer)
        RezData_Field.BypassRaycast = unpackByte(byteBuffer).toInt() and 0xFF
        RezData_Field.RayStart = unpackLLVector3(byteBuffer)
        RezData_Field.RayEnd = unpackLLVector3(byteBuffer)
        RezData_Field.RayTargetID = unpackUUID(byteBuffer)
        RezData_Field.RayEndIsIntersection = unpackBoolean(byteBuffer)
        RezData_Field.RezSelected = unpackBoolean(byteBuffer)
        RezData_Field.RemoveItem = unpackBoolean(byteBuffer)
        RezData_Field.ItemFlags = unpackInt(byteBuffer)
        RezData_Field.GroupMask = unpackInt(byteBuffer)
        RezData_Field.EveryoneMask = unpackInt(byteBuffer)
        RezData_Field.NextOwnerMask = unpackInt(byteBuffer)
        NotecardData_Field.NotecardItemID = unpackUUID(byteBuffer)
        NotecardData_Field.ObjectID = unpackUUID(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val inventoryData = InventoryData()
            inventoryData.ItemID = unpackUUID(byteBuffer)
            InventoryData_Fields.add(inventoryData)
        }
    }
}
