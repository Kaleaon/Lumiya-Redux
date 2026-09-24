package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * DataHomeLocationReply data->sim
 * response is the location of agent home.
 *
 * <p>Template: {@code DataHomeLocationReply Low 68 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class DataHomeLocationReply extends SLMessage {
    public Info Info_Field;

    /** Block Info, Single. */
    public static class Info {
        public UUID AgentID; // LLUUID
        public LLVector3 LookAt; // LLVector3
        public LLVector3 Position; // LLVector3 - region coords
        public long RegionHandle; // U64
    }

    public DataHomeLocationReply() {
        this.zeroCoded = false;
        this.Info_Field = new Info();
    }

    @Override
    public int CalcPayloadSize() {
        return 52;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleDataHomeLocationReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 68 (DataHomeLocationReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x44);
        packUUID(byteBuffer, this.Info_Field.AgentID);
        packLong(byteBuffer, this.Info_Field.RegionHandle);
        packLLVector3(byteBuffer, this.Info_Field.Position);
        packLLVector3(byteBuffer, this.Info_Field.LookAt);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.Info_Field.AgentID = unpackUUID(byteBuffer);
        this.Info_Field.RegionHandle = unpackLong(byteBuffer);
        this.Info_Field.Position = unpackLLVector3(byteBuffer);
        this.Info_Field.LookAt = unpackLLVector3(byteBuffer);
    }
}
