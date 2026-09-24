package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * viewer -> sim
 * mark parcel and double secret agent content on parcel as owned by
 * governor/maint and adjusts permissions approriately. Godlike request.
 *
 * <p>Template: {@code ParcelGodMarkAsContent Low 227 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class ParcelGodMarkAsContent extends SLMessage {
    public AgentData AgentData_Field;
    public ParcelData ParcelData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block ParcelData, Single. */
    public static class ParcelData {
        public int LocalID; // S32
    }

    public ParcelGodMarkAsContent() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.ParcelData_Field = new ParcelData();
    }

    @Override
    public int CalcPayloadSize() {
        return 40;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleParcelGodMarkAsContent(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 227 (ParcelGodMarkAsContent).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xE3);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.ParcelData_Field.LocalID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.ParcelData_Field.LocalID = unpackInt(byteBuffer);
    }
}
