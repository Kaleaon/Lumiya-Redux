package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;

/**
 * ObjectUpdateCompressed
 *
 * <p>Template: {@code ObjectUpdateCompressed High 13 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_compressed_object_update()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class ObjectUpdateCompressed extends SLMessage {
    public ArrayList<ObjectData> ObjectData_Fields = new ArrayList<>();
    public RegionData RegionData_Field;

    /** Block ObjectData, Variable. */
    public static class ObjectData {
        public byte[] Data; // Variable 2
        public int UpdateFlags; // U32
    }

    /** Block RegionData, Single. */
    public static class RegionData {
        public long RegionHandle; // U64
        public int TimeDilation; // U16
    }

    public ObjectUpdateCompressed() {
        this.zeroCoded = false;
        this.RegionData_Field = new RegionData();
    }

    @Override
    public int CalcPayloadSize() {
        int i = 12;
        Iterator<?> it = this.ObjectData_Fields.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            i = ((ObjectData) it.next()).Data.length + 6 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleObjectUpdateCompressed(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: High 13 (ObjectUpdateCompressed).
        byteBuffer.put((byte) 0x0D);
        packLong(byteBuffer, this.RegionData_Field.RegionHandle);
        packShort(byteBuffer, (short) this.RegionData_Field.TimeDilation);
        byteBuffer.put((byte) this.ObjectData_Fields.size());
        for (ObjectData objectData : this.ObjectData_Fields) {
            packInt(byteBuffer, objectData.UpdateFlags);
            packVariable(byteBuffer, objectData.Data, 2);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.RegionData_Field.RegionHandle = unpackLong(byteBuffer);
        this.RegionData_Field.TimeDilation = unpackShort(byteBuffer) & 65535;
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            ObjectData objectData = new ObjectData();
            objectData.UpdateFlags = unpackInt(byteBuffer);
            objectData.Data = unpackVariable(byteBuffer, 2);
            this.ObjectData_Fields.add(objectData);
        }
    }
}
