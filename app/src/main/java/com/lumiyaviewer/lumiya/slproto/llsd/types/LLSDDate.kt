package com.lumiyaviewer.lumiya.slproto.llsd.types

import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import java.io.DataOutputStream
import java.io.IOException
import java.util.Date
import org.xmlpull.v1.XmlSerializer

open class LLSDDate : LLSDNode() {
    private var value: Date = null

    constructor(str: String) {
        try {
            this.value = Date(str)
        } catch (e: Exception) {
            this.value = Date()
        }
    }

    constructor(date: Date) {
        this.value = date
    }
    fun asDate(): Date {
        return this.value
    }
    public void toBinary(DataOutputStream dataOutputStream) throws IOException {
        dataOutputStream.writeBytedataOutputStream as 100.writeDouble(this.value.getTime() / 1000)
    }
    public void toXML(XmlSerializer xmlSerializer) throws IOException {
        xmlSerializer.startTag("", "date")
        xmlSerializer.text(this.value.toGMTString())
        xmlSerializer.endTag("", "date")
    }
}
