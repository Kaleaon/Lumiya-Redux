package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;

/**
 * LayerData - Sent to viewer - encodes layer data
 *
 * <p>Template: {@code LayerData High 11 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_layer_data()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class LayerData extends SLMessage {
    public LayerDataData LayerDataData_Field;
    public LayerID LayerID_Field;

    public static class LayerDataData {
        public byte[] Data; // Variable 2
    }

    /** Block LayerID, Single. */
    public static class LayerID {
        public int Type; // U8
    }

    public LayerData() {
        this.zeroCoded = false;
        this.LayerID_Field = new LayerID();
        this.LayerDataData_Field = new LayerDataData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.LayerDataData_Field.Data.length + 2 + 2;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleLayerData(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: High 11 (LayerData).
        byteBuffer.put((byte) 0x0B);
        packByte(byteBuffer, (byte) this.LayerID_Field.Type);
        packVariable(byteBuffer, this.LayerDataData_Field.Data, 2);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.LayerID_Field.Type = unpackByte(byteBuffer) & 0xFF;
        this.LayerDataData_Field.Data = unpackVariable(byteBuffer, 2);
    }
}
