package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;

/**
 * ScriptControlChange
 * reliable
 *
 * <p>Template: {@code ScriptControlChange Low 189 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLAgent::processScriptControlChange()} in indra/newview/llagent.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class ScriptControlChange extends SLMessage {
    public ArrayList<Data> Data_Fields = new ArrayList<>();

    /** Block Data, Variable. */
    public static class Data {
        public int Controls; // U32
        public boolean PassToAgent; // BOOL
        public boolean TakeControls; // BOOL
    }

    public ScriptControlChange() {
        this.zeroCoded = false;
    }

    @Override
    public int CalcPayloadSize() {
        return (this.Data_Fields.size() * 6) + 5;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleScriptControlChange(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 189 (ScriptControlChange).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xBD);
        byteBuffer.put((byte) this.Data_Fields.size());
        for (Data data : this.Data_Fields) {
            packBoolean(byteBuffer, data.TakeControls);
            packInt(byteBuffer, data.Controls);
            packBoolean(byteBuffer, data.PassToAgent);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            Data data = new Data();
            data.TakeControls = unpackBoolean(byteBuffer);
            data.Controls = unpackInt(byteBuffer);
            data.PassToAgent = unpackBoolean(byteBuffer);
            this.Data_Fields.add(data);
        }
    }
}
