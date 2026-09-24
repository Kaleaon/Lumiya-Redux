package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * CreateTrustedCircuit
 * Sent to establish a trust relationship between two components.
 * Only sent in response to a DenyTrustedCircuit message.
 *
 * <p>Template: {@code CreateTrustedCircuit Low 392 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_create_trusted_circuit()} in indra/llmessage/message.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class CreateTrustedCircuit extends SLMessage {
    public DataBlock DataBlock_Field;

    /** Block DataBlock, Single. */
    public static class DataBlock {
        public byte[] Digest; // Fixed 32 - 32 hex digits == 1 MD5 Digest
        public UUID EndPointID; // LLUUID
    }

    public CreateTrustedCircuit() {
        this.zeroCoded = false;
        this.DataBlock_Field = new DataBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return 52;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleCreateTrustedCircuit(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 392 (CreateTrustedCircuit).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x88);
        packUUID(byteBuffer, this.DataBlock_Field.EndPointID);
        packFixed(byteBuffer, this.DataBlock_Field.Digest, 32);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.DataBlock_Field.EndPointID = unpackUUID(byteBuffer);
        this.DataBlock_Field.Digest = unpackFixed(byteBuffer, 32);
    }
}
