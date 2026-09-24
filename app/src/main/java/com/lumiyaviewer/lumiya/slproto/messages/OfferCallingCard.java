package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * used to give someone a calling card.
 *
 * <p>Template: {@code OfferCallingCard Low 301 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_offer_callingcard()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class OfferCallingCard extends SLMessage {
    public AgentBlock AgentBlock_Field;
    public AgentData AgentData_Field;

    /** Block AgentBlock, Single. */
    public static class AgentBlock {
        public UUID DestID; // LLUUID
        public UUID TransactionID; // LLUUID
    }

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    public OfferCallingCard() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.AgentBlock_Field = new AgentBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return 68;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleOfferCallingCard(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 301 (OfferCallingCard).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x2D);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.AgentBlock_Field.DestID);
        packUUID(byteBuffer, this.AgentBlock_Field.TransactionID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentBlock_Field.DestID = unpackUUID(byteBuffer);
        this.AgentBlock_Field.TransactionID = unpackUUID(byteBuffer);
    }
}
