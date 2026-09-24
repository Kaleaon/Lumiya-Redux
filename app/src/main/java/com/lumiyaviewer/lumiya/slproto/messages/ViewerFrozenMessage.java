package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;

/**
 * ViewerFrozenMessage
 * Specifies the text to be posted in an alert dialog
 *
 * <p>Template: {@code ViewerFrozenMessage Low 137 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_frozen_message()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class ViewerFrozenMessage extends SLMessage {
    public FrozenData FrozenData_Field;

    /** Block FrozenData, Single. */
    public static class FrozenData {
        public boolean Data; // BOOL
    }

    public ViewerFrozenMessage() {
        this.zeroCoded = false;
        this.FrozenData_Field = new FrozenData();
    }

    @Override
    public int CalcPayloadSize() {
        return 5;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleViewerFrozenMessage(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 137 (ViewerFrozenMessage).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x89);
        packBoolean(byteBuffer, this.FrozenData_Field.Data);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.FrozenData_Field.Data = unpackBoolean(byteBuffer);
    }
}
