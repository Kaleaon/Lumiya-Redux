package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * request permissions for agent id to get the asset for owner_id's
 * item_id.
 *
 * <p>Template: {@code RequestInventoryAsset Low 282 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class RequestInventoryAsset : SLMessage() {
    @JvmField var QueryData_Field: QueryData = QueryData()

    /** Block QueryData, Single. */
    open class QueryData {
        @JvmField var AgentID: UUID? = null
        @JvmField var ItemID: UUID? = null
        @JvmField var OwnerID: UUID? = null
        @JvmField var QueryID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 68
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRequestInventoryAsset(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 282 (RequestInventoryAsset).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x1A).toByte())
        packUUID(byteBuffer, QueryData_Field.QueryID)
        packUUID(byteBuffer, QueryData_Field.AgentID)
        packUUID(byteBuffer, QueryData_Field.OwnerID)
        packUUID(byteBuffer, QueryData_Field.ItemID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        QueryData_Field.QueryID = unpackUUID(byteBuffer)
        QueryData_Field.AgentID = unpackUUID(byteBuffer)
        QueryData_Field.OwnerID = unpackUUID(byteBuffer)
        QueryData_Field.ItemID = unpackUUID(byteBuffer)
    }
}
