package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;

/**
 * CloseCircuit - Tells the recipient's messaging system to close the descibed circuit
 *
 * <p>Template: {@code CloseCircuit Fixed 0xFFFFFFFD NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code close_circuit()} in indra/llmessage/message.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class CloseCircuit extends SLMessage {
    public CloseCircuit() {
        this.zeroCoded = false;
    }

    @Override
    public int CalcPayloadSize() {
        return 4;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleCloseCircuit(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Fixed 0xFFFFFFFD (CloseCircuit).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0xFF);
        byteBuffer.put((byte) 0xFD);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
    }
}
