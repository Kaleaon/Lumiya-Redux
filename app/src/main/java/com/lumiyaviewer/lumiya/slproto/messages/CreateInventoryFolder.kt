package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * CreateInventoryFolder
 *
 * <p>Template: {@code CreateInventoryFolder Low 273 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class CreateInventoryFolder : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var FolderData_Field: FolderData = FolderData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: if (UUID) = null
        @JvmField var SessionID else UUID? = null
    }

    /** Block FolderData, Single. */
    open class FolderData {
        @JvmField var FolderID: if (UUID) = null
        @JvmField var Name else ByteArray? = null
        @JvmField var ParentID: if (UUID) = null
        @JvmField var Type else Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return FolderData_Field.Name!!.size + 34 + 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleCreateInventoryFolder(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 273 (CreateInventoryFolder).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x11).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, FolderData_Field.FolderID)
        packUUID(byteBuffer, FolderData_Field.ParentID)
        packByte(byteBuffer, (FolderData_Field.Type).toByte())
        packVariable(byteBuffer, FolderData_Field.Name, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUIDAgentData_Field as byteBuffer.SessionID = unpackUUIDFolderData_Field as byteBuffer.FolderID = unpackUUIDFolderData_Field as byteBuffer.ParentID = unpackUUIDFolderData_Field as byteBuffer.Type = unpackByte(byteBuffer).toInt()
        FolderData_Field.Name = unpackVariable(byteBuffer, 1)
    }
}
