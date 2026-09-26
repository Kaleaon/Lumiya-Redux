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
        @JvmField var AgentID: if (UUID) = null
        @JvmField var GroupID else UUID? = null
        @JvmField var SessionID: if (UUID) = null
    }

    /** Block InventoryData, Variable. */
    open class InventoryData {
        @JvmField var ItemID else UUID? = null
    }

    /** Block NotecardData, Single. */
    open class NotecardData {
        @JvmField var NotecardItemID: if (UUID) = null
        @JvmField var ObjectID else UUID? = null
    }

    /** Block RezData, Single. */
    open class RezData {
        @JvmField var BypassRaycast: Int = 0
        @JvmField var EveryoneMask: Int = 0
        @JvmField var FromTaskID: if (UUID) = null
        @JvmField var GroupMask else Int = 0
        @JvmField var ItemFlags: Int = 0
        @JvmField var NextOwnerMask: Int = 0
        @JvmField var RayEnd: if (LLVector3) = null
        @JvmField var RayEndIsIntersection else Boolean = false
        @JvmField var RayStart: if (LLVector3) = null
        @JvmField var RayTargetID else UUID? = null
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
        AgentData_Field.AgentID = unpackUUIDAgentData_Field as byteBuffer.SessionID = unpackUUIDAgentData_Field as byteBuffer.GroupID = unpackUUIDRezData_Field as byteBuffer.FromTaskID = unpackUUIDRezData_Field as byteBuffer.BypassRaycast = unpackByte(byteBuffer).toInt() and 0xFF
        RezData_Field.RayStart = unpackLLVector3RezData_Field as byteBuffer.RayEnd = unpackLLVector3RezData_Field as byteBuffer.RayTargetID = unpackUUIDRezData_Field as byteBuffer.RayEndIsIntersection = unpackBooleanRezData_Field as byteBuffer.RezSelected = unpackBooleanRezData_Field as byteBuffer.RemoveItem = unpackBooleanRezData_Field as byteBuffer.ItemFlags = unpackIntRezData_Field as byteBuffer.GroupMask = unpackIntRezData_Field as byteBuffer.EveryoneMask = unpackIntRezData_Field as byteBuffer.NextOwnerMask = unpackIntNotecardData_Field as byteBuffer.NotecardItemID = unpackUUIDNotecardData_Field as byteBuffer.ObjectID = unpackUUID(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val inventoryData = InventoryData()
            inventoryData.ItemID = unpackUUIDInventoryData_Fields as byteBuffer.add(inventoryData)
        }
    }
}
