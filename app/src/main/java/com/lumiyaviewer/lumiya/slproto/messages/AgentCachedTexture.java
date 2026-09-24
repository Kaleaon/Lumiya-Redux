package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * AgentCachedTexture
 * viewer queries for cached textures on dataserver (via simulator)
 * viewer -> simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code AgentCachedTexture Low 384 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class AgentCachedTexture extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<WearableData> WearableData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public int SerialNum; // S32
        public UUID SessionID; // LLUUID
    }

    /** Block WearableData, Variable. */
    public static class WearableData {
        public UUID ID; // LLUUID
        public int TextureIndex; // U8
    }

    public AgentCachedTexture() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.WearableData_Fields.size() * 17) + 41;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleAgentCachedTexture(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 384 (AgentCachedTexture).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x80);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.AgentData_Field.SerialNum);
        byteBuffer.put((byte) this.WearableData_Fields.size());
        for (WearableData wearableData : this.WearableData_Fields) {
            packUUID(byteBuffer, wearableData.ID);
            packByte(byteBuffer, (byte) wearableData.TextureIndex);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.SerialNum = unpackInt(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            WearableData wearableData = new WearableData();
            wearableData.ID = unpackUUID(byteBuffer);
            wearableData.TextureIndex = unpackByte(byteBuffer) & 0xFF;
            this.WearableData_Fields.add(wearableData);
        }
    }
}
