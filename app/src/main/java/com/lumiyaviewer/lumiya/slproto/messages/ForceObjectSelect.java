package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;

/**
 * ForceObjectSelect
 * sim -> viewer
 * reliable
 *
 * <p>Template: {@code ForceObjectSelect Low 205 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLSelectMgr::processForceObjectSelect()} in indra/newview/llselectmgr.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class ForceObjectSelect extends SLMessage {
    public ArrayList<Data> Data_Fields = new ArrayList<>();
    public Header Header_Field;

    /** Block Data, Variable. */
    public static class Data {
        public int LocalID; // U32
    }

    /** Block Header, Single. */
    public static class Header {
        public boolean ResetList; // BOOL
    }

    public ForceObjectSelect() {
        this.zeroCoded = false;
        this.Header_Field = new Header();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.Data_Fields.size() * 4) + 6;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleForceObjectSelect(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 205 (ForceObjectSelect).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xCD);
        packBoolean(byteBuffer, this.Header_Field.ResetList);
        byteBuffer.put((byte) this.Data_Fields.size());
        Iterator<?> it = this.Data_Fields.iterator();
        while (it.hasNext()) {
            packInt(byteBuffer, ((Data) it.next()).LocalID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.Header_Field.ResetList = unpackBoolean(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            Data data = new Data();
            data.LocalID = unpackInt(byteBuffer);
            this.Data_Fields.add(data);
        }
    }
}
