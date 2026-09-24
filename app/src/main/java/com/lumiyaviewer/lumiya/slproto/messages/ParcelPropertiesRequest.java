package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * ParcelPropertiesRequest
 * SequenceID should be -1 or -2, and is echoed back in the
 * parcel properties message.
 * viewer -> sim
 * reliable
 *
 * <p>Template: {@code ParcelPropertiesRequest Medium 11 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class ParcelPropertiesRequest extends SLMessage {
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
        public int SequenceID; // S32
        public boolean SnapSelection; // BOOL
        public float South; // F32
        public float West; // F32
    }

    public ParcelPropertiesRequest() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.ParcelData_Field = new ParcelData();
    }

    @Override
    public int CalcPayloadSize() {
        return 55;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleParcelPropertiesRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Medium 11 (ParcelPropertiesRequest).
        byteBuffer.put((byte) 0xFF);
        byteBuffer.put((byte) 0x0B);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.ParcelData_Field.SequenceID);
        packFloat(byteBuffer, this.ParcelData_Field.West);
        packFloat(byteBuffer, this.ParcelData_Field.South);
        packFloat(byteBuffer, this.ParcelData_Field.East);
        packFloat(byteBuffer, this.ParcelData_Field.North);
        packBoolean(byteBuffer, this.ParcelData_Field.SnapSelection);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.ParcelData_Field.SequenceID = unpackInt(byteBuffer);
        this.ParcelData_Field.West = unpackFloat(byteBuffer);
        this.ParcelData_Field.South = unpackFloat(byteBuffer);
        this.ParcelData_Field.East = unpackFloat(byteBuffer);
        this.ParcelData_Field.North = unpackFloat(byteBuffer);
        this.ParcelData_Field.SnapSelection = unpackBoolean(byteBuffer);
    }
}
