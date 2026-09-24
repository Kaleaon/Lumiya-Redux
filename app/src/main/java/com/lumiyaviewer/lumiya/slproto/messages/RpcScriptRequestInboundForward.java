package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.net.Inet4Address;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * spaceserver -> simulator
 *
 * <p>Template: {@code RpcScriptRequestInboundForward Low 416 Trusted Unencoded UDPDeprecated}
 * (recovered/reference/message_template.msg).
 */
public class RpcScriptRequestInboundForward extends SLMessage {
    public DataBlock DataBlock_Field;

    /** Block DataBlock, Single. */
    public static class DataBlock {
        public UUID ChannelID; // LLUUID
        public int IntValue; // U32
        public UUID ItemID; // LLUUID
        public Inet4Address RPCServerIP; // IPADDR
        public int RPCServerPort; // IPPORT
        public byte[] StringValue; // Variable 2 - string
        public UUID TaskID; // LLUUID
    }

    public RpcScriptRequestInboundForward() {
        this.zeroCoded = false;
        this.DataBlock_Field = new DataBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return this.DataBlock_Field.StringValue.length + 60 + 4;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleRpcScriptRequestInboundForward(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 416 (RpcScriptRequestInboundForward).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0xA0);
        packIPAddress(byteBuffer, this.DataBlock_Field.RPCServerIP);
        packShort(byteBuffer, (short) this.DataBlock_Field.RPCServerPort);
        packUUID(byteBuffer, this.DataBlock_Field.TaskID);
        packUUID(byteBuffer, this.DataBlock_Field.ItemID);
        packUUID(byteBuffer, this.DataBlock_Field.ChannelID);
        packInt(byteBuffer, this.DataBlock_Field.IntValue);
        packVariable(byteBuffer, this.DataBlock_Field.StringValue, 2);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.DataBlock_Field.RPCServerIP = unpackIPAddress(byteBuffer);
        this.DataBlock_Field.RPCServerPort = unpackShort(byteBuffer) & 65535;
        this.DataBlock_Field.TaskID = unpackUUID(byteBuffer);
        this.DataBlock_Field.ItemID = unpackUUID(byteBuffer);
        this.DataBlock_Field.ChannelID = unpackUUID(byteBuffer);
        this.DataBlock_Field.IntValue = unpackInt(byteBuffer);
        this.DataBlock_Field.StringValue = unpackVariable(byteBuffer, 2);
    }
}
