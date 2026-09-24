package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * AgentSetAppearance - Update to agent appearance
 *
 * <p>Template: {@code AgentSetAppearance Low 84 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class AgentSetAppearance extends SLMessage {
    public AgentData AgentData_Field;
    public ObjectData ObjectData_Field;
    public ArrayList<WearableData> WearableData_Fields = new ArrayList<>();
    public ArrayList<VisualParam> VisualParam_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public int SerialNum; // U32 - Increases every time the appearance changes. A value of 0 resets.
        public UUID SessionID; // LLUUID
        public LLVector3 Size; // LLVector3
    }

    /** Block ObjectData, Single. */
    public static class ObjectData {
        public byte[] TextureEntry; // Variable 2
    }

    /** Block VisualParam, Variable. */
    public static class VisualParam {
        public int ParamValue; // U8
    }

    /** Block WearableData, Variable. */
    public static class WearableData {
        public UUID CacheID; // LLUUID
        public int TextureIndex; // U8
    }

    public AgentSetAppearance() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.ObjectData_Field = new ObjectData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.WearableData_Fields.size() * 17) + 53 + this.ObjectData_Field.TextureEntry.length + 2 + 1 + (this.VisualParam_Fields.size() * 1);
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleAgentSetAppearance(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 84 (AgentSetAppearance).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x54);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.AgentData_Field.SerialNum);
        packLLVector3(byteBuffer, this.AgentData_Field.Size);
        byteBuffer.put((byte) this.WearableData_Fields.size());
        for (WearableData wearableData : this.WearableData_Fields) {
            packUUID(byteBuffer, wearableData.CacheID);
            packByte(byteBuffer, (byte) wearableData.TextureIndex);
        }
        packVariable(byteBuffer, this.ObjectData_Field.TextureEntry, 2);
        byteBuffer.put((byte) this.VisualParam_Fields.size());
        Iterator<?> it = this.VisualParam_Fields.iterator();
        while (it.hasNext()) {
            packByte(byteBuffer, (byte) ((VisualParam) it.next()).ParamValue);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.SerialNum = unpackInt(byteBuffer);
        this.AgentData_Field.Size = unpackLLVector3(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            WearableData wearableData = new WearableData();
            wearableData.CacheID = unpackUUID(byteBuffer);
            wearableData.TextureIndex = unpackByte(byteBuffer) & 0xFF;
            this.WearableData_Fields.add(wearableData);
        }
        this.ObjectData_Field.TextureEntry = unpackVariable(byteBuffer, 2);
        int i3 = byteBuffer.get() & 0xFF;
        for (int k = 0; k < i3; k++) {
            VisualParam visualParam = new VisualParam();
            visualParam.ParamValue = unpackByte(byteBuffer) & 0xFF;
            this.VisualParam_Fields.add(visualParam);
        }
    }
}
