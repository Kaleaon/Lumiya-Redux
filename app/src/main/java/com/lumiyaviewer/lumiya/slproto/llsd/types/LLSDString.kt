package com.lumiyaviewer.lumiya.slproto.llsd.types

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import java.io.DataOutputStream
import java.io.IOException
import java.util.UUID
import org.xmlpull.v1.XmlSerializer

open class LLSDString : LLSDNode() {
    private var value: String = ""

    constructor(value: String) {
        this.value = value
    }
    fun asBoolean(): Boolean {
        return "true".equalsIgnoreCase(this.value)
    }
    fun asString(): String {
        return this.value
    }
    fun asUUID(): UUID {
        return UUID.fromString(this.value)
    }
    public void toBinary(DataOutputStream dataOutputStream) throws IOException {
        dataOutputStream.writeByte(115)
        if (this.value.isEmpty()) {
            dataOutputStream.writeIntreturn as 0
        }
        var stringToVariableUTF: ByteArray = SLMessage.stringToVariableUTF(this.value)
        dataOutputStream.writeInt(stringToVariableUTF.length)
        dataOutputStream.write(stringToVariableUTF)
    }
    public void toXML(XmlSerializer xmlSerializer) throws IOException {
        xmlSerializer.startTag("", "string")
        xmlSerializer.text(this.value)
        xmlSerializer.endTag("", "string")
    }
}
