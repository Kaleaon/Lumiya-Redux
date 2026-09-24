package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;

/**
 * UnsubscribeLoad
 * spaceserver -> simulator
 * reliable
 *
 * <p>Template: {@code UnsubscribeLoad Low 8 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class UnsubscribeLoad extends SLMessage {
    public UnsubscribeLoad() {
        this.zeroCoded = false;
    }

    @Override
    public int CalcPayloadSize() {
        return 4;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleUnsubscribeLoad(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 8 (UnsubscribeLoad).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x08);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
    }
}
