package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;

/**
 * DisableThisSimulator - Tells a viewer not to expect data from this simulator anymore
 *
 * <p>Template: {@code DisableSimulator Low 152 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_disable_simulator()} in indra/newview/llworld.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class DisableSimulator extends SLMessage {
    public DisableSimulator() {
        this.zeroCoded = false;
    }

    @Override
    public int CalcPayloadSize() {
        return 4;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleDisableSimulator(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 152 (DisableSimulator).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x98);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
    }
}
