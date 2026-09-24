package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * simulator -> rpcserver
 * Not trusted because trust establishment doesn't work here.
 *
 * <p>Template: {@code RpcScriptReplyInbound Low 417 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class RpcScriptReplyInbound extends SLMessage {
    public DataBlock DataBlock_Field;

    /** Block DataBlock, Single. */
    public static class DataBlock {
        public UUID ChannelID; // LLUUID
        public int IntValue; // U32
        public UUID ItemID; // LLUUID
        public byte[] StringValue; // Variable 2 - string
        public UUID TaskID; // LLUUID
    }

    public RpcScriptReplyInbound() {
        this.zeroCoded = false;
        this.DataBlock_Field = new DataBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return this.DataBlock_Field.StringValue.length + 54 + 4;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleRpcScriptReplyInbound(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 417 (RpcScriptReplyInbound).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0xA1);
        packUUID(byteBuffer, this.DataBlock_Field.TaskID);
        packUUID(byteBuffer, this.DataBlock_Field.ItemID);
        packUUID(byteBuffer, this.DataBlock_Field.ChannelID);
        packInt(byteBuffer, this.DataBlock_Field.IntValue);
        packVariable(byteBuffer, this.DataBlock_Field.StringValue, 2);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.DataBlock_Field.TaskID = unpackUUID(byteBuffer);
        this.DataBlock_Field.ItemID = unpackUUID(byteBuffer);
        this.DataBlock_Field.ChannelID = unpackUUID(byteBuffer);
        this.DataBlock_Field.IntValue = unpackInt(byteBuffer);
        this.DataBlock_Field.StringValue = unpackVariable(byteBuffer, 2);
    }
}
