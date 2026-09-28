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
import org.xmlpull.v1.XmlPullParser
import org.xmlpull.v1.XmlPullParserException

object LLSDNodeFactory {

    private fun interface LLSDNodeConstructor {
        @Throws(LLSDXMLException::class, XmlPullParserException::class, IOException::class)
        fun createNodeFromXML(xmlPullParser: XmlPullParser): LLSDNode
    }

    private val createUndef = LLSDNodeConstructor { xmlPullParser ->
        xmlPullParser.nextTag()
        LLSDUndefined()
    }
    private val createBoolean = LLSDNodeConstructor { xmlPullParser -> LLSDBoolean(xmlPullParser.nextText()) }
    private val createInt = LLSDNodeConstructor { xmlPullParser -> LLSDInt(xmlPullParser.nextText()) }
    private val createDouble = LLSDNodeConstructor { xmlPullParser -> LLSDDouble(xmlPullParser.nextText()) }
    private val createUUID = LLSDNodeConstructor { xmlPullParser -> LLSDUUID(xmlPullParser.nextText()) }
    private val createString = LLSDNodeConstructor { xmlPullParser -> LLSDString(xmlPullParser.nextText()) }
    private val createDate = LLSDNodeConstructor { xmlPullParser -> LLSDDate(xmlPullParser.nextText()) }
    private val createURI = LLSDNodeConstructor { xmlPullParser -> LLSDURI(xmlPullParser.nextText()) }
    private val createBinary = LLSDNodeConstructor { xmlPullParser -> LLSDBinary(xmlPullParser.nextText()) }
    private val createArray = LLSDNodeConstructor { xmlPullParser -> LLSDArray(xmlPullParser) }
    private val createMap = LLSDNodeConstructor { xmlPullParser -> LLSDMap(xmlPullParser) }

    private val tagMap: MutableMap<String, LLSDNodeConstructor> = HashMap(22)

    init {
        tagMap["undef"] = createUndef
        tagMap["boolean"] = createBoolean
        tagMap["integer"] = createInt
        tagMap["real"] = createDouble
        tagMap["uuid"] = createUUID
        tagMap["string"] = createString
        tagMap["date"] = createDate
        tagMap["uri"] = createURI
        tagMap["binary"] = createBinary
        tagMap["array"] = createArray
        tagMap["map"] = createMap
    }

    @JvmStatic
    @Throws(XmlPullParserException::class, IOException::class, LLSDXMLException::class)
    fun parseNode(xmlPullParser: XmlPullParser): LLSDNode {
        val name: String = xmlPullParser.name
        val lsdNodeConstructor = tagMap[name] ?: throw LLSDXMLException("Invalid tag name: $name")
        return lsdNodeConstructor.createNodeFromXML(xmlPullParser)
    }
}
