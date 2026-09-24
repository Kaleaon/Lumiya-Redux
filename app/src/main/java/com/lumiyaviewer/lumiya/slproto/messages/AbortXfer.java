package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;

/**
 * AbortXfer
 *
 * <p>Template: {@code AbortXfer Low 157 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_abort_xfer()} in indra/llmessage/llxfermanager.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class AbortXfer extends SLMessage {
    public XferID XferID_Field;

    /** Block XferID, Single. */
    public static class XferID {
        public long ID; // U64
        public int Result; // S32
    }

    public AbortXfer() {
        this.zeroCoded = false;
        this.XferID_Field = new XferID();
    }

    @Override
    public int CalcPayloadSize() {
        return 16;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleAbortXfer(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 157 (AbortXfer).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x9D);
        packLong(byteBuffer, this.XferID_Field.ID);
        packInt(byteBuffer, this.XferID_Field.Result);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.XferID_Field.ID = unpackLong(byteBuffer);
        this.XferID_Field.Result = unpackInt(byteBuffer);
    }
}
