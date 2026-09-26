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
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block FolderData, Single. */
    open class FolderData {
        @JvmField var FolderID: UUID? = null
        @JvmField var Name: ByteArray? = null
        @JvmField var ParentID: UUID? = null
        @JvmField var Type: Int = 0
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
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        FolderData_Field.FolderID = unpackUUID(byteBuffer)
        FolderData_Field.ParentID = unpackUUID(byteBuffer)
        FolderData_Field.Type = unpackByte(byteBuffer).toInt()
        FolderData_Field.Name = unpackVariable(byteBuffer, 1)
    }
}
