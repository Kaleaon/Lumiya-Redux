package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * ObjectImage
 * viewer -> simulator
 *
 * <p>Template: {@code ObjectImage Low 96 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class ObjectImage extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<ObjectData> ObjectData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block ObjectData, Variable. */
    public static class ObjectData {
        public byte[] MediaURL; // Variable 1
        public int ObjectLocalID; // U32
        public byte[] TextureEntry; // Variable 2
    }

    public ObjectImage() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        int i = 37;
        Iterator<?> it = this.ObjectData_Fields.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            ObjectData objectData = (ObjectData) it.next();
            i = objectData.TextureEntry.length + objectData.MediaURL.length + 5 + 2 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleObjectImage(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 96 (ObjectImage).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x60);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        byteBuffer.put((byte) this.ObjectData_Fields.size());
        for (ObjectData objectData : this.ObjectData_Fields) {
            packInt(byteBuffer, objectData.ObjectLocalID);
            packVariable(byteBuffer, objectData.MediaURL, 1);
            packVariable(byteBuffer, objectData.TextureEntry, 2);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            ObjectData objectData = new ObjectData();
            objectData.ObjectLocalID = unpackInt(byteBuffer);
            objectData.MediaURL = unpackVariable(byteBuffer, 1);
            objectData.TextureEntry = unpackVariable(byteBuffer, 2);
            this.ObjectData_Fields.add(objectData);
        }
    }
}
