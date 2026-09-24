package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * This message is sent from the simulator to the viewer to indicate a
 * targets granted rights. This is only sent to the originator of the
 * request and the target agent if it is a modify or map
 * right. Adding/removing online status rights will show up as an
 * online/offline notification.
 *
 * <p>Template: {@code ChangeUserRights Low 321 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code processChangeUserRights()} in indra/newview/llcallingcard.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class ChangeUserRights extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<Rights> Rights_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
    }

    /** Block Rights, Variable. */
    public static class Rights {
        public UUID AgentRelated; // LLUUID
        public int RelatedRights; // S32
    }

    public ChangeUserRights() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.Rights_Fields.size() * 20) + 21;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleChangeUserRights(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 321 (ChangeUserRights).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x41);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        byteBuffer.put((byte) this.Rights_Fields.size());
        for (Rights rights : this.Rights_Fields) {
            packUUID(byteBuffer, rights.AgentRelated);
            packInt(byteBuffer, rights.RelatedRights);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            Rights rights = new Rights();
            rights.AgentRelated = unpackUUID(byteBuffer);
            rights.RelatedRights = unpackInt(byteBuffer);
            this.Rights_Fields.add(rights);
        }
    }
}
