package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * sim -> viewer
 *
 * <p>Template: {@code MapBlockReply Low 409 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLWorldMapMessage::processMapBlockReply()} in indra/newview/llworldmapmessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class MapBlockReply extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<Data> Data_Fields = new ArrayList<>();
    public ArrayList<Size> Size_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public int Flags; // U32
    }

    /** Block Data, Variable. */
    public static class Data {
        public int Access; // U8 - PG, mature, etc.
        public int Agents; // U8
        public UUID MapImageID; // LLUUID
        public byte[] Name; // Variable 1 - string
        public int RegionFlags; // U32
        public int WaterHeight; // U8 - meters
        public int X; // U16 - in region-widths
        public int Y; // U16 - in region-widths
    }

    public static class Size {
        public int SizeX;
        public int SizeY;
    }

    public MapBlockReply() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        int i = 25;
        Iterator<?> it = this.Data_Fields.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2 + 1 + (this.Size_Fields.size() * 4);
            }
            i = ((Data) it.next()).Name.length + 5 + 1 + 4 + 1 + 1 + 16 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleMapBlockReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 409 (MapBlockReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x99);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packInt(byteBuffer, this.AgentData_Field.Flags);
        byteBuffer.put((byte) this.Data_Fields.size());
        for (Data data : this.Data_Fields) {
            packShort(byteBuffer, (short) data.X);
            packShort(byteBuffer, (short) data.Y);
            packVariable(byteBuffer, data.Name, 1);
            packByte(byteBuffer, (byte) data.Access);
            packInt(byteBuffer, data.RegionFlags);
            packByte(byteBuffer, (byte) data.WaterHeight);
            packByte(byteBuffer, (byte) data.Agents);
            packUUID(byteBuffer, data.MapImageID);
        }
        byteBuffer.put((byte) this.Size_Fields.size());
        for (Size size : this.Size_Fields) {
            packShort(byteBuffer, (short) size.SizeX);
            packShort(byteBuffer, (short) size.SizeY);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.Flags = unpackInt(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            Data data = new Data();
            data.X = unpackShort(byteBuffer) & 65535;
            data.Y = unpackShort(byteBuffer) & 65535;
            data.Name = unpackVariable(byteBuffer, 1);
            data.Access = unpackByte(byteBuffer) & 0xFF;
            data.RegionFlags = unpackInt(byteBuffer);
            data.WaterHeight = unpackByte(byteBuffer) & 0xFF;
            data.Agents = unpackByte(byteBuffer) & 0xFF;
            data.MapImageID = unpackUUID(byteBuffer);
            this.Data_Fields.add(data);
        }
        int i3 = byteBuffer.get() & 0xFF;
        for (int k = 0; k < i3; k++) {
            Size size = new Size();
            size.SizeX = unpackShort(byteBuffer) & 65535;
            size.SizeY = unpackShort(byteBuffer) & 65535;
            this.Size_Fields.add(size);
        }
    }
}
