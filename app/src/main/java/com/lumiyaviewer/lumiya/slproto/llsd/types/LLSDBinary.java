package com.lumiyaviewer.lumiya.slproto.llsd.types;

import com.lumiyaviewer.lumiya.base64.Base64;
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode;
import java.io.DataOutputStream;
import java.io.IOException;
import org.xmlpull.v1.XmlSerializer;

public class LLSDBinary extends LLSDNode {
    private byte[] value;

    public LLSDBinary(String str) {
        this.value = Base64.decode(str);
    }

    public LLSDBinary(byte[] bytes) {
        this.value = bytes;
    }

    @Override
    public byte[] asBinary() {
        return this.value;
    }

    @Override
    public int asInt() {
        int i = 0;
        for (int j = 0; j < 4 && j < this.value.length; j++) {
            i = (i << 8) | (this.value[j] & 0xFF);
        }
        return i;
    }

    @Override
    public long asLong() {
        long j = 0;
        for (int i = 0; i < 8 && i < this.value.length; i++) {
            j = (j << 8) | (this.value[i] & 0xFF);
        }
        return j;
    }

    @Override
    public void toBinary(DataOutputStream dataOutputStream) throws IOException {
        dataOutputStream.writeByte(98);
        dataOutputStream.writeInt(this.value.length);
        dataOutputStream.write(this.value);
    }

    @Override
    public void toXML(XmlSerializer xmlSerializer) throws IOException {
        xmlSerializer.startTag("", "binary");
        xmlSerializer.text(Base64.encodeToString(this.value, false));
        xmlSerializer.endTag("", "binary");
    }
}
