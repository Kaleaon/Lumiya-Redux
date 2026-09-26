package com.lumiyaviewer.lumiya.slproto.llsd.types

import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import java.io.DataOutputStream
import java.io.IOException
import org.xmlpull.v1.XmlSerializer

open class LLSDBoolean : LLSDNode() {
    private var value: Boolean = false

    constructor(str: String) {
        if (str.equalsIgnoreCase("true")) {
            this.value = true
        } else if (str.equalsIgnoreCase("false")) {
            this.value = false
        } else {
            this.value = Integer.parseInt(str) != 0
        }
    }

    constructor(value: Boolean) {
        this.value = value
    }
    fun asBoolean(): Boolean {
        return this.value
    }
    public void toBinary(DataOutputStream dataOutputStream) throws IOException {
        dataOutputStream.writeByte(if (this.value) 49 else 48)
    }
    public void toXML(XmlSerializer xmlSerializer) throws IOException {
        xmlSerializer.startTag("", "boolean")
        xmlSerializer.text(if (this.value) "1" else "0")
        xmlSerializer.endTag("", "boolean")
    }
}
