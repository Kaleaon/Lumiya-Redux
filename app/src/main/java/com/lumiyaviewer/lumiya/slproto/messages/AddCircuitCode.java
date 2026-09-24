package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * space->sim
 * sim->sim
 * AddCircuitCode - Tells the recipient's messaging system that this code
 * is for a legal circuit
 *
 * <p>Template: {@code AddCircuitCode Low 2 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLMessageSystem::processAddCircuitCode()} in indra/llmessage/message.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class AddCircuitCode extends SLMessage {
    public CircuitCode CircuitCode_Field;

    /** Block CircuitCode, Single. */
    public static class CircuitCode {
        public UUID AgentID; // LLUUID - WARNING - may be null in valid message
        public int Code; // U32
        public UUID SessionID; // LLUUID
    }

    public AddCircuitCode() {
        this.zeroCoded = false;
        this.CircuitCode_Field = new CircuitCode();
    }

    @Override
    public int CalcPayloadSize() {
        return 40;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleAddCircuitCode(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 2 (AddCircuitCode).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x02);
        packInt(byteBuffer, this.CircuitCode_Field.Code);
        packUUID(byteBuffer, this.CircuitCode_Field.SessionID);
        packUUID(byteBuffer, this.CircuitCode_Field.AgentID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.CircuitCode_Field.Code = unpackInt(byteBuffer);
        this.CircuitCode_Field.SessionID = unpackUUID(byteBuffer);
        this.CircuitCode_Field.AgentID = unpackUUID(byteBuffer);
    }
}
