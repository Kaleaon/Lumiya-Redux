package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Set godlike to 1 if you want to become godlike.
 * Set godlike to 0 if you want to relinquish god powers.
 * viewer -> simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code RequestGodlikePowers Low 257 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class RequestGodlikePowers extends SLMessage {
    public AgentData AgentData_Field;
    public RequestBlock RequestBlock_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block RequestBlock, Single. */
    public static class RequestBlock {
        public boolean Godlike; // BOOL
        public UUID Token; // LLUUID - viewer packs a null, sim packs token
    }

    public RequestGodlikePowers() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.RequestBlock_Field = new RequestBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return 53;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleRequestGodlikePowers(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 257 (RequestGodlikePowers).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x01);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packBoolean(byteBuffer, this.RequestBlock_Field.Godlike);
        packUUID(byteBuffer, this.RequestBlock_Field.Token);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.RequestBlock_Field.Godlike = unpackBoolean(byteBuffer);
        this.RequestBlock_Field.Token = unpackUUID(byteBuffer);
    }
}
