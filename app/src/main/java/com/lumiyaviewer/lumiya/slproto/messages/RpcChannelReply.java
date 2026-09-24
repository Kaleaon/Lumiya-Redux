package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * RpcServer allocated a session for the script
 * ChannelID will be the NULL UUID if unable to register
 * dataserver -> simulator
 *
 * <p>Template: {@code RpcChannelReply Low 414 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class RpcChannelReply extends SLMessage {
    public DataBlock DataBlock_Field;

    /** Block DataBlock, Single. */
    public static class DataBlock {
        public UUID ChannelID; // LLUUID
        public UUID ItemID; // LLUUID
        public UUID TaskID; // LLUUID
    }

    public RpcChannelReply() {
        this.zeroCoded = false;
        this.DataBlock_Field = new DataBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return 52;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleRpcChannelReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 414 (RpcChannelReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x9E);
        packUUID(byteBuffer, this.DataBlock_Field.TaskID);
        packUUID(byteBuffer, this.DataBlock_Field.ItemID);
        packUUID(byteBuffer, this.DataBlock_Field.ChannelID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.DataBlock_Field.TaskID = unpackUUID(byteBuffer);
        this.DataBlock_Field.ItemID = unpackUUID(byteBuffer);
        this.DataBlock_Field.ChannelID = unpackUUID(byteBuffer);
    }
}
