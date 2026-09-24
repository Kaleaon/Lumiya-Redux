package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;

/**
 * KillObject - Sent by objects to the viewer to tell them to kill themselves
 *
 * <p>Template: {@code KillObject High 16 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_kill_object()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class KillObject extends SLMessage {
    public ArrayList<ObjectData> ObjectData_Fields = new ArrayList<>();

    /** Block ObjectData, Variable. */
    public static class ObjectData {
        public int ID; // U32
    }

    public KillObject() {
        this.zeroCoded = false;
    }

    @Override
    public int CalcPayloadSize() {
        return (this.ObjectData_Fields.size() * 4) + 2;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleKillObject(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: High 16 (KillObject).
        byteBuffer.put((byte) 0x10);
        byteBuffer.put((byte) this.ObjectData_Fields.size());
        Iterator<?> it = this.ObjectData_Fields.iterator();
        while (it.hasNext()) {
            packInt(byteBuffer, ((ObjectData) it.next()).ID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            ObjectData objectData = new ObjectData();
            objectData.ID = unpackInt(byteBuffer);
            this.ObjectData_Fields.add(objectData);
        }
    }
}
