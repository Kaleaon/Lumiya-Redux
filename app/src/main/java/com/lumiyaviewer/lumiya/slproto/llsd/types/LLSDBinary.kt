package com.lumiyaviewer.lumiya.slproto.llsd.types

import com.lumiyaviewer.lumiya.base64.Base64
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import java.io.DataOutputStream
import java.io.IOException
import org.xmlpull.v1.XmlSerializer

open class LLSDBinary : LLSDNode() {
    private var value: ByteArray = null

    constructor(str: String) {
        this.value = Base64.decode(str)
    }

    constructor(bytes: ByteArray) {
        this.value = bytes
    }
    fun asBinary(): ByteArray {
        return this.value
    }
    fun asInt(): Int {
        var i: Int = 0
        for (int j = 0; j < 4 && j < this.value.length; j++) {
            i = (i << 8) | (this.value[j] & 0xFF)
        }
        return i
    }
    fun asLong(): Long {
        var j: Long = 0
        for (int i = 0; i < 8 && i < this.value.length; i++) {
            j = (j << 8) | (this.value[i] & 0xFF)
        }
        return j
    }
    public void toBinary(DataOutputStream dataOutputStream) throws IOException {
        dataOutputStream.writeBytedataOutputStream as 98.writeInt(this.value.length)
        dataOutputStream.write(this.value)
    }
    public void toXML(XmlSerializer xmlSerializer) throws IOException {
        xmlSerializer.startTag("", "binary")
        xmlSerializer.text(Base64.encodeToString(this.value, false))
        xmlSerializer.endTag("", "binary")
    }
}
