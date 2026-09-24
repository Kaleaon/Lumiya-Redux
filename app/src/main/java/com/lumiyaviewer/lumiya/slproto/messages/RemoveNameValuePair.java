package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * NameValuePair - if the specific task exists on simulator or dataserver, remove the name value pair (value is ignored)
 *
 * <p>Template: {@code RemoveNameValuePair Low 330 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_remove_name_value()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class RemoveNameValuePair extends SLMessage {
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

    public RemoveNameValuePair() {
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
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleRemoveNameValuePair(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 330 (RemoveNameValuePair).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x4A);
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
        for (int i2 = 0; i2 < i; i2++) {
            NameValueData nameValueData = new NameValueData();
            nameValueData.NVPair = unpackVariable(byteBuffer, 2);
            this.NameValueData_Fields.add(nameValueData);
        }
    }
}
