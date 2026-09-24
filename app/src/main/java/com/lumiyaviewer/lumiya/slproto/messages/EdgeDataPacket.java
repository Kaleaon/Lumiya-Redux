package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;

/**
 * Edge data - compressed edge data
 *
 * <p>Template: {@code EdgeDataPacket High 24 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class EdgeDataPacket extends SLMessage {
    public EdgeData EdgeData_Field;

    /** Block EdgeData, Single. */
    public static class EdgeData {
        public int Direction; // U8
        public byte[] LayerData; // Variable 2
        public int LayerType; // U8
    }

    public EdgeDataPacket() {
        this.zeroCoded = true;
        this.EdgeData_Field = new EdgeData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.EdgeData_Field.LayerData.length + 4 + 1;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleEdgeDataPacket(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: High 24 (EdgeDataPacket).
        byteBuffer.put((byte) 0x18);
        packByte(byteBuffer, (byte) this.EdgeData_Field.LayerType);
        packByte(byteBuffer, (byte) this.EdgeData_Field.Direction);
        packVariable(byteBuffer, this.EdgeData_Field.LayerData, 2);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.EdgeData_Field.LayerType = unpackByte(byteBuffer) & 0xFF;
        this.EdgeData_Field.Direction = unpackByte(byteBuffer) & 0xFF;
        this.EdgeData_Field.LayerData = unpackVariable(byteBuffer, 2);
    }
}
