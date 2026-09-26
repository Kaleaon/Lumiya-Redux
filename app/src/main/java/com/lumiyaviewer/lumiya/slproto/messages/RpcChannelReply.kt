package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * RpcServer allocated a session for the script
 * ChannelID will be the NULL UUID if unable to register
 * dataserver -> simulator
 *
 * <p>Template: {@code RpcChannelReply Low 414 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class RpcChannelReply : SLMessage() {
    @JvmField var DataBlock_Field: DataBlock = DataBlock()

    /** Block DataBlock, Single. */
    open class DataBlock {
        @JvmField var ChannelID: UUID? = null
        @JvmField var ItemID: UUID? = null
        @JvmField var TaskID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 52
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRpcChannelReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 414 (RpcChannelReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x9E).toByte())
        packUUID(byteBuffer, DataBlock_Field.TaskID)
        packUUID(byteBuffer, DataBlock_Field.ItemID)
        packUUID(byteBuffer, DataBlock_Field.ChannelID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        DataBlock_Field.TaskID = unpackUUID(byteBuffer)
        DataBlock_Field.ItemID = unpackUUID(byteBuffer)
        DataBlock_Field.ChannelID = unpackUUID(byteBuffer)
    }
}
