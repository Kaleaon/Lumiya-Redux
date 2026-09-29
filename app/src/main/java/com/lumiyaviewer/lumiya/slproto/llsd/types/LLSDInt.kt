package com.lumiyaviewer.lumiya.slproto.llsd.types

import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import java.io.DataOutputStream
import org.xmlpull.v1.XmlSerializer

open class LLSDInt : LLSDNode {
    private var value: Int = 0

    constructor(value: Int) {
        this.value = value
    }

    constructor(str: String) {
        this.value = try {
            Integer.parseInt(str)
        } catch (e: Exception) {
            0
        }
    }

    override fun asBoolean(): Boolean {
        return this.value != 0
    }

    override fun asInt(): Int {
        return this.value
    }

    override fun toBinary(dataOutputStream: DataOutputStream) {
        dataOutputStream.writeByte(105)
        dataOutputStream.writeInt(this.value)
    }

    override fun toXML(xmlSerializer: XmlSerializer) {
        xmlSerializer.startTag("", "integer")
        xmlSerializer.text(Integer.toString(this.value))
        xmlSerializer.endTag("", "integer")
    }
}
