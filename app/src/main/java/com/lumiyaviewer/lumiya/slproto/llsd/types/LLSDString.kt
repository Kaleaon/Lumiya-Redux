package com.lumiyaviewer.lumiya.slproto.llsd.types

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import java.io.DataOutputStream
import java.util.UUID
import org.xmlpull.v1.XmlSerializer

open class LLSDString : LLSDNode {
    private var value: String = ""

    constructor(value: String) {
        this.value = value
    }

    override fun asBoolean(): Boolean {
        return "true".equals(this.value, ignoreCase = true)
    }

    override fun asString(): String {
        return this.value
    }

    override fun asUUID(): UUID {
        return UUID.fromString(this.value)
    }

    override fun toBinary(dataOutputStream: DataOutputStream) {
        dataOutputStream.writeByte(115)
        if (this.value.isEmpty()) {
            dataOutputStream.writeInt(0)
            return
        }
        val stringToVariableUTF: ByteArray = SLMessage.stringToVariableUTF(this.value)
        dataOutputStream.writeInt(stringToVariableUTF.size)
        dataOutputStream.write(stringToVariableUTF)
    }

    override fun toXML(xmlSerializer: XmlSerializer) {
        xmlSerializer.startTag("", "string")
        xmlSerializer.text(this.value)
        xmlSerializer.endTag("", "string")
    }
}
