package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Inbound RPC requests follow this path:
 * RpcScriptRequestInbound: rpcserver -> spaceserver
 * RpcScriptRequestInboundForward: spaceserver -> simulator
 * reply: simulator -> rpcserver
 *
 * <p>Template: {@code RpcScriptRequestInbound Low 415 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class RpcScriptRequestInbound extends SLMessage {
    public DataBlock DataBlock_Field;
    public TargetBlock TargetBlock_Field;

    /** Block DataBlock, Single. */
    public static class DataBlock {
        public UUID ChannelID; // LLUUID
        public int IntValue; // U32
        public UUID ItemID; // LLUUID
        public byte[] StringValue; // Variable 2 - string
        public UUID TaskID; // LLUUID
    }

    /** Block TargetBlock, Single. */
    public static class TargetBlock {
        public int GridX; // U32
        public int GridY; // U32
    }

    public RpcScriptRequestInbound() {
        this.zeroCoded = false;
        this.TargetBlock_Field = new TargetBlock();
        this.DataBlock_Field = new DataBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return this.DataBlock_Field.StringValue.length + 54 + 12;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleRpcScriptRequestInbound(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 415 (RpcScriptRequestInbound).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x9F);
        packInt(byteBuffer, this.TargetBlock_Field.GridX);
        packInt(byteBuffer, this.TargetBlock_Field.GridY);
        packUUID(byteBuffer, this.DataBlock_Field.TaskID);
        packUUID(byteBuffer, this.DataBlock_Field.ItemID);
        packUUID(byteBuffer, this.DataBlock_Field.ChannelID);
        packInt(byteBuffer, this.DataBlock_Field.IntValue);
        packVariable(byteBuffer, this.DataBlock_Field.StringValue, 2);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.TargetBlock_Field.GridX = unpackInt(byteBuffer);
        this.TargetBlock_Field.GridY = unpackInt(byteBuffer);
        this.DataBlock_Field.TaskID = unpackUUID(byteBuffer);
        this.DataBlock_Field.ItemID = unpackUUID(byteBuffer);
        this.DataBlock_Field.ChannelID = unpackUUID(byteBuffer);
        this.DataBlock_Field.IntValue = unpackInt(byteBuffer);
        this.DataBlock_Field.StringValue = unpackVariable(byteBuffer, 2);
    }
}
