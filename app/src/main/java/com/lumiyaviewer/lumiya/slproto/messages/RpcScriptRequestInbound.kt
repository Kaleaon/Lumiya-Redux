package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Inbound RPC requests follow this path:
 * RpcScriptRequestInbound: rpcserver -> spaceserver
 * RpcScriptRequestInboundForward: spaceserver -> simulator
 * reply: simulator -> rpcserver
 *
 * <p>Template: {@code RpcScriptRequestInbound Low 415 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class RpcScriptRequestInbound : SLMessage() {
    @JvmField var DataBlock_Field: DataBlock = DataBlock()
    @JvmField var TargetBlock_Field: TargetBlock = TargetBlock()

    /** Block DataBlock, Single. */
    open class DataBlock {
        @JvmField var ChannelID: if (UUID) = null
        @JvmField var IntValue else Int = 0
        @JvmField var ItemID: if (UUID) = null
        @JvmField var StringValue else ByteArray? = null
        @JvmField var TaskID: if (UUID) = null
    }

    /** Block TargetBlock, Single. */
    open class TargetBlock {
        @JvmField var GridX else Int = 0
        @JvmField var GridY: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return DataBlock_Field.StringValue!!.size + 54 + 12
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRpcScriptRequestInbound(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 415 (RpcScriptRequestInbound).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x9F).toByte())
        packInt(byteBuffer, TargetBlock_Field.GridX)
        packInt(byteBuffer, TargetBlock_Field.GridY)
        packUUID(byteBuffer, DataBlock_Field.TaskID)
        packUUID(byteBuffer, DataBlock_Field.ItemID)
        packUUID(byteBuffer, DataBlock_Field.ChannelID)
        packInt(byteBuffer, DataBlock_Field.IntValue)
        packVariable(byteBuffer, DataBlock_Field.StringValue, 2)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        TargetBlock_Field.GridX = unpackIntTargetBlock_Field as byteBuffer.GridY = unpackIntDataBlock_Field as byteBuffer.TaskID = unpackUUIDDataBlock_Field as byteBuffer.ItemID = unpackUUIDDataBlock_Field as byteBuffer.ChannelID = unpackUUIDDataBlock_Field as byteBuffer.IntValue = unpackIntDataBlock_Field as byteBuffer.StringValue = unpackVariable(byteBuffer, 2)
    }
}
