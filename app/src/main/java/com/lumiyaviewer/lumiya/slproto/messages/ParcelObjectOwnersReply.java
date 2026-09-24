package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * ParcelObjectOwnersReply
 * simulator -> viewer
 * reliable
 *
 * <p>Template: {@code ParcelObjectOwnersReply Low 57 Trusted Zerocoded UDPDeprecated}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLPanelLandObjects::processParcelObjectOwnersReply()} in indra/newview/llfloaterland.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class ParcelObjectOwnersReply extends SLMessage {
    public ArrayList<Data> Data_Fields = new ArrayList<>();

    /** Block Data, Variable. */
    public static class Data {
        public int Count; // S32
        public boolean IsGroupOwned; // BOOL
        public boolean OnlineStatus; // BOOL
        public UUID OwnerID; // LLUUID
    }

    public ParcelObjectOwnersReply() {
        this.zeroCoded = true;
    }

    @Override
    public int CalcPayloadSize() {
        return (this.Data_Fields.size() * 22) + 5;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleParcelObjectOwnersReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 57 (ParcelObjectOwnersReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x39);
        byteBuffer.put((byte) this.Data_Fields.size());
        for (Data data : this.Data_Fields) {
            packUUID(byteBuffer, data.OwnerID);
            packBoolean(byteBuffer, data.IsGroupOwned);
            packInt(byteBuffer, data.Count);
            packBoolean(byteBuffer, data.OnlineStatus);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            Data data = new Data();
            data.OwnerID = unpackUUID(byteBuffer);
            data.IsGroupOwned = unpackBoolean(byteBuffer);
            data.Count = unpackInt(byteBuffer);
            data.OnlineStatus = unpackBoolean(byteBuffer);
            this.Data_Fields.add(data);
        }
    }
}
