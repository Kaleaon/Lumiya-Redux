package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * Disable makes objects nonphysical and turns off their scripts.
 * ParcelDisableObjects
 * viewer -> sim
 * reliable
 *
 * <p>Template: {@code ParcelDisableObjects Low 201 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class ParcelDisableObjects extends SLMessage {
    public AgentData AgentData_Field;
    public ParcelData ParcelData_Field;
    public ArrayList<TaskIDs> TaskIDs_Fields = new ArrayList<>();
    public ArrayList<OwnerIDs> OwnerIDs_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block OwnerIDs, Variable. */
    public static class OwnerIDs {
        public UUID OwnerID; // LLUUID
    }

    /** Block ParcelData, Single. */
    public static class ParcelData {
        public int LocalID; // S32
        public int ReturnType; // U32
    }

    /** Block TaskIDs, Variable. */
    public static class TaskIDs {
        public UUID TaskID; // LLUUID
    }

    public ParcelDisableObjects() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.ParcelData_Field = new ParcelData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.TaskIDs_Fields.size() * 16) + 45 + 1 + (this.OwnerIDs_Fields.size() * 16);
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleParcelDisableObjects(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 201 (ParcelDisableObjects).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xC9);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.ParcelData_Field.LocalID);
        packInt(byteBuffer, this.ParcelData_Field.ReturnType);
        byteBuffer.put((byte) this.TaskIDs_Fields.size());
        Iterator<?> it = this.TaskIDs_Fields.iterator();
        while (it.hasNext()) {
            packUUID(byteBuffer, ((TaskIDs) it.next()).TaskID);
        }
        byteBuffer.put((byte) this.OwnerIDs_Fields.size());
        Iterator<?> it2 = this.OwnerIDs_Fields.iterator();
        while (it2.hasNext()) {
            packUUID(byteBuffer, ((OwnerIDs) it2.next()).OwnerID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.ParcelData_Field.LocalID = unpackInt(byteBuffer);
        this.ParcelData_Field.ReturnType = unpackInt(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            TaskIDs taskIDs = new TaskIDs();
            taskIDs.TaskID = unpackUUID(byteBuffer);
            this.TaskIDs_Fields.add(taskIDs);
        }
        int i3 = byteBuffer.get() & 0xFF;
        for (int i4 = 0; i4 < i3; i4++) {
            OwnerIDs ownerIDs = new OwnerIDs();
            ownerIDs.OwnerID = unpackUUID(byteBuffer);
            this.OwnerIDs_Fields.add(ownerIDs);
        }
    }
}
