package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * Request Image - Sent by the viewer to request a specified image at a specified resolution
 *
 * <p>Template: {@code RequestImage High 8 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class RequestImage extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<RequestImageData> RequestImageData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    public static class RequestImageData {
        public int DiscardLevel; // S8
        public float DownloadPriority; // F32
        public UUID Image; // LLUUID
        public int Packet; // U32
        public int Type; // U8
    }

    public RequestImage() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.RequestImageData_Fields.size() * 26) + 34;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleRequestImage(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: High 8 (RequestImage).
        byteBuffer.put((byte) 0x08);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        byteBuffer.put((byte) this.RequestImageData_Fields.size());
        for (RequestImageData requestImageData : this.RequestImageData_Fields) {
            packUUID(byteBuffer, requestImageData.Image);
            packByte(byteBuffer, (byte) requestImageData.DiscardLevel);
            packFloat(byteBuffer, requestImageData.DownloadPriority);
            packInt(byteBuffer, requestImageData.Packet);
            packByte(byteBuffer, (byte) requestImageData.Type);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            RequestImageData requestImageData = new RequestImageData();
            requestImageData.Image = unpackUUID(byteBuffer);
            requestImageData.DiscardLevel = unpackByte(byteBuffer);
            requestImageData.DownloadPriority = unpackFloat(byteBuffer);
            requestImageData.Packet = unpackInt(byteBuffer);
            requestImageData.Type = unpackByte(byteBuffer) & 0xFF;
            this.RequestImageData_Fields.add(requestImageData);
        }
    }
}
