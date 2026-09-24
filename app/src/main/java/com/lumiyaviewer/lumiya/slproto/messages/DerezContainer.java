package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * sim -> viewer
 * Used to propperly handle buying asset containers
 *
 * <p>Template: {@code DerezContainer Low 104 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_derez_container()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class DerezContainer extends SLMessage {
    public Data Data_Field;

    /** Block Data, Single. */
    public static class Data {
        public boolean Delete; // BOOL
        public UUID ObjectID; // LLUUID
    }

    public DerezContainer() {
        this.zeroCoded = true;
        this.Data_Field = new Data();
    }

    @Override
    public int CalcPayloadSize() {
        return 21;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleDerezContainer(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 104 (DerezContainer).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x68);
        packUUID(byteBuffer, this.Data_Field.ObjectID);
        packBoolean(byteBuffer, this.Data_Field.Delete);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.Data_Field.ObjectID = unpackUUID(byteBuffer);
        this.Data_Field.Delete = unpackBoolean(byteBuffer);
    }
}
