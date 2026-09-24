package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * ObjectDuplicateOnRay
 * viewer -> simulator
 * Makes a copy of an object, using the add object raycast
 * code to abut it to other objects.
 *
 * <p>Template: {@code ObjectDuplicateOnRay Low 91 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class ObjectDuplicateOnRay extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<ObjectData> ObjectData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public boolean BypassRaycast; // BOOL
        public boolean CopyCenters; // BOOL
        public boolean CopyRotates; // BOOL
        public int DuplicateFlags; // U32 - see object_flags.h
        public UUID GroupID; // LLUUID
        public LLVector3 RayEnd; // LLVector3 - region local
        public boolean RayEndIsIntersection; // BOOL
        public LLVector3 RayStart; // LLVector3 - region local
        public UUID RayTargetID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block ObjectData, Variable. */
    public static class ObjectData {
        public int ObjectLocalID; // U32
    }

    public ObjectDuplicateOnRay() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.ObjectData_Fields.size() * 4) + 101;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleObjectDuplicateOnRay(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 91 (ObjectDuplicateOnRay).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x5B);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.AgentData_Field.GroupID);
        packLLVector3(byteBuffer, this.AgentData_Field.RayStart);
        packLLVector3(byteBuffer, this.AgentData_Field.RayEnd);
        packBoolean(byteBuffer, this.AgentData_Field.BypassRaycast);
        packBoolean(byteBuffer, this.AgentData_Field.RayEndIsIntersection);
        packBoolean(byteBuffer, this.AgentData_Field.CopyCenters);
        packBoolean(byteBuffer, this.AgentData_Field.CopyRotates);
        packUUID(byteBuffer, this.AgentData_Field.RayTargetID);
        packInt(byteBuffer, this.AgentData_Field.DuplicateFlags);
        byteBuffer.put((byte) this.ObjectData_Fields.size());
        Iterator<?> it = this.ObjectData_Fields.iterator();
        while (it.hasNext()) {
            packInt(byteBuffer, ((ObjectData) it.next()).ObjectLocalID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.GroupID = unpackUUID(byteBuffer);
        this.AgentData_Field.RayStart = unpackLLVector3(byteBuffer);
        this.AgentData_Field.RayEnd = unpackLLVector3(byteBuffer);
        this.AgentData_Field.BypassRaycast = unpackBoolean(byteBuffer);
        this.AgentData_Field.RayEndIsIntersection = unpackBoolean(byteBuffer);
        this.AgentData_Field.CopyCenters = unpackBoolean(byteBuffer);
        this.AgentData_Field.CopyRotates = unpackBoolean(byteBuffer);
        this.AgentData_Field.RayTargetID = unpackUUID(byteBuffer);
        this.AgentData_Field.DuplicateFlags = unpackInt(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            ObjectData objectData = new ObjectData();
            objectData.ObjectLocalID = unpackInt(byteBuffer);
            this.ObjectData_Fields.add(objectData);
        }
    }
}
