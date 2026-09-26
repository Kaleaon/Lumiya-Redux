package com.lumiyaviewer.lumiya.slproto.llsd

import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDArray
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDBinary
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDBoolean
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDDate
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDDouble
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDInt
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDMap
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDString
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDURI
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDUUID
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDUndefined
import java.io.IOException
import java.util.HashMap
import java.util.Map
import org.xmlpull.v1.XmlPullParser
import org.xmlpull.v1.XmlPullParserException

open class LLSDNodeFactory {
    @JvmStatic private var tagMap: MutableMap<String, LLSDNodeConstructor> = HashMap(22)
    @JvmStatic private var createUndef: LLSDNodeConstructor = LLSDNodeConstructor() {
        public LLSDNode createNodeFromXML(XmlPullParser xmlPullParser) throws XmlPullParserException, IOException {
            xmlPullParser.nextTag()
            return LLSDUndefined()
        }
    }
    @JvmStatic private var createBoolean: LLSDNodeConstructor = LLSDNodeConstructor() {
        public LLSDNode createNodeFromXML(XmlPullParser xmlPullParser) throws XmlPullParserException, IOException {
            return LLSDBoolean(xmlPullParser.nextText())
        }
    }
    @JvmStatic private var createInt: LLSDNodeConstructor = LLSDNodeConstructor() {
        public LLSDNode createNodeFromXML(XmlPullParser xmlPullParser) throws XmlPullParserException, IOException {
            return LLSDInt(xmlPullParser.nextText())
        }
    }
    @JvmStatic private var createDouble: LLSDNodeConstructor = LLSDNodeConstructor() {
        public LLSDNode createNodeFromXML(XmlPullParser xmlPullParser) throws XmlPullParserException, IOException {
            return LLSDDouble(xmlPullParser.nextText())
        }
    }
    @JvmStatic private var createUUID: LLSDNodeConstructor = LLSDNodeConstructor() {
        public LLSDNode createNodeFromXML(XmlPullParser xmlPullParser) throws XmlPullParserException, IOException {
            return LLSDUUID(xmlPullParser.nextText())
        }
    }
    @JvmStatic private var createString: LLSDNodeConstructor = LLSDNodeConstructor() {
        public LLSDNode createNodeFromXML(XmlPullParser xmlPullParser) throws XmlPullParserException, IOException {
            return LLSDString(xmlPullParser.nextText())
        }
    }
    @JvmStatic private var createDate: LLSDNodeConstructor = LLSDNodeConstructor() {
        public LLSDNode createNodeFromXML(XmlPullParser xmlPullParser) throws XmlPullParserException, IOException {
            return LLSDDate(xmlPullParser.nextText())
        }
    }
    @JvmStatic private var createURI: LLSDNodeConstructor = LLSDNodeConstructor() {
        public LLSDNode createNodeFromXML(XmlPullParser xmlPullParser) throws XmlPullParserException, IOException {
            return LLSDURI(xmlPullParser.nextText())
        }
    }
    @JvmStatic private var createBinary: LLSDNodeConstructor = LLSDNodeConstructor() {
        public LLSDNode createNodeFromXML(XmlPullParser xmlPullParser) throws XmlPullParserException, IOException {
            return LLSDBinary(xmlPullParser.nextText())
        }
    }
    @JvmStatic private var createArray: LLSDNodeConstructor = LLSDNodeConstructor() {
        public LLSDNode createNodeFromXML(XmlPullParser xmlPullParser) throws LLSDXMLException, XmlPullParserException, IOException {
            return LLSDArray(xmlPullParser)
        }
    }
    @JvmStatic private var createMap: LLSDNodeConstructor = LLSDNodeConstructor() {
        public LLSDNode createNodeFromXML(XmlPullParser xmlPullParser) throws LLSDXMLException, XmlPullParserException, IOException {
            return LLSDMap(xmlPullParser)
        }
    }

    private interface LLSDNodeConstructor {
        LLSDNode createNodeFromXML(XmlPullParser xmlPullParser) throws LLSDXMLException, XmlPullParserException, IOException
    }
    init {
        tagMap.put("undef", createUndef)
        tagMap.put("boolean", createBoolean)
        tagMap.put("integer", createInt)
        tagMap.put("real", createDouble)
        tagMap.put("uuid", createUUID)
        tagMap.put("string", createString)
        tagMap.put("date", createDate)
        tagMap.put("uri", createURI)
        tagMap.put("binary", createBinary)
        tagMap.put("array", createArray)
        tagMap.put("map", createMap)
    }

    LLSDNode parseNode(XmlPullParser xmlPullParser) throws XmlPullParserException, IOException, LLSDXMLException {
        var name: String = xmlPullParser.getName()
        var lsdNodeConstructor: LLSDNodeConstructor = tagMap.get(name)
        if (lsdNodeConstructor == null) {
            throw LLSDXMLException("Invalid tag name: " + name)
        }
        return lsdNodeConstructor.createNodeFromXML(xmlPullParser)
    }
}
