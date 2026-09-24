package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Cancels user relationship
 * Updates inventory for both users.
 * Stops agent tracking in userserver.
 * viewer -> userserver -> dataserver
 * reliable
 *
 * <p>Template: {@code TerminateFriendship Low 300 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code processTerminateFriendship()} in indra/newview/llcallingcard.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class TerminateFriendship extends SLMessage {
    public AgentData AgentData_Field;
    public ExBlock ExBlock_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block ExBlock, Single. */
    public static class ExBlock {
        public UUID OtherID; // LLUUID
    }

    public TerminateFriendship() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.ExBlock_Field = new ExBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return 52;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleTerminateFriendship(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 300 (TerminateFriendship).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x2C);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.ExBlock_Field.OtherID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.ExBlock_Field.OtherID = unpackUUID(byteBuffer);
    }
}
