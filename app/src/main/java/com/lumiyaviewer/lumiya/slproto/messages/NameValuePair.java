package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * Name Value Pair messages
 * NameValuePair - if the specific task exists on simulator, add or replace this name value pair
 *
 * <p>Template: {@code NameValuePair Low 329 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_name_value()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class NameValuePair extends SLMessage {
    public ArrayList<NameValueData> NameValueData_Fields = new ArrayList<>();
    public TaskData TaskData_Field;

    /** Block NameValueData, Variable. */
    public static class NameValueData {
        public byte[] NVPair; // Variable 2
    }

    /** Block TaskData, Single. */
    public static class TaskData {
        public UUID ID; // LLUUID
    }

    public NameValuePair() {
        this.zeroCoded = false;
        this.TaskData_Field = new TaskData();
    }

    @Override
    public int CalcPayloadSize() {
        int i = 21;
        Iterator<?> it = this.NameValueData_Fields.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            i = ((NameValueData) it.next()).NVPair.length + 2 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleNameValuePair(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 329 (NameValuePair).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x49);
        packUUID(byteBuffer, this.TaskData_Field.ID);
        byteBuffer.put((byte) this.NameValueData_Fields.size());
        Iterator<?> it = this.NameValueData_Fields.iterator();
        while (it.hasNext()) {
            packVariable(byteBuffer, ((NameValueData) it.next()).NVPair, 2);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.TaskData_Field.ID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            NameValueData nameValueData = new NameValueData();
            nameValueData.NVPair = unpackVariable(byteBuffer, 2);
            this.NameValueData_Fields.add(nameValueData);
        }
    }
}
