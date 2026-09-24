package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;

/**
 * TallyVotes userserver -> dataserver
 * reliable
 *
 * <p>Template: {@code TallyVotes Low 365 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class TallyVotes extends SLMessage {
    public TallyVotes() {
        this.zeroCoded = false;
    }

    @Override
    public int CalcPayloadSize() {
        return 4;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleTallyVotes(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 365 (TallyVotes).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x6D);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
    }
}
