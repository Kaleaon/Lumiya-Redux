package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * This is the new improved way to remove inventory items.  It is
 * currently only supported in viewer->userserver->dataserver
 * messages typically initiated by an empty trash method.
 *
 * <p>Template: {@code RemoveInventoryObjects Low 284 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code processRemoveInventoryObjects()} in indra/newview/llinventorymodel.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class RemoveInventoryObjects : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val FolderData_Fields = ArrayList<FolderData>()
    @JvmField val ItemData_Fields = ArrayList<ItemData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block FolderData, Variable. */
    open class FolderData {
        @JvmField var FolderID: UUID? = null
    }

    /** Block ItemData, Variable. */
    open class ItemData {
        @JvmField var ItemID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (FolderData_Fields.size * 16) + 37 + 1 + (ItemData_Fields.size * 16)
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRemoveInventoryObjects(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 284 (RemoveInventoryObjects).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x1C).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        byteBuffer.put((FolderData_Fields.size.toByte()))
        for (entry in FolderData_Fields) {
            packUUID(byteBuffer, entry.FolderID)
        }
        byteBuffer.put((ItemData_Fields.size.toByte()))
        val iterator = ItemData_Fields.iterator()
        while (iterator.hasNext()) {
            packUUID(byteBuffer, (iterator.next()).ItemID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val folderData = FolderData()
            folderData.FolderID = unpackUUID(byteBuffer)
            FolderData_Fields.add(folderData)
        }
        val i3 = (byteBuffer.get().toInt() and 0xFF)
        repeat(i3) {
            val itemData = ItemData()
            itemData.ItemID = unpackUUID(byteBuffer)
            ItemData_Fields.add(itemData)
        }
    }
}
