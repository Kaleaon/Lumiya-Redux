package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * UUIDNameReply
 * Translate a UUID into first and last names
 *
 * <p>Template: {@code UUIDNameReply Low 236 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code handleUUIDNameReply()} in indra/llmessage/llcachename.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class UUIDNameReply extends SLMessage {
    public ArrayList<UUIDNameBlock> UUIDNameBlock_Fields = new ArrayList<>();

    /** Block UUIDNameBlock, Variable. */
    public static class UUIDNameBlock {
        public byte[] FirstName; // Variable 1
        public UUID ID; // LLUUID
        public byte[] LastName; // Variable 1
    }

    public UUIDNameReply() {
        this.zeroCoded = false;
    }

    @Override
    public int CalcPayloadSize() {
        int i = 5;
        Iterator<?> it = this.UUIDNameBlock_Fields.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            UUIDNameBlock uuidNameBlock = (UUIDNameBlock) it.next();
            i = uuidNameBlock.LastName.length + uuidNameBlock.FirstName.length + 17 + 1 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleUUIDNameReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 236 (UUIDNameReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xEC);
        byteBuffer.put((byte) this.UUIDNameBlock_Fields.size());
        for (UUIDNameBlock uuidNameBlock : this.UUIDNameBlock_Fields) {
            packUUID(byteBuffer, uuidNameBlock.ID);
            packVariable(byteBuffer, uuidNameBlock.FirstName, 1);
            packVariable(byteBuffer, uuidNameBlock.LastName, 1);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            UUIDNameBlock uuidNameBlock = new UUIDNameBlock();
            uuidNameBlock.ID = unpackUUID(byteBuffer);
            uuidNameBlock.FirstName = unpackVariable(byteBuffer, 1);
            uuidNameBlock.LastName = unpackVariable(byteBuffer, 1);
            this.UUIDNameBlock_Fields.add(uuidNameBlock);
        }
    }
}
