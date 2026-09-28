package com.lumiyaviewer.lumiya.slproto.llsd.types

import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import java.io.DataOutputStream
import org.xmlpull.v1.XmlSerializer

open class LLSDDouble : LLSDNode {
    private var value: Double = 0.0

    constructor(value: Double) {
        this.value = value
    }

    constructor(str: String) {
        this.value = str.toDouble()
    }

    override fun asDouble(): Double {
        return this.value
    }

    override fun toBinary(dataOutputStream: DataOutputStream) {
        dataOutputStream.writeByte(114)
        dataOutputStream.writeDouble(this.value)
    }

    override fun toXML(xmlSerializer: XmlSerializer) {
        xmlSerializer.startTag("", "real")
        xmlSerializer.text(this.value.toString())
        xmlSerializer.endTag("", "real")
    }
}
