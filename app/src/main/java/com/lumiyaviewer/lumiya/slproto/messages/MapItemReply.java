package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * sim -> viewer
 *
 * <p>Template: {@code MapItemReply Low 411 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLWorldMapMessage::processMapItemReply()} in indra/newview/llworldmapmessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class MapItemReply extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<Data> Data_Fields = new ArrayList<>();
    public RequestData RequestData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public int Flags; // U32
    }

    /** Block Data, Variable. */
    public static class Data {
        public int Extra; // S32 - extra information
        public int Extra2; // S32 - extra information
        public UUID ID; // LLUUID - identifier id
        public byte[] Name; // Variable 1 - identifier string
        public int X; // U32 - global position
        public int Y; // U32 - global position
    }

    /** Block RequestData, Single. */
    public static class RequestData {
        public int ItemType; // U32
    }

    public MapItemReply() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.RequestData_Field = new RequestData();
    }

    @Override
    public int CalcPayloadSize() {
        int i = 29;
        Iterator<?> it = this.Data_Fields.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            i = ((Data) it.next()).Name.length + 33 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleMapItemReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 411 (MapItemReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x9B);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packInt(byteBuffer, this.AgentData_Field.Flags);
        packInt(byteBuffer, this.RequestData_Field.ItemType);
        byteBuffer.put((byte) this.Data_Fields.size());
        for (Data data : this.Data_Fields) {
            packInt(byteBuffer, data.X);
            packInt(byteBuffer, data.Y);
            packUUID(byteBuffer, data.ID);
            packInt(byteBuffer, data.Extra);
            packInt(byteBuffer, data.Extra2);
            packVariable(byteBuffer, data.Name, 1);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.Flags = unpackInt(byteBuffer);
        this.RequestData_Field.ItemType = unpackInt(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            Data data = new Data();
            data.X = unpackInt(byteBuffer);
            data.Y = unpackInt(byteBuffer);
            data.ID = unpackUUID(byteBuffer);
            data.Extra = unpackInt(byteBuffer);
            data.Extra2 = unpackInt(byteBuffer);
            data.Name = unpackVariable(byteBuffer, 1);
            this.Data_Fields.add(data);
        }
    }
}
