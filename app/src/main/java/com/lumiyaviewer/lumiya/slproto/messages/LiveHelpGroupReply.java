package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Send down the group
 * dataserver -> userserver
 *
 * <p>Template: {@code LiveHelpGroupReply Low 380 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class LiveHelpGroupReply extends SLMessage {
    public ReplyData ReplyData_Field;

    /** Block ReplyData, Single. */
    public static class ReplyData {
        public UUID GroupID; // LLUUID
        public UUID RequestID; // LLUUID
        public byte[] Selection; // Variable 1 - selection criteria all or active
    }

    public LiveHelpGroupReply() {
        this.zeroCoded = false;
        this.ReplyData_Field = new ReplyData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.ReplyData_Field.Selection.length + 33 + 4;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleLiveHelpGroupReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 380 (LiveHelpGroupReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x7C);
        packUUID(byteBuffer, this.ReplyData_Field.RequestID);
        packUUID(byteBuffer, this.ReplyData_Field.GroupID);
        packVariable(byteBuffer, this.ReplyData_Field.Selection, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.ReplyData_Field.RequestID = unpackUUID(byteBuffer);
        this.ReplyData_Field.GroupID = unpackUUID(byteBuffer);
        this.ReplyData_Field.Selection = unpackVariable(byteBuffer, 1);
    }
}
