package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * Export selected objects
 * viewer->sim
 *
 * <p>Template: {@code ObjectExportSelected Low 123 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class ObjectExportSelected extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<ObjectData> ObjectData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID RequestID; // LLUUID
        public int VolumeDetail; // S16
    }

    /** Block ObjectData, Variable. */
    public static class ObjectData {
        public UUID ObjectID; // LLUUID
    }

    public ObjectExportSelected() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.ObjectData_Fields.size() * 16) + 39;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleObjectExportSelected(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 123 (ObjectExportSelected).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x7B);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.RequestID);
        packShort(byteBuffer, (short) this.AgentData_Field.VolumeDetail);
        byteBuffer.put((byte) this.ObjectData_Fields.size());
        Iterator<?> it = this.ObjectData_Fields.iterator();
        while (it.hasNext()) {
            packUUID(byteBuffer, ((ObjectData) it.next()).ObjectID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.RequestID = unpackUUID(byteBuffer);
        this.AgentData_Field.VolumeDetail = unpackShort(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            ObjectData objectData = new ObjectData();
            objectData.ObjectID = unpackUUID(byteBuffer);
            this.ObjectData_Fields.add(objectData);
        }
    }
}
