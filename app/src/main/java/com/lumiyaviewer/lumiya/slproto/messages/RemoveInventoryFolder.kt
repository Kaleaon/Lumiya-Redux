package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * RemoveInventoryFolder
 *
 * <p>Template: {@code RemoveInventoryFolder Low 276 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code processRemoveInventoryFolder()} in indra/newview/llinventorymodel.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class RemoveInventoryFolder : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val FolderData_Fields = ArrayList<FolderData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block FolderData, Variable. */
    open class FolderData {
        @JvmField var FolderID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (FolderData_Fields.size * 16) + 37
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRemoveInventoryFolder(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 276 (RemoveInventoryFolder).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x14).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        byteBuffer.put((FolderData_Fields.size.toByte()))
        for (entry in FolderData_Fields) {
            packUUID(byteBuffer, entry.FolderID)
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
    }
}
