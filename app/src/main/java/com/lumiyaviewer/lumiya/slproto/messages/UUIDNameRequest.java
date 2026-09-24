package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * UUID to name lookup
 * UUIDNameRequest
 * Translate a UUID into first and last names
 *
 * <p>Template: {@code UUIDNameRequest Low 235 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code handleUUIDNameRequest()} in indra/llmessage/llcachename.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class UUIDNameRequest extends SLMessage {
    public ArrayList<UUIDNameBlock> UUIDNameBlock_Fields = new ArrayList<>();

    /** Block UUIDNameBlock, Variable. */
    public static class UUIDNameBlock {
        public UUID ID; // LLUUID
    }

    public UUIDNameRequest() {
        this.zeroCoded = false;
    }

    @Override
    public int CalcPayloadSize() {
        return (this.UUIDNameBlock_Fields.size() * 16) + 5;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleUUIDNameRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 235 (UUIDNameRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xEB);
        byteBuffer.put((byte) this.UUIDNameBlock_Fields.size());
        Iterator<?> it = this.UUIDNameBlock_Fields.iterator();
        while (it.hasNext()) {
            packUUID(byteBuffer, ((UUIDNameBlock) it.next()).ID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            UUIDNameBlock uuidNameBlock = new UUIDNameBlock();
            uuidNameBlock.ID = unpackUUID(byteBuffer);
            this.UUIDNameBlock_Fields.add(uuidNameBlock);
        }
    }
}
