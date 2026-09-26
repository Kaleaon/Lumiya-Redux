package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * sim -> dataserver
 * Once all of the data has been gathered,
 *
 * <p>Template: {@code StartAuction Low 229 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class StartAuction : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var ParcelData_Field: ParcelData = ParcelData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
    }

    /** Block ParcelData, Single. */
    open class ParcelData {
        @JvmField var Name: ByteArray? = null
        @JvmField var ParcelID: UUID? = null
        @JvmField var SnapshotID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return ParcelData_Field.Name!!.size + 33 + 20
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleStartAuction(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 229 (StartAuction).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xE5).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, ParcelData_Field.ParcelID)
        packUUID(byteBuffer, ParcelData_Field.SnapshotID)
        packVariable(byteBuffer, ParcelData_Field.Name, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        ParcelData_Field.ParcelID = unpackUUID(byteBuffer)
        ParcelData_Field.SnapshotID = unpackUUID(byteBuffer)
        ParcelData_Field.Name = unpackVariable(byteBuffer, 1)
    }
}
