package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;

/**
 * ScriptDataRequest and ScriptDataReply are no longer used in the
 * simulator or the dataserver. Please see "/region/<region-id>/data-request"
 * in llscript_dataserver.cpp for the HTTP endpoint.
 * Script on simulator asks dataserver for information
 *
 * <p>Template: {@code ScriptDataRequest Low 337 Trusted Unencoded UDPDeprecated}
 * (recovered/reference/message_template.msg).
 */
public class ScriptDataRequest extends SLMessage {
    public ArrayList<DataBlock> DataBlock_Fields = new ArrayList<>();

    /** Block DataBlock, Variable. */
    public static class DataBlock {
        public long Hash; // U64
        public byte[] Request; // Variable 2
        public int RequestType; // S8
    }

    public ScriptDataRequest() {
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
            i = ((DataBlock) it.next()).Request.length + 11 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleScriptDataRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 337 (ScriptDataRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x51);
        byteBuffer.put((byte) this.DataBlock_Fields.size());
        for (DataBlock dataBlock : this.DataBlock_Fields) {
            packLong(byteBuffer, dataBlock.Hash);
            packByte(byteBuffer, (byte) dataBlock.RequestType);
            packVariable(byteBuffer, dataBlock.Request, 2);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            DataBlock dataBlock = new DataBlock();
            dataBlock.Hash = unpackLong(byteBuffer);
            dataBlock.RequestType = unpackByte(byteBuffer);
            dataBlock.Request = unpackVariable(byteBuffer, 2);
            this.DataBlock_Fields.add(dataBlock);
        }
    }
}
