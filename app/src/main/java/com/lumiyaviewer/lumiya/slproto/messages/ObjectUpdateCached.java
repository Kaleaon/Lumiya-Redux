package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;

/**
 * ObjectUpdateCached
 * reliable
 *
 * <p>Template: {@code ObjectUpdateCached High 14 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_cached_object_update()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class ObjectUpdateCached extends SLMessage {
    public ArrayList<ObjectData> ObjectData_Fields = new ArrayList<>();
    public RegionData RegionData_Field;

    /** Block ObjectData, Variable. */
    public static class ObjectData {
        public int CRC; // U32
        public int ID; // U32
        public int UpdateFlags; // U32
    }

    /** Block RegionData, Single. */
    public static class RegionData {
        public long RegionHandle; // U64
        public int TimeDilation; // U16
    }

    public ObjectUpdateCached() {
        this.zeroCoded = false;
        this.RegionData_Field = new RegionData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.ObjectData_Fields.size() * 12) + 12;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleObjectUpdateCached(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: High 14 (ObjectUpdateCached).
        byteBuffer.put((byte) 0x0E);
        packLong(byteBuffer, this.RegionData_Field.RegionHandle);
        packShort(byteBuffer, (short) this.RegionData_Field.TimeDilation);
        byteBuffer.put((byte) this.ObjectData_Fields.size());
        for (ObjectData objectData : this.ObjectData_Fields) {
            packInt(byteBuffer, objectData.ID);
            packInt(byteBuffer, objectData.CRC);
            packInt(byteBuffer, objectData.UpdateFlags);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.RegionData_Field.RegionHandle = unpackLong(byteBuffer);
        this.RegionData_Field.TimeDilation = unpackShort(byteBuffer) & 65535;
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            ObjectData objectData = new ObjectData();
            objectData.ID = unpackInt(byteBuffer);
            objectData.CRC = unpackInt(byteBuffer);
            objectData.UpdateFlags = unpackInt(byteBuffer);
            this.ObjectData_Fields.add(objectData);
        }
    }
}
