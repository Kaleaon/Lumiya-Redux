package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * Sent from viewer to simulator to set user rights. This message will be
 * relayed up to the dataserver through a PUT. If that
 * succeeds, an UpdateUserRights will be relayed to the originating
 * viewer, and a presence lookup will be performed to find
 * agent-related and the same PUT will be issued to the sim host if
 * they are online.
 *
 * <p>Template: {@code GrantUserRights Low 320 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class GrantUserRights extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<Rights> Rights_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block Rights, Variable. */
    public static class Rights {
        public UUID AgentRelated; // LLUUID
        public int RelatedRights; // S32
    }

    public GrantUserRights() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.Rights_Fields.size() * 20) + 37;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleGrantUserRights(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 320 (GrantUserRights).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x40);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        byteBuffer.put((byte) this.Rights_Fields.size());
        for (Rights rights : this.Rights_Fields) {
            packUUID(byteBuffer, rights.AgentRelated);
            packInt(byteBuffer, rights.RelatedRights);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            Rights rights = new Rights();
            rights.AgentRelated = unpackUUID(byteBuffer);
            rights.RelatedRights = unpackInt(byteBuffer);
            this.Rights_Fields.add(rights);
        }
    }
}
