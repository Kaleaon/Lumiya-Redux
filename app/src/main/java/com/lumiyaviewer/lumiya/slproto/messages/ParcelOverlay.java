package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;

/**
 * Land Parcel system
 * ParcelOverlay
 * We send N packets per region to the viewer.
 * N = 4, currently.  At 256x256 meter regions, 4x4 meter parcel grid,
 * there are 4096 parcel units per region.  At N = 4, that's 1024 units
 * per packet, allowing 8 bit bytes.
 * sim -> viewer
 * reliable
 *
 * <p>Template: {@code ParcelOverlay Low 196 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLViewerParcelMgr::processParcelOverlay()} in indra/newview/llviewerparcelmgr.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class ParcelOverlay extends SLMessage {
    public ParcelData ParcelData_Field;

    /** Block ParcelData, Single. */
    public static class ParcelData {
        public byte[] Data; // Variable 2 - packed bit-field, (grids*grids)/N
        public int SequenceID; // S32 - 0...3, which piece of region
    }

    public ParcelOverlay() {
        this.zeroCoded = true;
        this.ParcelData_Field = new ParcelData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.ParcelData_Field.Data.length + 6 + 4;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleParcelOverlay(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 196 (ParcelOverlay).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xC4);
        packInt(byteBuffer, this.ParcelData_Field.SequenceID);
        packVariable(byteBuffer, this.ParcelData_Field.Data, 2);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.ParcelData_Field.SequenceID = unpackInt(byteBuffer);
        this.ParcelData_Field.Data = unpackVariable(byteBuffer, 2);
    }
}
