package com.lumiyaviewer.lumiya.slproto.llsd.types

import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import java.io.DataOutputStream
import org.xmlpull.v1.XmlSerializer

open class LLSDUndefined : LLSDNode() {
    override fun toBinary(output: DataOutputStream) { output.writeByte(33) }
    override fun toXML(serializer: XmlSerializer) {
        serializer.startTag("", "undef")
        serializer.endTag("", "undef")
    }
}
