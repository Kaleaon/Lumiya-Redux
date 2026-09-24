package com.lumiyaviewer.lumiya.slproto;

import com.lumiyaviewer.lumiya.slproto.messages.SLMessageHandler;
import java.nio.ByteBuffer;

public class SLDefaultMessage extends SLMessage {
    @Override
    public int CalcPayloadSize() {
        return 0;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.DefaultMessageHandler(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
    }
}
