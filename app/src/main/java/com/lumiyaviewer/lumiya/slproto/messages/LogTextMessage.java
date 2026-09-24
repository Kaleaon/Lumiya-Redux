package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * LogTextMessage
 * Asks the dataserver to log the contents of this message in the
 * chat and IM log table.
 * Sent from userserver (IM logging) and simulator (chat logging).
 *
 * <p>Template: {@code LogTextMessage Low 391 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class LogTextMessage extends SLMessage {
    public ArrayList<DataBlock> DataBlock_Fields = new ArrayList<>();

    /** Block DataBlock, Variable. */
    public static class DataBlock {
        public UUID FromAgentId; // LLUUID
        public double GlobalX; // F64
        public double GlobalY; // F64
        public byte[] Message; // Variable 2 - string
        public int Time; // U32 - utc seconds since epoch
        public UUID ToAgentId; // LLUUID
    }

    public LogTextMessage() {
        this.zeroCoded = true;
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
            i = ((DataBlock) it.next()).Message.length + 54 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleLogTextMessage(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 391 (LogTextMessage).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x87);
        byteBuffer.put((byte) this.DataBlock_Fields.size());
        for (DataBlock dataBlock : this.DataBlock_Fields) {
            packUUID(byteBuffer, dataBlock.FromAgentId);
            packUUID(byteBuffer, dataBlock.ToAgentId);
            packDouble(byteBuffer, dataBlock.GlobalX);
            packDouble(byteBuffer, dataBlock.GlobalY);
            packInt(byteBuffer, dataBlock.Time);
            packVariable(byteBuffer, dataBlock.Message, 2);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            DataBlock dataBlock = new DataBlock();
            dataBlock.FromAgentId = unpackUUID(byteBuffer);
            dataBlock.ToAgentId = unpackUUID(byteBuffer);
            dataBlock.GlobalX = unpackDouble(byteBuffer);
            dataBlock.GlobalY = unpackDouble(byteBuffer);
            dataBlock.Time = unpackInt(byteBuffer);
            dataBlock.Message = unpackVariable(byteBuffer, 2);
            this.DataBlock_Fields.add(dataBlock);
        }
    }
}
