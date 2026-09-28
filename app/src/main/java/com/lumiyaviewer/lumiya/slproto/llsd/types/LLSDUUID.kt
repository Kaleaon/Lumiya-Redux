package com.lumiyaviewer.lumiya.slproto.llsd.types

import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import java.io.DataOutputStream
import java.util.UUID
import org.xmlpull.v1.XmlSerializer

open class LLSDUUID : LLSDNode {
    private var value: UUID? = null

    constructor() {
        this.value = null
    }

    constructor(str: String) {
        val length = str.length
        var j: Long = 0
        var i = 0
        var i2 = 0
        var j2: Long = 0
        var j3: Long = 0
        var i3 = 0
        while (i3 < length) {
            val charAt = str[i3]
            if (charAt != '-') {
                j = (j shl 4) or (
                    if (charAt < '0' || charAt > '9')
                        (if (charAt < 'a' || charAt > 'f')
                            (if (charAt < 'A' || charAt > 'F') 0 else (charAt - 'A') + 10)
                        else (charAt - 'a') + 10)
                    else (charAt - '0')
                    ).toLong()
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
        }
        this.value = UUID(j3, j2)
    }

    constructor(uuid: UUID) {
        this.value = uuid
    }

    override fun asString(): String {
        return this.value.toString()
    }

    override fun asUUID(): UUID {
        return this.value!!
    }

    override fun toBinary(dataOutputStream: DataOutputStream) {
        dataOutputStream.writeByte(117)
        dataOutputStream.writeLong(this.value!!.mostSignificantBits)
        dataOutputStream.writeLong(this.value!!.leastSignificantBits)
    }

    override fun toXML(xmlSerializer: XmlSerializer) {
        xmlSerializer.startTag("", "uuid")
        if (this.value != null) {
            xmlSerializer.text(this.value.toString())
        }
        xmlSerializer.endTag("", "uuid")
    }
}
