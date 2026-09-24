package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * sim -> viewer
 * ParcelAccessListReply
 *
 * <p>Template: {@code ParcelAccessListReply Low 216 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLViewerParcelMgr::processParcelAccessListReply()} in indra/newview/llviewerparcelmgr.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class ParcelAccessListReply extends SLMessage {
    public Data Data_Field;
    public ArrayList<List> List_Fields = new ArrayList<>();

    /** Block Data, Single. */
    public static class Data {
        public UUID AgentID; // LLUUID
        public int Flags; // U32
        public int LocalID; // S32
        public int SequenceID; // S32
    }

    /** Block List, Variable. */
    public static class List {
        public int Flags; // U32
        public UUID ID; // LLUUID
        public int Time; // S32 - time_t
    }

    public ParcelAccessListReply() {
        this.zeroCoded = true;
        this.Data_Field = new Data();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.List_Fields.size() * 24) + 33;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleParcelAccessListReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 216 (ParcelAccessListReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xD8);
        packUUID(byteBuffer, this.Data_Field.AgentID);
        packInt(byteBuffer, this.Data_Field.SequenceID);
        packInt(byteBuffer, this.Data_Field.Flags);
        packInt(byteBuffer, this.Data_Field.LocalID);
        byteBuffer.put((byte) this.List_Fields.size());
        for (List list : this.List_Fields) {
            packUUID(byteBuffer, list.ID);
            packInt(byteBuffer, list.Time);
            packInt(byteBuffer, list.Flags);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.Data_Field.AgentID = unpackUUID(byteBuffer);
        this.Data_Field.SequenceID = unpackInt(byteBuffer);
        this.Data_Field.Flags = unpackInt(byteBuffer);
        this.Data_Field.LocalID = unpackInt(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            List list = new List();
            list.ID = unpackUUID(byteBuffer);
            list.Time = unpackInt(byteBuffer);
            list.Flags = unpackInt(byteBuffer);
            this.List_Fields.add(list);
        }
    }
}
