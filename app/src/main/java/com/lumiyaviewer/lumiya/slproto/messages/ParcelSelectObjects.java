package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * ParcelSelectObjects
 * viewer -> sim
 * reliable
 *
 * <p>Template: {@code ParcelSelectObjects Low 202 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class ParcelSelectObjects extends SLMessage {
    public AgentData AgentData_Field;
    public ParcelData ParcelData_Field;
    public ArrayList<ReturnIDs> ReturnIDs_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block ParcelData, Single. */
    public static class ParcelData {
        public int LocalID; // S32
        public int ReturnType; // U32
    }

    /** Block ReturnIDs, Variable. */
    public static class ReturnIDs {
        public UUID ReturnID; // LLUUID
    }

    public ParcelSelectObjects() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.ParcelData_Field = new ParcelData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.ReturnIDs_Fields.size() * 16) + 45;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleParcelSelectObjects(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 202 (ParcelSelectObjects).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xCA);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.ParcelData_Field.LocalID);
        packInt(byteBuffer, this.ParcelData_Field.ReturnType);
        byteBuffer.put((byte) this.ReturnIDs_Fields.size());
        Iterator<?> it = this.ReturnIDs_Fields.iterator();
        while (it.hasNext()) {
            packUUID(byteBuffer, ((ReturnIDs) it.next()).ReturnID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.ParcelData_Field.LocalID = unpackInt(byteBuffer);
        this.ParcelData_Field.ReturnType = unpackInt(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            ReturnIDs returnIDs = new ReturnIDs();
            returnIDs.ReturnID = unpackUUID(byteBuffer);
            this.ReturnIDs_Fields.add(returnIDs);
        }
    }
}
