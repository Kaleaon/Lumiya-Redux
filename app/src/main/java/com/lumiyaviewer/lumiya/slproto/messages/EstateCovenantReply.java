package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * EstateCovenantReply
 * sim -> viewer
 * reliable
 *
 * <p>Template: {@code EstateCovenantReply Low 204 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_covenant_reply()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class EstateCovenantReply extends SLMessage {
    public Data Data_Field;

    /** Block Data, Single. */
    public static class Data {
        public UUID CovenantID; // LLUUID
        public int CovenantTimestamp; // U32
        public byte[] EstateName; // Variable 1 - string
        public UUID EstateOwnerID; // LLUUID
    }

    public EstateCovenantReply() {
        this.zeroCoded = false;
        this.Data_Field = new Data();
    }

    @Override
    public int CalcPayloadSize() {
        return this.Data_Field.EstateName.length + 21 + 16 + 4;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleEstateCovenantReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 204 (EstateCovenantReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xCC);
        packUUID(byteBuffer, this.Data_Field.CovenantID);
        packInt(byteBuffer, this.Data_Field.CovenantTimestamp);
        packVariable(byteBuffer, this.Data_Field.EstateName, 1);
        packUUID(byteBuffer, this.Data_Field.EstateOwnerID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.Data_Field.CovenantID = unpackUUID(byteBuffer);
        this.Data_Field.CovenantTimestamp = unpackInt(byteBuffer);
        this.Data_Field.EstateName = unpackVariable(byteBuffer, 1);
        this.Data_Field.EstateOwnerID = unpackUUID(byteBuffer);
    }
}
