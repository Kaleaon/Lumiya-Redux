package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * sim -> dataserver
 * Merges some of the database information for parcels (dwell).
 *
 * <p>Template: {@code MergeParcel Low 223 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class MergeParcel extends SLMessage {
    public MasterParcelData MasterParcelData_Field;
    public ArrayList<SlaveParcelData> SlaveParcelData_Fields = new ArrayList<>();

    /** Block MasterParcelData, Single. */
    public static class MasterParcelData {
        public UUID MasterID; // LLUUID
    }

    /** Block SlaveParcelData, Variable. */
    public static class SlaveParcelData {
        public UUID SlaveID; // LLUUID
    }

    public MergeParcel() {
        this.zeroCoded = false;
        this.MasterParcelData_Field = new MasterParcelData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.SlaveParcelData_Fields.size() * 16) + 21;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleMergeParcel(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 223 (MergeParcel).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xDF);
        packUUID(byteBuffer, this.MasterParcelData_Field.MasterID);
        byteBuffer.put((byte) this.SlaveParcelData_Fields.size());
        Iterator<?> it = this.SlaveParcelData_Fields.iterator();
        while (it.hasNext()) {
            packUUID(byteBuffer, ((SlaveParcelData) it.next()).SlaveID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.MasterParcelData_Field.MasterID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            SlaveParcelData slaveParcelData = new SlaveParcelData();
            slaveParcelData.SlaveID = unpackUUID(byteBuffer);
            this.SlaveParcelData_Fields.add(slaveParcelData);
        }
    }
}
