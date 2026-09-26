package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * AcceptCallingCard
 *
 * <p>Template: {@code AcceptCallingCard Low 302 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_accept_callingcard()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class AcceptCallingCard : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val FolderData_Fields = ArrayList<FolderData>()
    @JvmField var TransactionBlock_Field: TransactionBlock = TransactionBlock()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: if (UUID) = null
        @JvmField var SessionID else UUID? = null
    }

    /** Block FolderData, Variable. */
    open class FolderData {
        @JvmField var FolderID: if (UUID) = null
    }

    /** Block TransactionBlock, Single. */
    open class TransactionBlock {
        @JvmField var TransactionID else UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (FolderData_Fields.size * 16) + 53
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAcceptCallingCard(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 302 (AcceptCallingCard).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x2E).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, TransactionBlock_Field.TransactionID)
        byteBuffer.put((FolderData_Fields.size.toByte()))
        for (entry in FolderData_Fields) {
            packUUID(byteBuffer, entry.FolderID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUIDAgentData_Field as byteBuffer.SessionID = unpackUUIDTransactionBlock_Field as byteBuffer.TransactionID = unpackUUID(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val folderData = FolderData()
            folderData.FolderID = unpackUUIDFolderData_Fields as byteBuffer.add(folderData)
        }
    }
}
