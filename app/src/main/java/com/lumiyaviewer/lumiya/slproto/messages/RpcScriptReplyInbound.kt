package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * simulator -> rpcserver
 * Not trusted because trust establishment doesn't work here.
 *
 * <p>Template: {@code RpcScriptReplyInbound Low 417 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class RpcScriptReplyInbound : SLMessage() {
    @JvmField var DataBlock_Field: DataBlock = DataBlock()

    /** Block DataBlock, Single. */
    open class DataBlock {
        @JvmField var ChannelID: UUID? = null
        @JvmField var IntValue: Int = 0
        @JvmField var ItemID: UUID? = null
        @JvmField var StringValue: ByteArray? = null
        @JvmField var TaskID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return DataBlock_Field.StringValue!!.size + 54 + 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRpcScriptReplyInbound(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 417 (RpcScriptReplyInbound).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0xA1).toByte())
        packUUID(byteBuffer, DataBlock_Field.TaskID)
        packUUID(byteBuffer, DataBlock_Field.ItemID)
        packUUID(byteBuffer, DataBlock_Field.ChannelID)
        packInt(byteBuffer, DataBlock_Field.IntValue)
        packVariable(byteBuffer, DataBlock_Field.StringValue, 2)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        DataBlock_Field.TaskID = unpackUUID(byteBuffer)
        DataBlock_Field.ItemID = unpackUUID(byteBuffer)
        DataBlock_Field.ChannelID = unpackUUID(byteBuffer)
        DataBlock_Field.IntValue = unpackInt(byteBuffer)
        DataBlock_Field.StringValue = unpackVariable(byteBuffer, 2)
    }
}
