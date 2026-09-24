package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;

/**
 * Data server responds with data
 *
 * <p>Template: {@code ScriptDataReply Low 338 Trusted Unencoded UDPDeprecated}
 * (recovered/reference/message_template.msg).
 */
public class ScriptDataReply extends SLMessage {
    public ArrayList<DataBlock> DataBlock_Fields = new ArrayList<>();

    /** Block DataBlock, Variable. */
    public static class DataBlock {
        public long Hash; // U64
        public byte[] Reply; // Variable 2
    }

    public ScriptDataReply() {
        this.zeroCoded = false;
    }

    @Override
    public int CalcPayloadSize() {
        int i = 5;
        Iterator<?> it = this.DataBlock_Fields.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            i = ((DataBlock) it.next()).Reply.length + 10 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleScriptDataReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 338 (ScriptDataReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x52);
        byteBuffer.put((byte) this.DataBlock_Fields.size());
        for (DataBlock dataBlock : this.DataBlock_Fields) {
            packLong(byteBuffer, dataBlock.Hash);
            packVariable(byteBuffer, dataBlock.Reply, 2);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            DataBlock dataBlock = new DataBlock();
            dataBlock.Hash = unpackLong(byteBuffer);
            dataBlock.Reply = unpackVariable(byteBuffer, 2);
            this.DataBlock_Fields.add(dataBlock);
        }
    }
}
