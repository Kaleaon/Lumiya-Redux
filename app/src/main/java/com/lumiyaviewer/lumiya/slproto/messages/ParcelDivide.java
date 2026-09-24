package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * ParcelDivide
 * If the selection is a subsection of exactly one parcel,
 * chop out that section and make a new parcel of it.
 * viewer -> sim
 * reliable
 *
 * <p>Template: {@code ParcelDivide Low 211 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class ParcelDivide extends SLMessage {
    public AgentData AgentData_Field;
    public ParcelData ParcelData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block ParcelData, Single. */
    public static class ParcelData {
        public float East; // F32
        public float North; // F32
        public float South; // F32
        public float West; // F32
    }

    public ParcelDivide() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.ParcelData_Field = new ParcelData();
    }

    @Override
    public int CalcPayloadSize() {
        return 52;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleParcelDivide(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 211 (ParcelDivide).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xD3);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packFloat(byteBuffer, this.ParcelData_Field.West);
        packFloat(byteBuffer, this.ParcelData_Field.South);
        packFloat(byteBuffer, this.ParcelData_Field.East);
        packFloat(byteBuffer, this.ParcelData_Field.North);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.ParcelData_Field.West = unpackFloat(byteBuffer);
        this.ParcelData_Field.South = unpackFloat(byteBuffer);
        this.ParcelData_Field.East = unpackFloat(byteBuffer);
        this.ParcelData_Field.North = unpackFloat(byteBuffer);
    }
}
