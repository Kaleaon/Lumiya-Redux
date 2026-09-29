package com.lumiyaviewer.lumiya.slproto.llsd.types

import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import java.io.DataOutputStream
import org.xmlpull.v1.XmlSerializer

open class LLSDBoolean : LLSDNode {
    private var value: Boolean = false

    constructor(str: String) {
        if (str.equals("true", ignoreCase = true)) {
            this.value = true
        } else if (str.equals("false", ignoreCase = true)) {
            this.value = false
        } else {
            this.value = Integer.parseInt(str) != 0
        }
    }

    constructor(value: Boolean) {
        this.value = value
    }

    override fun asBoolean(): Boolean {
        return this.value
    }

    override fun toBinary(dataOutputStream: DataOutputStream) {
        dataOutputStream.writeByte(if (this.value) 49 else 48)
    }

    override fun toXML(xmlSerializer: XmlSerializer) {
        xmlSerializer.startTag("", "boolean")
        xmlSerializer.text(if (this.value) "1" else "0")
        xmlSerializer.endTag("", "boolean")
    }
}
