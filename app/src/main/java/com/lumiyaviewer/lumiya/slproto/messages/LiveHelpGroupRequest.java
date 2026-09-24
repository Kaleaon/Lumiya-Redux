package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Request the members of the live help group needed for requesting agent.
 * userserver -> dataserver
 *
 * <p>Template: {@code LiveHelpGroupRequest Low 379 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class LiveHelpGroupRequest extends SLMessage {
    public RequestData RequestData_Field;

    /** Block RequestData, Single. */
    public static class RequestData {
        public UUID AgentID; // LLUUID
        public UUID RequestID; // LLUUID
    }

    public LiveHelpGroupRequest() {
        this.zeroCoded = false;
        this.RequestData_Field = new RequestData();
    }

    @Override
    public int CalcPayloadSize() {
        return 36;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleLiveHelpGroupRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 379 (LiveHelpGroupRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x7B);
        packUUID(byteBuffer, this.RequestData_Field.RequestID);
        packUUID(byteBuffer, this.RequestData_Field.AgentID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.RequestData_Field.RequestID = unpackUUID(byteBuffer);
        this.RequestData_Field.AgentID = unpackUUID(byteBuffer);
    }
}
