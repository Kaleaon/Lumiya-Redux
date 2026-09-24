package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * sim -> viewer
 *
 * <p>Template: {@code MapLayerReply Low 406 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class MapLayerReply extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<LayerData> LayerData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public int Flags; // U32
    }

    /** Block LayerData, Variable. */
    public static class LayerData {
        public int Bottom; // U32
        public UUID ImageID; // LLUUID
        public int Left; // U32
        public int Right; // U32
        public int Top; // U32
    }

    public MapLayerReply() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.LayerData_Fields.size() * 32) + 25;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleMapLayerReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 406 (MapLayerReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x96);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packInt(byteBuffer, this.AgentData_Field.Flags);
        byteBuffer.put((byte) this.LayerData_Fields.size());
        for (LayerData layerData : this.LayerData_Fields) {
            packInt(byteBuffer, layerData.Left);
            packInt(byteBuffer, layerData.Right);
            packInt(byteBuffer, layerData.Top);
            packInt(byteBuffer, layerData.Bottom);
            packUUID(byteBuffer, layerData.ImageID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.Flags = unpackInt(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            LayerData layerData = new LayerData();
            layerData.Left = unpackInt(byteBuffer);
            layerData.Right = unpackInt(byteBuffer);
            layerData.Top = unpackInt(byteBuffer);
            layerData.Bottom = unpackInt(byteBuffer);
            layerData.ImageID = unpackUUID(byteBuffer);
            this.LayerData_Fields.add(layerData);
        }
    }
}
