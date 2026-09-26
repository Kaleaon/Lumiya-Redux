package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * copy inventory item by item id to specified destination folder,
 * send out bulk inventory update when done.
 * Inventory items are only unique for {agent, inv_id} pairs
 * the OldItemID needs to be paired with the OldAgentID to
 * produce a unique inventory item.
 *
 * <p>Template: {@code CopyInventoryItem Low 269 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class CopyInventoryItem : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val InventoryData_Fields = ArrayList<InventoryData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block InventoryData, Variable. */
    open class InventoryData {
        @JvmField var CallbackID: Int = 0
        @JvmField var NewFolderID: UUID? = null
        @JvmField var NewName: ByteArray? = null
        @JvmField var OldAgentID: UUID? = null
        @JvmField var OldItemID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        var i = 37
        val it = InventoryData_Fields.iterator()
        while (true) {
            val i2 = i
            if (!it.hasNext()) {
                return i2
            }
            i = it.next().NewName!!.size + 53 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleCopyInventoryItem(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 269 (CopyInventoryItem).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x0D).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        byteBuffer.put((InventoryData_Fields.size.toByte()))
        for (inventoryData in InventoryData_Fields) {
            packInt(byteBuffer, inventoryData.CallbackID)
            packUUID(byteBuffer, inventoryData.OldAgentID)
            packUUID(byteBuffer, inventoryData.OldItemID)
            packUUID(byteBuffer, inventoryData.NewFolderID)
            packVariable(byteBuffer, inventoryData.NewName, 1)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val inventoryData = InventoryData()
            inventoryData.CallbackID = unpackInt(byteBuffer)
            inventoryData.OldAgentID = unpackUUID(byteBuffer)
            inventoryData.OldItemID = unpackUUID(byteBuffer)
            inventoryData.NewFolderID = unpackUUID(byteBuffer)
            inventoryData.NewName = unpackVariable(byteBuffer, 1)
            InventoryData_Fields.add(inventoryData)
        }
    }
}
