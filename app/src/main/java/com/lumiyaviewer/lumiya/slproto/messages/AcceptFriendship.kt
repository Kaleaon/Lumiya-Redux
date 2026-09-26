package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * AcceptFriendship
 *
 * <p>Template: {@code AcceptFriendship Low 297 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class AcceptFriendship : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val FolderData_Fields = ArrayList<FolderData>()
    @JvmField var TransactionBlock_Field: TransactionBlock = TransactionBlock()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block FolderData, Variable. */
    open class FolderData {
        @JvmField var FolderID: UUID? = null
    }

    /** Block TransactionBlock, Single. */
    open class TransactionBlock {
        @JvmField var TransactionID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (FolderData_Fields.size * 16) + 53
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAcceptFriendship(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 297 (AcceptFriendship).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x29).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, TransactionBlock_Field.TransactionID)
        byteBuffer.put((FolderData_Fields.size.toByte()))
        for (entry in FolderData_Fields) {
            packUUID(byteBuffer, entry.FolderID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        TransactionBlock_Field.TransactionID = unpackUUID(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val folderData = FolderData()
            folderData.FolderID = unpackUUID(byteBuffer)
            FolderData_Fields.add(folderData)
        }
    }
}
