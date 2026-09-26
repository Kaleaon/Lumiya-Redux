package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Get inventory segment.
 *
 * <p>Template: {@code FetchInventoryDescendents Low 277 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class FetchInventoryDescendents : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var InventoryData_Field: InventoryData = InventoryData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block InventoryData, Single. */
    open class InventoryData {
        @JvmField var FetchFolders: Boolean = false
        @JvmField var FetchItems: Boolean = false
        @JvmField var FolderID: UUID? = null
        @JvmField var OwnerID: UUID? = null
        @JvmField var SortOrder: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 74
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleFetchInventoryDescendents(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 277 (FetchInventoryDescendents).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x15).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, InventoryData_Field.FolderID)
        packUUID(byteBuffer, InventoryData_Field.OwnerID)
        packInt(byteBuffer, InventoryData_Field.SortOrder)
        packBoolean(byteBuffer, InventoryData_Field.FetchFolders)
        packBoolean(byteBuffer, InventoryData_Field.FetchItems)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        InventoryData_Field.FolderID = unpackUUID(byteBuffer)
        InventoryData_Field.OwnerID = unpackUUID(byteBuffer)
        InventoryData_Field.SortOrder = unpackInt(byteBuffer)
        InventoryData_Field.FetchFolders = unpackBoolean(byteBuffer)
        InventoryData_Field.FetchItems = unpackBoolean(byteBuffer)
    }
}
