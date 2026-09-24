package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * UUIDGroupNameReply
 * Translate a UUID into a group name
 *
 * <p>Template: {@code UUIDGroupNameReply Low 238 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code handleUUIDGroupNameReply()} in indra/llmessage/llcachename.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class UUIDGroupNameReply extends SLMessage {
    public ArrayList<UUIDNameBlock> UUIDNameBlock_Fields = new ArrayList<>();

    /** Block UUIDNameBlock, Variable. */
    public static class UUIDNameBlock {
        public byte[] GroupName; // Variable 1
        public UUID ID; // LLUUID
    }

    public UUIDGroupNameReply() {
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
            i = ((UUIDNameBlock) it.next()).GroupName.length + 17 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleUUIDGroupNameReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 238 (UUIDGroupNameReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xEE);
        byteBuffer.put((byte) this.UUIDNameBlock_Fields.size());
        for (UUIDNameBlock uUIDNameBlock : this.UUIDNameBlock_Fields) {
            packUUID(byteBuffer, uUIDNameBlock.ID);
            packVariable(byteBuffer, uUIDNameBlock.GroupName, 1);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            UUIDNameBlock uUIDNameBlock = new UUIDNameBlock();
            uUIDNameBlock.ID = unpackUUID(byteBuffer);
            uUIDNameBlock.GroupName = unpackVariable(byteBuffer, 1);
            this.UUIDNameBlock_Fields.add(uUIDNameBlock);
        }
    }
}
