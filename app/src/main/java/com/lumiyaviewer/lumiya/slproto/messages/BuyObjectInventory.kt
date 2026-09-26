package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * viewer -> simulator
 * buy object inventory. If the transaction succeeds, it will add
 * inventory to the agent, and potentially remove the original.
 *
 * <p>Template: {@code BuyObjectInventory Low 103 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class BuyObjectInventory : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var Data_Field: Data = Data()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block Data, Single. */
    open class Data {
        @JvmField var FolderID: UUID? = null
        @JvmField var ItemID: UUID? = null
        @JvmField var ObjectID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 84
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleBuyObjectInventory(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 103 (BuyObjectInventory).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x67).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, Data_Field.ObjectID)
        packUUID(byteBuffer, Data_Field.ItemID)
        packUUID(byteBuffer, Data_Field.FolderID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        Data_Field.ObjectID = unpackUUID(byteBuffer)
        Data_Field.ItemID = unpackUUID(byteBuffer)
        Data_Field.FolderID = unpackUUID(byteBuffer)
    }
}
