package com.lumiyaviewer.lumiya.slproto.llsd.types

import com.lumiyaviewer.lumiya.base64.Base64
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import java.io.DataOutputStream
import org.xmlpull.v1.XmlSerializer

open class LLSDBinary : LLSDNode {
    private var value: ByteArray

    constructor(str: String) {
        this.value = Base64.decode(str) ?: ByteArray(0)
    }

    constructor(bytes: ByteArray) {
        this.value = bytes
    }

    override fun asBinary(): ByteArray {
        return this.value
    }

    override fun asInt(): Int {
        var i = 0
        var j = 0
        while (j < 4 && j < this.value.size) {
            i = (i shl 8) or (this.value[j].toInt() and 0xFF)
            j++
        }
        return i
    }

    override fun asLong(): Long {
        var j: Long = 0
        var i = 0
        while (i < 8 && i < this.value.size) {
            j = (j shl 8) or (this.value[i].toLong() and 0xFF)
            i++
        }
        return j
    }

    override fun toBinary(dataOutputStream: DataOutputStream) {
        dataOutputStream.writeByte(98)
        dataOutputStream.writeInt(this.value.size)
        dataOutputStream.write(this.value)
    }

    override fun toXML(xmlSerializer: XmlSerializer) {
        xmlSerializer.startTag("", "binary")
        xmlSerializer.text(Base64.encodeToString(this.value, false))
        xmlSerializer.endTag("", "binary")
    }
}
