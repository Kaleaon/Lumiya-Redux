package com.lumiyaviewer.lumiya.slproto.llsd.types;

import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode;
import java.io.DataOutputStream;
import java.io.IOException;
import org.xmlpull.v1.XmlSerializer;

public class LLSDDouble extends LLSDNode {
    private double value;

    public LLSDDouble(double value) {
        this.value = value;
    }

    public LLSDDouble(String str) {
        this.value = Double.parseDouble(str);
    }

    @Override
    public double asDouble() {
        return this.value;
    }

    @Override
    public void toBinary(DataOutputStream dataOutputStream) throws IOException {
        dataOutputStream.writeByte(114);
        dataOutputStream.writeDouble(this.value);
    }

    @Override
    public void toXML(XmlSerializer xmlSerializer) throws IOException {
        xmlSerializer.startTag("", "real");
        xmlSerializer.text(Double.toString(this.value));
        xmlSerializer.endTag("", "real");
    }
}
