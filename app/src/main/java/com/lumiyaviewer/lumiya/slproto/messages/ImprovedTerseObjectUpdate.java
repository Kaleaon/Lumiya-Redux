package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;

/**
 * packed terse object update format
 *
 * <p>Template: {@code ImprovedTerseObjectUpdate High 15 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_terse_object_update_improved()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class ImprovedTerseObjectUpdate extends SLMessage {
    public ArrayList<ObjectData> ObjectData_Fields = new ArrayList<>();
    public RegionData RegionData_Field;

    /** Block ObjectData, Variable. */
    public static class ObjectData {
        public byte[] Data; // Variable 1
        public byte[] TextureEntry; // Variable 2
    }

    /** Block RegionData, Single. */
    public static class RegionData {
        public long RegionHandle; // U64
        public int TimeDilation; // U16
    }

    public ImprovedTerseObjectUpdate() {
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
            ObjectData objectData = (ObjectData) it.next();
            i = objectData.TextureEntry.length + objectData.Data.length + 1 + 2 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleImprovedTerseObjectUpdate(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: High 15 (ImprovedTerseObjectUpdate).
        byteBuffer.put((byte) 0x0F);
        packLong(byteBuffer, this.RegionData_Field.RegionHandle);
        packShort(byteBuffer, (short) this.RegionData_Field.TimeDilation);
        byteBuffer.put((byte) this.ObjectData_Fields.size());
        for (ObjectData objectData : this.ObjectData_Fields) {
            packVariable(byteBuffer, objectData.Data, 1);
            packVariable(byteBuffer, objectData.TextureEntry, 2);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.RegionData_Field.RegionHandle = unpackLong(byteBuffer);
        this.RegionData_Field.TimeDilation = unpackShort(byteBuffer) & 65535;
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            ObjectData objectData = new ObjectData();
            objectData.Data = unpackVariable(byteBuffer, 1);
            objectData.TextureEntry = unpackVariable(byteBuffer, 2);
            this.ObjectData_Fields.add(objectData);
        }
    }
}
