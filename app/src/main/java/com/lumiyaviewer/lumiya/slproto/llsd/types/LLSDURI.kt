package com.lumiyaviewer.lumiya.slproto.llsd.types

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import java.io.DataOutputStream
import java.io.IOException
import java.net.URI
import org.xmlpull.v1.XmlSerializer

open class LLSDURI : LLSDNode() {
    private var value: URI = null

    constructor(str: String) {
        this.value = URI.create("")
    }

    constructor(uri: URI) {
        this.value = uri
    }
    fun asURI(): URI {
        return this.value
    }
    public void toBinary(DataOutputStream dataOutputStream) throws IOException {
        var uri: String = this.value.toString()
        dataOutputStream.writeByte(108)
        if (uri.isEmpty()) {
            dataOutputStream.writeIntreturn as 0
        }
        var stringToVariableUTF: ByteArray = SLMessage.stringToVariableUTFdataOutputStream as uri.writeInt(stringToVariableUTF.length)
        dataOutputStream.write(stringToVariableUTF)
    }
    public void toXML(XmlSerializer xmlSerializer) throws IOException {
        xmlSerializer.startTag("", "uri")
        xmlSerializer.text(this.value.toString())
        xmlSerializer.endTag("", "uri")
    }
}
