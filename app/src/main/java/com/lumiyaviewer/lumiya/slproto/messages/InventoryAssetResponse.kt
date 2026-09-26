package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * response to RequestInventoryAsset
 * lluuid will be null if agentid in the request above cannot read asset
 *
 * <p>Template: {@code InventoryAssetResponse Low 283 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class InventoryAssetResponse : SLMessage() {
    @JvmField var QueryData_Field: QueryData = QueryData()

    /** Block QueryData, Single. */
    open class QueryData {
        @JvmField var AssetID: UUID? = null
        @JvmField var IsReadable: Boolean = false
        @JvmField var QueryID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 37
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleInventoryAssetResponse(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 283 (InventoryAssetResponse).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x1B).toByte())
        packUUID(byteBuffer, QueryData_Field.QueryID)
        packUUID(byteBuffer, QueryData_Field.AssetID)
        packBoolean(byteBuffer, QueryData_Field.IsReadable)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        QueryData_Field.QueryID = unpackUUID(byteBuffer)
        QueryData_Field.AssetID = unpackUUID(byteBuffer)
        QueryData_Field.IsReadable = unpackBoolean(byteBuffer)
    }
}
