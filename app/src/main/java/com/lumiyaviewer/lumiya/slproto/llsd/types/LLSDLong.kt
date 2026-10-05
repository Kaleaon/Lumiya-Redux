package com.lumiyaviewer.lumiya.slproto.llsd.types

import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import java.io.DataOutputStream
import org.xmlpull.v1.XmlSerializer

open class LLSDLong : LLSDNode {
    private var value: Long = 0L

    constructor(value: Long) {
        this.value = value
    }

    constructor(str: String) {
        this.value = try {
            str.toLong()
        } catch (e: Exception) {
            0L
        }
    }

    override fun asBoolean(): Boolean {
        return this.value != 0L
    }

    override fun asInt(): Int {
        return this.value.toInt()
    }

    override fun asLong(): Long {
        return this.value
    }

    override fun toBinary(dataOutputStream: DataOutputStream) {
        dataOutputStream.writeByte(73) // 'I'
        dataOutputStream.writeLong(this.value)
    }

    override fun toXML(xmlSerializer: XmlSerializer) {
        xmlSerializer.startTag("", "integer64")
        xmlSerializer.text(this.value.toString())
        xmlSerializer.endTag("", "integer64")
    }
}
