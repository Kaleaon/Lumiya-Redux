package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;

/**
 * RequestTrustedCircuit
 * If the destination does not trust the sender, a Deny is sent back.
 *
 * <p>Template: {@code RequestTrustedCircuit Low 394 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code null_message_callback()} in indra/llmessage/message.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class RequestTrustedCircuit extends SLMessage {
    public RequestTrustedCircuit() {
        this.zeroCoded = false;
    }

    @Override
    public int CalcPayloadSize() {
        return 4;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleRequestTrustedCircuit(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 394 (RequestTrustedCircuit).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x8A);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
    }
}
