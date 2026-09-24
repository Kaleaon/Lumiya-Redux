package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;

/**
 * SubscribeLoad
 * spaceserver -> simulator
 * reliable
 *
 * <p>Template: {@code SubscribeLoad Low 7 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class SubscribeLoad extends SLMessage {
    public SubscribeLoad() {
        this.zeroCoded = false;
    }

    @Override
    public int CalcPayloadSize() {
        return 4;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleSubscribeLoad(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 7 (SubscribeLoad).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x07);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
    }
}
