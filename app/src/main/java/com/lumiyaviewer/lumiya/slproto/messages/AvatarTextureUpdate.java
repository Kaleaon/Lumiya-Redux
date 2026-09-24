package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * AvatarTextureUpdate
 * simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code AvatarTextureUpdate Low 4 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class AvatarTextureUpdate extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<WearableData> WearableData_Fields = new ArrayList<>();
    public ArrayList<TextureData> TextureData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public boolean TexturesChanged; // BOOL
    }

    /** Block TextureData, Variable. */
    public static class TextureData {
        public UUID TextureID; // LLUUID
    }

    /** Block WearableData, Variable. */
    public static class WearableData {
        public UUID CacheID; // LLUUID
        public byte[] HostName; // Variable 1
        public int TextureIndex; // U8
    }

    public AvatarTextureUpdate() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        int i = 22;
        Iterator<?> it = this.WearableData_Fields.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2 + 1 + (this.TextureData_Fields.size() * 16);
            }
            i = ((WearableData) it.next()).HostName.length + 18 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleAvatarTextureUpdate(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 4 (AvatarTextureUpdate).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x04);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packBoolean(byteBuffer, this.AgentData_Field.TexturesChanged);
        byteBuffer.put((byte) this.WearableData_Fields.size());
        for (WearableData wearableData : this.WearableData_Fields) {
            packUUID(byteBuffer, wearableData.CacheID);
            packByte(byteBuffer, (byte) wearableData.TextureIndex);
            packVariable(byteBuffer, wearableData.HostName, 1);
        }
        byteBuffer.put((byte) this.TextureData_Fields.size());
        Iterator<?> it = this.TextureData_Fields.iterator();
        while (it.hasNext()) {
            packUUID(byteBuffer, ((TextureData) it.next()).TextureID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.TexturesChanged = unpackBoolean(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            WearableData wearableData = new WearableData();
            wearableData.CacheID = unpackUUID(byteBuffer);
            wearableData.TextureIndex = unpackByte(byteBuffer) & 0xFF;
            wearableData.HostName = unpackVariable(byteBuffer, 1);
            this.WearableData_Fields.add(wearableData);
        }
        int i3 = byteBuffer.get() & 0xFF;
        for (int k = 0; k < i3; k++) {
            TextureData textureData = new TextureData();
            textureData.TextureID = unpackUUID(byteBuffer);
            this.TextureData_Fields.add(textureData);
        }
    }
}
