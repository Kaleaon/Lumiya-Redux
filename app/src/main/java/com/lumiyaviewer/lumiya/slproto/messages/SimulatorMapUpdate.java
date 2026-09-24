package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;

/**
 * SimulatorMapUpdate
 * simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code SimulatorMapUpdate Low 5 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class SimulatorMapUpdate extends SLMessage {
    public MapData MapData_Field;

    /** Block MapData, Single. */
    public static class MapData {
        public int Flags; // U32
    }

    public SimulatorMapUpdate() {
        this.zeroCoded = false;
        this.MapData_Field = new MapData();
    }

    @Override
    public int CalcPayloadSize() {
        return 8;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleSimulatorMapUpdate(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 5 (SimulatorMapUpdate).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x05);
        packInt(byteBuffer, this.MapData_Field.Flags);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.MapData_Field.Flags = unpackInt(byteBuffer);
    }
}
