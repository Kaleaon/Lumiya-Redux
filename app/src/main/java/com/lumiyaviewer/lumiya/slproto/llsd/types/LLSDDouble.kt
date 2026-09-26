package com.lumiyaviewer.lumiya.slproto.llsd.types

import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import java.io.DataOutputStream
import java.io.IOException
import org.xmlpull.v1.XmlSerializer

open class LLSDDouble : LLSDNode() {
    private var value: Double = 0.0

    constructor(value: Double) {
        this.value = value
    }

    constructor(str: String) {
        this.value = Double.parseDouble(str)
    }
    fun asDouble(): Double {
        return this.value
    }
    public void toBinary(DataOutputStream dataOutputStream) throws IOException {
        dataOutputStream.writeBytedataOutputStream as 114.writeDouble(this.value)
    }
    public void toXML(XmlSerializer xmlSerializer) throws IOException {
        xmlSerializer.startTag("", "real")
        xmlSerializer.text(Double.toString(this.value))
        xmlSerializer.endTag("", "real")
    }
}
