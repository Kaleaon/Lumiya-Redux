package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;

/**
 * Simulator Shutdown Request - Tells spaceserver that a simulator is trying to shutdown
 *
 * <p>Template: {@code SimulatorShutdownRequest Low 13 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class SimulatorShutdownRequest extends SLMessage {
    public SimulatorShutdownRequest() {
        this.zeroCoded = false;
    }

    @Override
    public int CalcPayloadSize() {
        return 4;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleSimulatorShutdownRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 13 (SimulatorShutdownRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x0D);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
    }
}
