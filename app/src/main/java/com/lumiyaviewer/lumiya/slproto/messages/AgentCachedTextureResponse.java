package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * AgentCachedTextureResponse
 * response to viewer queries for cached textures on dataserver (via simulator)
 * dataserver -> simulator -> viewer
 * reliable
 *
 * <p>Template: {@code AgentCachedTextureResponse Low 385 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class AgentCachedTextureResponse extends SLMessage {
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
        public byte[] HostName; // Variable 1
        public UUID TextureID; // LLUUID
        public int TextureIndex; // U8
    }

    public AgentCachedTextureResponse() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        int i = 41;
        Iterator<?> it = this.WearableData_Fields.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            i = ((WearableData) it.next()).HostName.length + 18 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleAgentCachedTextureResponse(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 385 (AgentCachedTextureResponse).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x81);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.AgentData_Field.SerialNum);
        byteBuffer.put((byte) this.WearableData_Fields.size());
        for (WearableData wearableData : this.WearableData_Fields) {
            packUUID(byteBuffer, wearableData.TextureID);
            packByte(byteBuffer, (byte) wearableData.TextureIndex);
            packVariable(byteBuffer, wearableData.HostName, 1);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.SerialNum = unpackInt(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            WearableData wearableData = new WearableData();
            wearableData.TextureID = unpackUUID(byteBuffer);
            wearableData.TextureIndex = unpackByte(byteBuffer) & 0xFF;
            wearableData.HostName = unpackVariable(byteBuffer, 1);
            this.WearableData_Fields.add(wearableData);
        }
    }
}
