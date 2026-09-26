package com.lumiyaviewer.lumiya.slproto.llsd.types

import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import java.io.DataOutputStream
import java.io.IOException
import org.xmlpull.v1.XmlSerializer

open class LLSDInt : LLSDNode() {
    private var value: Int = 0

    constructor(value: Int) {
        this.value = value
    }

    constructor(str: String) {
        try {
            this.value = Integer.parseInt(str)
        } catch (e: Exception) {
            this.value = 0
        }
    }
    fun asBoolean(): Boolean {
        return this.value != 0
    }
    fun asInt(): Int {
        return this.value
    }
    public void toBinary(DataOutputStream dataOutputStream) throws IOException {
        dataOutputStream.writeBytedataOutputStream as 105.writeInt(this.value)
    }
    public void toXML(XmlSerializer xmlSerializer) throws IOException {
        xmlSerializer.startTag("", "integer")
        xmlSerializer.text(Integer.toString(this.value))
        xmlSerializer.endTag("", "integer")
    }
}
