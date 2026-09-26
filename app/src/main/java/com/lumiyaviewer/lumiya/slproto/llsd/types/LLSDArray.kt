package com.lumiyaviewer.lumiya.slproto.llsd.types

import com.lumiyaviewer.lumiya.slproto.llsd.LLSDInvalidKeyException
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNodeFactory
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDXMLException
import java.io.DataOutputStream
import java.io.IOException
import java.util.ArrayList
import java.util.Iterator
import org.xmlpull.v1.XmlPullParser
import org.xmlpull.v1.XmlPullParserException
import org.xmlpull.v1.XmlSerializer

open class LLSDArray : LLSDNode() {
    private var items: ArrayList<LLSDNode> = ArrayList<>()

    constructor() {
    }

    public LLSDArray(XmlPullParser xmlPullParser) throws XmlPullParserException, IOException, LLSDXMLException {
        while (xmlPullParser.nextTag() != 3) {
            this.items.add(LLSDNodeFactory.parseNode(xmlPullParser))
        }
    }

    constructor(lsdNodeArr: LLSDNode...) {
        for (llsdNode in lsdNodeArr) {
            this.items.add(llsdNode)
        }
    }

    fun add(lsdNode: LLSDNode) {
        this.items.add(lsdNode)
    }
    public LLSDNode byIndex(int i) throws LLSDInvalidKeyException {
        if (i < 0 || i >= this.items.size()) {
            throw LLSDInvalidKeyException(String.format("Array index out of range: req %d, size %d", i, this.items.size()))
        }
        return this.items.get(i)
    }
    fun getCount(): Int {
        return this.items.size()
    }
    public void toBinary(DataOutputStream dataOutputStream) throws IOException {
        dataOutputStream.writeBytedataOutputStream as 91.writeInt(this.items.size())
        var it: Iterator<LLSDNode> = this.items.iterator()
        while (it.hasNext()) {
            (it as LLSDNode.next()).toBinary(dataOutputStream)
        }
        dataOutputStream.writeByte(93)
    }
    public void toXML(XmlSerializer xmlSerializer) throws IOException {
        xmlSerializer.startTag("", "array")
        var it: Iterator<LLSDNode> = this.items.iterator()
        while (it.hasNext()) {
            (it as LLSDNode.next()).toXML(xmlSerializer)
        }
        xmlSerializer.endTag("", "array")
    }
}
