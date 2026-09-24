package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * SimulatorSetMap
 * simulator -> dataserver
 * reliable
 * Used to upload a map image into the database (currently used only for Land For Sale)
 *
 * <p>Template: {@code SimulatorSetMap Low 6 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class SimulatorSetMap extends SLMessage {
    public MapData MapData_Field;

    /** Block MapData, Single. */
    public static class MapData {
        public UUID MapImage; // LLUUID
        public long RegionHandle; // U64
        public int Type; // S32
    }

    public SimulatorSetMap() {
        this.zeroCoded = false;
        this.MapData_Field = new MapData();
    }

    @Override
    public int CalcPayloadSize() {
        return 32;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleSimulatorSetMap(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 6 (SimulatorSetMap).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x06);
        packLong(byteBuffer, this.MapData_Field.RegionHandle);
        packInt(byteBuffer, this.MapData_Field.Type);
        packUUID(byteBuffer, this.MapData_Field.MapImage);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.MapData_Field.RegionHandle = unpackLong(byteBuffer);
        this.MapData_Field.Type = unpackInt(byteBuffer);
        this.MapData_Field.MapImage = unpackUUID(byteBuffer);
    }
}
