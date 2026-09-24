package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * LandStatRequest
 * Sent by the viewer to request collider/script information for a parcel
 *
 * <p>Template: {@code LandStatRequest Low 421 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class LandStatRequest extends SLMessage {
    public AgentData AgentData_Field;
    public RequestData RequestData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block RequestData, Single. */
    public static class RequestData {
        public byte[] Filter; // Variable 1
        public int ParcelLocalID; // S32
        public int ReportType; // U32
        public int RequestFlags; // U32
    }

    public LandStatRequest() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.RequestData_Field = new RequestData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.RequestData_Field.Filter.length + 9 + 4 + 36;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleLandStatRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 421 (LandStatRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0xA5);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.RequestData_Field.ReportType);
        packInt(byteBuffer, this.RequestData_Field.RequestFlags);
        packVariable(byteBuffer, this.RequestData_Field.Filter, 1);
        packInt(byteBuffer, this.RequestData_Field.ParcelLocalID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.RequestData_Field.ReportType = unpackInt(byteBuffer);
        this.RequestData_Field.RequestFlags = unpackInt(byteBuffer);
        this.RequestData_Field.Filter = unpackVariable(byteBuffer, 1);
        this.RequestData_Field.ParcelLocalID = unpackInt(byteBuffer);
    }
}
