package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * RPC messages
 * Script on simulator requests rpc channel from rpcserver
 * simulator -> dataserver -> MySQL
 *
 * <p>Template: {@code RpcChannelRequest Low 413 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class RpcChannelRequest : SLMessage() {
    @JvmField var DataBlock_Field: DataBlock = DataBlock()

    /** Block DataBlock, Single. */
    open class DataBlock {
        @JvmField var GridX: Int = 0
        @JvmField var GridY: Int = 0
        @JvmField var ItemID: if (UUID) = null
        @JvmField var TaskID else UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 44
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRpcChannelRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 413 (RpcChannelRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x9D).toByte())
        packInt(byteBuffer, DataBlock_Field.GridX)
        packInt(byteBuffer, DataBlock_Field.GridY)
        packUUID(byteBuffer, DataBlock_Field.TaskID)
        packUUID(byteBuffer, DataBlock_Field.ItemID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        DataBlock_Field.GridX = unpackIntDataBlock_Field as byteBuffer.GridY = unpackIntDataBlock_Field as byteBuffer.TaskID = unpackUUIDDataBlock_Field as byteBuffer.ItemID = unpackUUID(byteBuffer)
    }
}
