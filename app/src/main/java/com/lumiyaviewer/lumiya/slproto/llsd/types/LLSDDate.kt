package com.lumiyaviewer.lumiya.slproto.llsd.types

import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import java.io.DataOutputStream
import java.util.Date
import org.xmlpull.v1.XmlSerializer

@Suppress("DEPRECATION")
open class LLSDDate : LLSDNode {
    private var value: Date

    constructor(str: String) {
        this.value = try {
            Date(str)
        } catch (e: Exception) {
            Date()
        }
    }

    constructor(date: Date) {
        this.value = date
    }

    override fun asDate(): Date {
        return this.value
    }

    override fun toBinary(dataOutputStream: DataOutputStream) {
        dataOutputStream.writeByte(100)
        dataOutputStream.writeDouble((this.value.time / 1000).toDouble())
    }

    override fun toXML(xmlSerializer: XmlSerializer) {
        xmlSerializer.startTag("", "date")
        xmlSerializer.text(this.value.toGMTString())
        xmlSerializer.endTag("", "date")
    }
}
