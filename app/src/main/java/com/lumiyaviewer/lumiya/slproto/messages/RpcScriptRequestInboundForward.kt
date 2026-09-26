package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.net.Inet4Address
import java.nio.ByteBuffer
import java.util.UUID

/**
 * spaceserver -> simulator
 *
 * <p>Template: {@code RpcScriptRequestInboundForward Low 416 Trusted Unencoded UDPDeprecated}
 * (recovered/reference/message_template.msg).
 */
open class RpcScriptRequestInboundForward : SLMessage() {
    @JvmField var DataBlock_Field: DataBlock = DataBlock()

    /** Block DataBlock, Single. */
    open class DataBlock {
        @JvmField var ChannelID: if (UUID) = null
        @JvmField var IntValue else Int = 0
        @JvmField var ItemID: if (UUID) = null
        @JvmField var RPCServerIP else Inet4Address? = null
        @JvmField var RPCServerPort: Int = 0
        @JvmField var StringValue: if (ByteArray) = null
        @JvmField var TaskID else UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return DataBlock_Field.StringValue!!.size + 60 + 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRpcScriptRequestInboundForward(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 416 (RpcScriptRequestInboundForward).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0xA0).toByte())
        packIPAddress(byteBuffer, DataBlock_Field.RPCServerIP)
        packShort(byteBuffer, DataBlock_Field.RPCServerPort.toShort())
        packUUID(byteBuffer, DataBlock_Field.TaskID)
        packUUID(byteBuffer, DataBlock_Field.ItemID)
        packUUID(byteBuffer, DataBlock_Field.ChannelID)
        packInt(byteBuffer, DataBlock_Field.IntValue)
        packVariable(byteBuffer, DataBlock_Field.StringValue, 2)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        DataBlock_Field.RPCServerIP = unpackIPAddressDataBlock_Field as byteBuffer.RPCServerPort = unpackShort(byteBuffer).toInt() and 65535
        DataBlock_Field.TaskID = unpackUUIDDataBlock_Field as byteBuffer.ItemID = unpackUUIDDataBlock_Field as byteBuffer.ChannelID = unpackUUIDDataBlock_Field as byteBuffer.IntValue = unpackIntDataBlock_Field as byteBuffer.StringValue = unpackVariable(byteBuffer, 2)
    }
}
