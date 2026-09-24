package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * This message is sent how objects get passed between regions.
 *
 * <p>Template: {@code AtomicPassObject High 28 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class AtomicPassObject extends SLMessage {
    public TaskData TaskData_Field;

    /** Block TaskData, Single. */
    public static class TaskData {
        public boolean AttachmentNeedsSave; // BOOL - true iff is attachment and needs asset saved
        public UUID TaskID; // LLUUID
    }

    public AtomicPassObject() {
        this.zeroCoded = false;
        this.TaskData_Field = new TaskData();
    }

    @Override
    public int CalcPayloadSize() {
        return 18;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleAtomicPassObject(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: High 28 (AtomicPassObject).
        byteBuffer.put((byte) 0x1C);
        packUUID(byteBuffer, this.TaskData_Field.TaskID);
        packBoolean(byteBuffer, this.TaskData_Field.AttachmentNeedsSave);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.TaskData_Field.TaskID = unpackUUID(byteBuffer);
        this.TaskData_Field.AttachmentNeedsSave = unpackBoolean(byteBuffer);
    }
}
