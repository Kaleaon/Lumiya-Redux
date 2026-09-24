package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * viewer->sim
 * UseCircuitCode - Attempts to provide the recipient with IP and Port
 * info. In the case of viewers, the id is the session id. For other
 * machines it may be null. The session id will always be the session
 * id of the process, which every server will generate on startup and
 * the viewer will be handed after login.
 *
 * <p>Template: {@code UseCircuitCode Low 3 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLMessageSystem::processUseCircuitCode()} in indra/llmessage/message.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class UseCircuitCode extends SLMessage {
    public CircuitCode CircuitCode_Field;

    /** Block CircuitCode, Single. */
    public static class CircuitCode {
        public int Code; // U32
        public UUID ID; // LLUUID - agent id
        public UUID SessionID; // LLUUID
    }

    public UseCircuitCode() {
        this.zeroCoded = false;
        this.CircuitCode_Field = new CircuitCode();
    }

    @Override
    public int CalcPayloadSize() {
        return 40;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleUseCircuitCode(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 3 (UseCircuitCode).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x03);
        packInt(byteBuffer, this.CircuitCode_Field.Code);
        packUUID(byteBuffer, this.CircuitCode_Field.SessionID);
        packUUID(byteBuffer, this.CircuitCode_Field.ID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.CircuitCode_Field.Code = unpackInt(byteBuffer);
        this.CircuitCode_Field.SessionID = unpackUUID(byteBuffer);
        this.CircuitCode_Field.ID = unpackUUID(byteBuffer);
    }
}
