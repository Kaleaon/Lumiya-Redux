package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * AvatarPickerReply
 * List of names to select a person
 * reliable
 *
 * <p>Template: {@code AvatarPickerReply Low 28 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLFloaterAvatarPicker::processAvatarPickerReply()} in indra/newview/llfloateravatarpicker.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class AvatarPickerReply extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<Data> Data_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID QueryID; // LLUUID
    }

    /** Block Data, Variable. */
    public static class Data {
        public UUID AvatarID; // LLUUID
        public byte[] FirstName; // Variable 1
        public byte[] LastName; // Variable 1
    }

    public AvatarPickerReply() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        int i = 37;
        Iterator<?> it = this.Data_Fields.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            Data data = (Data) it.next();
            i = data.LastName.length + data.FirstName.length + 17 + 1 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleAvatarPickerReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 28 (AvatarPickerReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x1C);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.QueryID);
        byteBuffer.put((byte) this.Data_Fields.size());
        for (Data data : this.Data_Fields) {
            packUUID(byteBuffer, data.AvatarID);
            packVariable(byteBuffer, data.FirstName, 1);
            packVariable(byteBuffer, data.LastName, 1);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.QueryID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            Data data = new Data();
            data.AvatarID = unpackUUID(byteBuffer);
            data.FirstName = unpackVariable(byteBuffer, 1);
            data.LastName = unpackVariable(byteBuffer, 1);
            this.Data_Fields.add(data);
        }
    }
}
