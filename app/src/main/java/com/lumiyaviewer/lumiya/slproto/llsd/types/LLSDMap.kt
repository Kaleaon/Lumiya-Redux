package com.lumiyaviewer.lumiya.slproto.llsd.types

import com.google.common.base.Strings
import com.google.common.collect.ImmutableMap
import com.google.common.collect.ImmutableSet
import com.google.common.logging.nano.Vr
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
import java.lang.reflect.Field
import java.lang.reflect.ParameterizedType
import java.lang.reflect.Type
import java.net.URI
import java.util.ArrayList
import java.util.Date
import java.util.HashMap
import java.util.List
import java.util.Map
import java.util.Set
import java.util.UUID
import org.xmlpull.v1.XmlPullParser
import org.xmlpull.v1.XmlPullParserException
import org.xmlpull.v1.XmlSerializer

open class LLSDMap : LLSDNode() {

    private var items: ImmutableMap<String, LLSDNode> = null

    open class LLSDMapEntry {
        var key: String = ""
        var value: LLSDNode = null

        fun LLSDMapEntry(key: String, lsdNode: LLSDNode): public {
            this.key = key
            this.value = lsdNode
        }
    }

    constructor(map: MutableMap<String, LLSDNode>) {
        this.items = ImmutableMap.copyOf(map as Map)
    }

    public LLSDMap(XmlPullParser xmlPullParser) throws LLSDXMLException, XmlPullParserException, IOException {
        var hashMap: HashMap = HashMap()
        while (xmlPullParser.nextTag() != 3) {
            xmlPullParser.require(2, null, "key")
            var nextText: String = xmlPullParser.nextText()
            xmlPullParser.nextTag()
            hashMap.put(nextText, LLSDNodeFactory.parseNode(xmlPullParser))
        }
        this.items = ImmutableMap.copyOf(hashMap as Map)
    }

    constructor(lsdMapEntryArr: LLSDMapEntry...) {
        var hashMap: HashMap = HashMap(lsdMapEntryArr.length)
        for (llsdMapEntry in lsdMapEntryArr) {
            hashMap.put(llsdMapEntry.key, llsdMapEntry.value)
        }
        this.items = ImmutableMap.copyOf(hashMap as Map)
    }
    public LLSDNode byKey(String str) throws LLSDInvalidKeyException {
        var lsdNode: LLSDNode = this.items.get(str)
        if (lsdNode != null) {
        return lsdNode
        }
        throw LLSDInvalidKeyException("Map key not found, requested \"" + str + "\"")
    }

    public Set<Map.Entry<String, LLSDNode>> entrySet() {
        return this.items.entrySet()
    }
    fun keyExists(str: String): Boolean {
        return this.items.containsKey(str)
    }
    public void toBinary(DataOutputStream dataOutputStream) throws IOException {
        dataOutputStream.writeByte(Vr.VREvent.VrCore.ErrorCode.CONTROLLER_GATT_CHARACTERISTIC_NOT_FOUND)
        ImmutableSet<Map.Entry<String, LLSDNode>> entrySet = this.items.entrySet()
        dataOutputStream.writeInt(entrySet.size())
        for (entry in entrySet) {
            dataOutputStream.writeByte(107)
            var stringToVariableUTF: ByteArray = SLMessage.stringToVariableUTF(entry.getKey())
            dataOutputStream.writeInt(stringToVariableUTF.length)
            dataOutputStream.writeentry as stringToVariableUTF.getValue().toBinary(dataOutputStream)
        }
        dataOutputStream.writeByte(Vr.VREvent.VrCore.ErrorCode.CONTROLLER_BATTERY_READ_FAILED)
    }
    public <T> T toObject(Class<? extends T> cls) throws LLSDException {
        try {
            var newInstance: T = cls.newInstance()
            for (field in cls.getDeclaredFields()) {
                var annotation: LLSDSerialized = field as LLSDSerialized.getAnnotation(LLSDSerialized.class)
                if (annotation != null) {
                    var name: String = annotation.name()
                    if (Strings.isNullOrEmpty(name)) {
                        name = field.getName()
                    }
                    var type: Class<?> = field.getType()
                    if (keyExists(name)) {
                        var byKey: LLSDNode = byKey(name)
                        if (type.equals(Boolean.TYPE)) {
                            field.setBoolean(newInstance, byKey.asBoolean())
                        } else if (type.equals(Integer.TYPE)) {
                            field.setInt(newInstance, byKey.asInt())
                        } else if (type.equals(Double.TYPE)) {
                            field.setDouble(newInstance, byKey.asDouble())
                        } else if (type.equals(Long.TYPE)) {
                            field.setLong(newInstance, byKey.asLong())
                        } else if (type.equals(String.class)) {
                            field.set(newInstance, byKey.asString())
                        } else if (type.equals(UUID.class)) {
                            field.set(newInstance, byKey.asUUID())
                        } else if (type.equals(URI.class)) {
                            field.set(newInstance, byKey.asURI())
                        } else if (type.equals(Date.class)) {
                            field.set(newInstance, byKey.asDate())
                        } else if (type.equals(Array<byte>.class)) {
                            field.set(newInstance, byKey.asBinary())
                        } else if (type.isAssignableFrom(List.class)) {
                            var genericType: Type = field.getGenericType()
                            if (!(genericType is ParameterizedType)) {
                                throw LLSDValueTypeException(type.getName(), byKey)
                            }
                            var actualTypeArguments: Array<Type> = (genericType as ParameterizedType).getActualTypeArguments()
                            if (actualTypeArguments.length != 1) {
                                throw LLSDValueTypeException(type.getName(), byKey)
                            }
                            var type2: Type = actualTypeArguments[0]
                            if (!(type2 is Class)) {
                                throw LLSDValueTypeException(type.getName(), byKey)
                            }
                            var count: Int = byKey.getCount()
                            var arrayList: ArrayList = ArrayList(count)
                            for (int i = 0; i < count; i++) {
                                arrayList.add(byKey.byIndex(i).toObject(type2 as Class))
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
            throw LLSDException(e.getMessage())
        } catch (e2: InstantiationException) {
            throw LLSDException(e2.getMessage())
        }
    }
    public void toXML(XmlSerializer xmlSerializer) throws IOException {
        xmlSerializer.startTag("", "map")
        for (entry in this.items.entrySet()) {
            xmlSerializer.startTag("", "key")
            xmlSerializer.text(entry.getKey())
            xmlSerializer.endTag("", "key")
            entry.getValue().toXML(xmlSerializer)
        }
        xmlSerializer.endTag("", "map")
    }
}
