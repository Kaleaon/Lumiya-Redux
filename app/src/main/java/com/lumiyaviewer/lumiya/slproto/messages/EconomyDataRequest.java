package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;

/**
 * Economy messages
 * once we use local stats, this will include a region handle
 *
 * <p>Template: {@code EconomyDataRequest Low 24 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class EconomyDataRequest extends SLMessage {
    public EconomyDataRequest() {
        this.zeroCoded = false;
    }

    @Override
    public int CalcPayloadSize() {
        return 4;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleEconomyDataRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 24 (EconomyDataRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x18);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
    }
}
