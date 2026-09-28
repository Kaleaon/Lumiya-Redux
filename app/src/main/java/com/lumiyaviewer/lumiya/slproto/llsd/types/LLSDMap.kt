package com.lumiyaviewer.lumiya.slproto.llsd.types

import com.google.common.base.Strings
import com.google.common.collect.ImmutableMap
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDException
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDInvalidKeyException
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNodeFactory
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDSerialized
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDValueTypeException
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDXMLException
import java.io.DataOutputStream
import java.io.IOException
import java.lang.reflect.ParameterizedType
import java.net.URI
import java.util.Date
import java.util.UUID
import org.xmlpull.v1.XmlPullParser
import org.xmlpull.v1.XmlPullParserException
import org.xmlpull.v1.XmlSerializer

open class LLSDMap : LLSDNode {

    private val items: ImmutableMap<String, LLSDNode>

    open class LLSDMapEntry(val key: String, val value: LLSDNode)

    constructor(map: Map<String, LLSDNode>) {
        this.items = ImmutableMap.copyOf(map)
    }

    @Throws(LLSDXMLException::class, XmlPullParserException::class, IOException::class)
    constructor(xmlPullParser: XmlPullParser) {
        val hashMap = HashMap<String, LLSDNode>()
        while (xmlPullParser.nextTag() != 3) {
            xmlPullParser.require(2, null, "key")
            val nextText: String = xmlPullParser.nextText()
            xmlPullParser.nextTag()
            hashMap[nextText] = LLSDNodeFactory.parseNode(xmlPullParser)
        }
        this.items = ImmutableMap.copyOf(hashMap)
    }

    constructor(vararg lsdMapEntryArr: LLSDMapEntry) {
        val hashMap = HashMap<String, LLSDNode>(lsdMapEntryArr.size)
        for (llsdMapEntry in lsdMapEntryArr) {
            hashMap[llsdMapEntry.key] = llsdMapEntry.value
        }
        this.items = ImmutableMap.copyOf(hashMap)
    }

    override fun byKey(str: String): LLSDNode {
        val lsdNode = this.items[str]
        if (lsdNode != null) {
            return lsdNode
        }
        throw LLSDInvalidKeyException("Map key not found, requested \"" + str + "\"")
    }

    fun entrySet(): Set<Map.Entry<String, LLSDNode>> {
        return this.items.entries
    }

    override fun keyExists(str: String): Boolean {
        return this.items.containsKey(str)
    }

    override fun toBinary(dataOutputStream: DataOutputStream) {
        dataOutputStream.writeByte(123)
        val entrySet = this.items.entries
        dataOutputStream.writeInt(entrySet.size)
        for (entry in entrySet) {
            dataOutputStream.writeByte(107)
            val stringToVariableUTF: ByteArray = SLMessage.stringToVariableUTF(entry.key)
            dataOutputStream.writeInt(stringToVariableUTF.size)
            dataOutputStream.write(stringToVariableUTF)
            entry.value.toBinary(dataOutputStream)
        }
        dataOutputStream.writeByte(125)
    }

    override fun <T> toObject(cls: Class<out T>): T {
        try {
            val newInstance: T = cls.newInstance()
            for (field in cls.declaredFields) {
                val annotation: LLSDSerialized? = field.getAnnotation(LLSDSerialized::class.java)
                if (annotation != null) {
                    var name: String = annotation.name
                    if (Strings.isNullOrEmpty(name)) {
                        name = field.name
                    }
                    val type: Class<*> = field.type
                    if (keyExists(name)) {
                        val byKey: LLSDNode = byKey(name)
                        field.isAccessible = true
                        if (type == java.lang.Boolean.TYPE) {
                            field.setBoolean(newInstance, byKey.asBoolean())
                        } else if (type == Integer.TYPE) {
                            field.setInt(newInstance, byKey.asInt())
                        } else if (type == java.lang.Double.TYPE) {
                            field.setDouble(newInstance, byKey.asDouble())
                        } else if (type == java.lang.Long.TYPE) {
                            field.setLong(newInstance, byKey.asLong())
                        } else if (type == String::class.java) {
                            field.set(newInstance, byKey.asString())
                        } else if (type == UUID::class.java) {
                            field.set(newInstance, byKey.asUUID())
                        } else if (type == URI::class.java) {
                            field.set(newInstance, byKey.asURI())
                        } else if (type == Date::class.java) {
                            field.set(newInstance, byKey.asDate())
                        } else if (type == ByteArray::class.java) {
                            field.set(newInstance, byKey.asBinary())
                        } else if (type.isAssignableFrom(List::class.java)) {
                            val genericType = field.genericType
                            if (genericType !is ParameterizedType) {
                                throw LLSDValueTypeException(type.name, byKey)
                            }
                            val actualTypeArguments = genericType.actualTypeArguments
                            if (actualTypeArguments.size != 1) {
                                throw LLSDValueTypeException(type.name, byKey)
                            }
                            val type2 = actualTypeArguments[0]
                            if (type2 !is Class<*>) {
                                throw LLSDValueTypeException(type.name, byKey)
                            }
                            val count = byKey.getCount()
                            val arrayList = ArrayList<Any?>(count)
                            for (i in 0 until count) {
                                arrayList.add(byKey.byIndex(i).toObject(type2))
                            }
                            field.set(newInstance, arrayList)
                        } else {
                            continue
                        }
                    } else {
                        continue
                    }
                }
            }
            return newInstance
        } catch (e: IllegalAccessException) {
            throw LLSDException(e.message ?: "")
        } catch (e2: InstantiationException) {
            throw LLSDException(e2.message ?: "")
        }
    }

    override fun toXML(xmlSerializer: XmlSerializer) {
        xmlSerializer.startTag("", "map")
        for (entry in this.items.entries) {
            xmlSerializer.startTag("", "key")
            xmlSerializer.text(entry.key)
            xmlSerializer.endTag("", "key")
            entry.value.toXML(xmlSerializer)
        }
        xmlSerializer.endTag("", "map")
    }
}
