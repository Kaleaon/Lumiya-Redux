package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * DenyTrustedCircuit
 * Sent :
 * - in response to failed CreateTrustedCircuit
 * - to force the remote end-point to try to establish a trusted circuit
 * - the reception of a trusted message on a non-trusted circuit
 * This allows us to re-auth a circuit if it gets closed due to timeouts or network failures.
 *
 * <p>Template: {@code DenyTrustedCircuit Low 393 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_deny_trusted_circuit()} in indra/llmessage/message.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class DenyTrustedCircuit extends SLMessage {
    public DataBlock DataBlock_Field;

    /** Block DataBlock, Single. */
    public static class DataBlock {
        public UUID EndPointID; // LLUUID
    }

    public DenyTrustedCircuit() {
        this.zeroCoded = false;
        this.DataBlock_Field = new DataBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return 20;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleDenyTrustedCircuit(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 393 (DenyTrustedCircuit).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x89);
        packUUID(byteBuffer, this.DataBlock_Field.EndPointID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.DataBlock_Field.EndPointID = unpackUUID(byteBuffer);
    }
}
