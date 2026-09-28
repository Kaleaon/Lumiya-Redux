package com.lumiyaviewer.lumiya.slproto.llsd.types

import com.lumiyaviewer.lumiya.slproto.llsd.LLSDInvalidKeyException
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNodeFactory
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDXMLException
import java.io.DataOutputStream
import java.io.IOException
import org.xmlpull.v1.XmlPullParser
import org.xmlpull.v1.XmlPullParserException
import org.xmlpull.v1.XmlSerializer

open class LLSDArray : LLSDNode {
    private val items: ArrayList<LLSDNode> = ArrayList()

    constructor()

    @Throws(XmlPullParserException::class, IOException::class, LLSDXMLException::class)
    constructor(xmlPullParser: XmlPullParser) {
        while (xmlPullParser.nextTag() != 3) {
            this.items.add(LLSDNodeFactory.parseNode(xmlPullParser))
        }
    }

    constructor(vararg lsdNodeArr: LLSDNode) {
        for (llsdNode in lsdNodeArr) {
            this.items.add(llsdNode)
        }
    }

    fun add(lsdNode: LLSDNode) {
        this.items.add(lsdNode)
    }

    override fun byIndex(i: Int): LLSDNode {
        if (i < 0 || i >= this.items.size) {
            throw LLSDInvalidKeyException(String.format("Array index out of range: req %d, size %d", i, this.items.size))
        }
        return this.items[i]
    }

    override fun getCount(): Int {
        return this.items.size
    }

    override fun toBinary(dataOutputStream: DataOutputStream) {
        dataOutputStream.writeByte(91)
        dataOutputStream.writeInt(this.items.size)
        for (item in this.items) {
            item.toBinary(dataOutputStream)
        }
        dataOutputStream.writeByte(93)
    }

    override fun toXML(xmlSerializer: XmlSerializer) {
        xmlSerializer.startTag("", "array")
        for (item in this.items) {
            item.toXML(xmlSerializer)
        }
        xmlSerializer.endTag("", "array")
    }
}
