package com.lumiyaviewer.lumiya.slproto.llsd.types

import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import java.io.DataOutputStream
import java.io.IOException
import java.util.UUID
import org.xmlpull.v1.XmlSerializer

open class LLSDUUID : LLSDNode() {
    private var value: UUID? = null

    constructor() {
        this.value = null
    }

    constructor(str: String) {
        var length: Int = str.length
        var j: Long = 0
        var i: Int = 0
        var i2: Int = 0
        var j2: Long = 0
        var j3: Long = 0
        var i3: Int = 0
        while (i3 < length) {
            var charAt: Char = str.charAt(i3)
            if (charAt != '-') {
                j = (j << 4) | ((charAt < '0' || charAt > '9') ? (charAt < 'a' || charAt > 'f') ? (charAt < 'A' || charAt > 'F') ? 0 : (charAt - 'A') + 10 : (charAt - 'a') + 10 : charAt - '0')
                i++
                if (i >= 16) {
                    if (i2 == 0) {
                        j3 = j
                    } else {
                        j2 = j
                    }
                    i2++
                }
            }
            i3++
            j2 = j2
            j3 = j3
            i = i
            i2 = i2
        }
        this.value = UUID(j3, j2)
    }

    constructor(uuid: UUID) {
        this.value = uuid
    }
    fun asString(): String {
        return this.value.toString()
    }
    fun asUUID(): UUID {
        return this.value
    }
    public void toBinary(DataOutputStream dataOutputStream) throws IOException {
        dataOutputStream.writeBytedataOutputStream as 117.writeLong(this.value.getMostSignificantBits())
        dataOutputStream.writeLong(this.value.getLeastSignificantBits())
    }
    public void toXML(XmlSerializer xmlSerializer) throws IOException {
        xmlSerializer.startTag("", "uuid")
        if (this.value != null) {
            xmlSerializer.text(this.value.toString())
        }
        xmlSerializer.endTag("", "uuid")
    }
}
