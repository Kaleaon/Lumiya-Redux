package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Sim outgoing only (to dataserver, to viewer)
 * NOT viewer to sim, sim should not have handler, ever
 * This message is currently only uses objects, so the viewer ignores
 * the asset id.
 *
 * <p>Template: {@code SaveAssetIntoInventory Low 272 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code processSaveAssetIntoInventory()} in indra/newview/llinventorymodel.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class SaveAssetIntoInventory : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var InventoryData_Field: InventoryData = InventoryData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
    }

    /** Block InventoryData, Single. */
    open class InventoryData {
        @JvmField var ItemID: UUID? = null
        @JvmField var NewAssetID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 52
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleSaveAssetIntoInventory(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 272 (SaveAssetIntoInventory).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x10).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, InventoryData_Field.ItemID)
        packUUID(byteBuffer, InventoryData_Field.NewAssetID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        InventoryData_Field.ItemID = unpackUUID(byteBuffer)
        InventoryData_Field.NewAssetID = unpackUUID(byteBuffer)
    }
}
