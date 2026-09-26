package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * Viewer -> Sim
 * Used in "Make New Outfit"
 *
 * <p>Template: {@code CreateNewOutfitAttachments Low 398 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class CreateNewOutfitAttachments : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var HeaderData_Field: HeaderData = HeaderData()
    @JvmField val ObjectData_Fields = ArrayList<ObjectData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block HeaderData, Single. */
    open class HeaderData {
        @JvmField var NewFolderID: UUID? = null
    }

    /** Block ObjectData, Variable. */
    open class ObjectData {
        @JvmField var OldFolderID: UUID? = null
        @JvmField var OldItemID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (ObjectData_Fields.size * 32) + 53
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleCreateNewOutfitAttachments(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 398 (CreateNewOutfitAttachments).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x8E).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, HeaderData_Field.NewFolderID)
        byteBuffer.put((ObjectData_Fields.size.toByte()))
        for (objectData in ObjectData_Fields) {
            packUUID(byteBuffer, objectData.OldItemID)
            packUUID(byteBuffer, objectData.OldFolderID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        HeaderData_Field.NewFolderID = unpackUUID(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val objectData = ObjectData()
            objectData.OldItemID = unpackUUID(byteBuffer)
            objectData.OldFolderID = unpackUUID(byteBuffer)
            ObjectData_Fields.add(objectData)
        }
    }
}
