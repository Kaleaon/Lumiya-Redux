package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * RPC messages
 * Script on simulator requests rpc channel from rpcserver
 * simulator -> dataserver -> MySQL
 *
 * <p>Template: {@code RpcChannelRequest Low 413 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class RpcChannelRequest extends SLMessage {
    public DataBlock DataBlock_Field;

    /** Block DataBlock, Single. */
    public static class DataBlock {
        public int GridX; // U32
        public int GridY; // U32
        public UUID ItemID; // LLUUID
        public UUID TaskID; // LLUUID
    }

    public RpcChannelRequest() {
        this.zeroCoded = false;
        this.DataBlock_Field = new DataBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return 44;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleRpcChannelRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 413 (RpcChannelRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x9D);
        packInt(byteBuffer, this.DataBlock_Field.GridX);
        packInt(byteBuffer, this.DataBlock_Field.GridY);
        packUUID(byteBuffer, this.DataBlock_Field.TaskID);
        packUUID(byteBuffer, this.DataBlock_Field.ItemID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.DataBlock_Field.GridX = unpackInt(byteBuffer);
        this.DataBlock_Field.GridY = unpackInt(byteBuffer);
        this.DataBlock_Field.TaskID = unpackUUID(byteBuffer);
        this.DataBlock_Field.ItemID = unpackUUID(byteBuffer);
    }
}
