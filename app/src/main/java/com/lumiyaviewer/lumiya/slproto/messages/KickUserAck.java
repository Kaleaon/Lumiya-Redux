package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * ack sent from the simulator up to the main database so that login
 * can continue.
 *
 * <p>Template: {@code KickUserAck Low 164 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class KickUserAck extends SLMessage {
    public UserInfo UserInfo_Field;

    /** Block UserInfo, Single. */
    public static class UserInfo {
        public int Flags; // U32
        public UUID SessionID; // LLUUID
    }

    public KickUserAck() {
        this.zeroCoded = false;
        this.UserInfo_Field = new UserInfo();
    }

    @Override
    public int CalcPayloadSize() {
        return 24;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleKickUserAck(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 164 (KickUserAck).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xA4);
        packUUID(byteBuffer, this.UserInfo_Field.SessionID);
        packInt(byteBuffer, this.UserInfo_Field.Flags);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.UserInfo_Field.SessionID = unpackUUID(byteBuffer);
        this.UserInfo_Field.Flags = unpackInt(byteBuffer);
    }
}
