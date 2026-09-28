package com.lumiyaviewer.lumiya.slproto.llsd

import android.util.Xml
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.https.LLSDContentTypeDetector
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
import java.io.BufferedInputStream
import java.io.DataInputStream
import java.io.DataOutputStream
import java.io.File
import java.io.FileInputStream
import java.io.IOException
import java.io.InputStream
import java.io.OutputStream
import java.io.StringWriter
import java.net.URI
import java.util.Date
import java.util.UUID
import org.xmlpull.v1.XmlPullParser
import org.xmlpull.v1.XmlPullParserException
import org.xmlpull.v1.XmlPullParserFactory
import org.xmlpull.v1.XmlSerializer

abstract class LLSDNode {

    open fun asBinary(): ByteArray {
        throw LLSDValueTypeException("binary", this)
    }

    open fun asBoolean(): Boolean {
        throw LLSDValueTypeException("boolean", this)
    }

    open fun asDate(): Date {
        throw LLSDValueTypeException("date", this)
    }

    open fun asDouble(): Double {
        throw LLSDValueTypeException("real", this)
    }

    open fun asInt(): Int {
        throw LLSDValueTypeException("integer", this)
    }

    open fun asLong(): Long {
        throw LLSDValueTypeException("long", this)
    }

    open fun asString(): String {
        throw LLSDValueTypeException("string", this)
    }

    open fun asURI(): URI {
        throw LLSDValueTypeException("uri", this)
    }

    open fun asUUID(): UUID {
        throw LLSDValueTypeException("uuid", this)
    }

    open fun byIndex(i: Int): LLSDNode {
        throw LLSDValueTypeException("array", this)
    }

    open fun byKey(str: String): LLSDNode {
        throw LLSDValueTypeException("map", this)
    }

    open fun getCount(): Int {
        throw LLSDValueTypeException("array", this)
    }

    fun isBinary(): Boolean {
        return this is LLSDBinary
    }

    fun isBoolean(): Boolean {
        return this is LLSDBoolean
    }

    fun isDate(): Boolean {
        return this is LLSDDate
    }

    fun isDouble(): Boolean {
        return this is LLSDDouble
    }

    fun isInt(): Boolean {
        return this is LLSDInt
    }

    fun isLong(): Boolean {
        return this is LLSDInt
    }

    fun isString(): Boolean {
        return this is LLSDString
    }

    fun isURI(): Boolean {
        return this is LLSDURI
    }

    fun isUUID(): Boolean {
        return this is LLSDUUID
    }

    open fun keyExists(str: String): Boolean {
        throw LLSDValueTypeException("map", this)
    }

    fun serializeToXML(): String {
        val newSerializer: XmlSerializer = Xml.newSerializer()
        val stringWriter = StringWriter()
        newSerializer.setOutput(stringWriter)
        newSerializer.startTag("", "llsd")
        toXML(newSerializer)
        newSerializer.endTag("", "llsd")
        newSerializer.endDocument()
        return stringWriter.toString()
    }

    fun serializeToXML(outputStream: OutputStream, str: String) {
        val newSerializer: XmlSerializer = Xml.newSerializer()
        newSerializer.setOutput(outputStream, str)
        newSerializer.startTag("", "llsd")
        toXML(newSerializer)
        newSerializer.endTag("", "llsd")
        newSerializer.endDocument()
    }

    abstract fun toBinary(dataOutputStream: DataOutputStream)

    open fun <T> toObject(cls: Class<out T>): T {
        throw LLSDException("Cannot deserialize " + javaClass.name)
    }

    abstract fun toXML(xmlSerializer: XmlSerializer)

    companion object {
        @JvmStatic
        fun fromAny(inputStream: InputStream, str: String): LLSDNode {
            try {
                val bufferedInputStream = BufferedInputStream(inputStream, 65536)
                return when (LLSDContentTypeDetector.DetectContentType(bufferedInputStream, str)) {
                    LLSDContentTypeDetector.LLSDContentType.llsdBinary ->
                        fromBinary(DataInputStream(bufferedInputStream))
                    LLSDContentTypeDetector.LLSDContentType.llsdXML ->
                        parseXML(bufferedInputStream, "UTF-8")
                }
            } catch (e: IOException) {
                val llsdxmlException = LLSDXMLException("I/O error")
                llsdxmlException.initCause(e)
                throw llsdxmlException
            }
        }

        private fun parseArrayBody(dataInputStream: DataInputStream): LLSDNode {
            val readInt = dataInputStream.readInt()
            val llsdArray = LLSDArray()
            var i = 0
            while (i < readInt) {
                llsdArray.add(fromBinary(dataInputStream))
                i++
            }
            if (dataInputStream.readByte().toInt() != 93) {
                throw LLSDXMLException("Array terminator expected")
            }
            return llsdArray
        }

        @JvmStatic
        fun fromBinary(dataInputStream: DataInputStream): LLSDNode {
            var i = 0
            while (true) {
                try {
                    val readByte = dataInputStream.readByte()
                    when (readByte.toInt()) {
                        10 -> {
                            // whitespace, continue loop
                        }
                        33 -> return LLSDUndefined()
                        48 -> return LLSDBoolean(false)
                        49 -> return LLSDBoolean(true)
                        60 -> {
                            do {
                            } while (dataInputStream.readByte().toInt() != 62)
                            return parseArrayBody(dataInputStream)
                        }
                        91 -> return parseArrayBody(dataInputStream)
                        98 -> {
                            val bytes = ByteArray(dataInputStream.readInt())
                            dataInputStream.readFully(bytes)
                            return LLSDBinary(bytes)
                        }
                        100 -> return LLSDDate(Date(Math.round(dataInputStream.readDouble() * 1000.0)))
                        105 -> return LLSDInt(dataInputStream.readInt())
                        108 -> {
                            val readInt2 = dataInputStream.readInt()
                            if (readInt2 == 0) {
                                return LLSDURI("")
                            }
                            val bytes2 = ByteArray(readInt2)
                            dataInputStream.readFully(bytes2)
                            return LLSDURI(SLMessage.stringFromVariableUTF(bytes2))
                        }
                        114 -> return LLSDDouble(dataInputStream.readDouble())
                        115 -> {
                            val readInt3 = dataInputStream.readInt()
                            if (readInt3 == 0) {
                                return LLSDString("")
                            }
                            val bytes3 = ByteArray(readInt3)
                            dataInputStream.readFully(bytes3)
                            return LLSDString(SLMessage.stringFromVariableUTF(bytes3))
                        }
                        117 -> return LLSDUUID(UUID(dataInputStream.readLong(), dataInputStream.readLong()))
                        123 -> {
                            val readInt4 = dataInputStream.readInt()
                            val hashMap = HashMap<String, LLSDNode>(readInt4)
                            while (i < readInt4) {
                                if (dataInputStream.readByte().toInt() != 107) {
                                    throw LLSDXMLException("Map key expected")
                                }
                                val bytes4 = ByteArray(dataInputStream.readInt())
                                dataInputStream.readFully(bytes4)
                                hashMap[SLMessage.stringFromVariableUTF(bytes4)] = fromBinary(dataInputStream)
                                i++
                            }
                            val llsdMap = LLSDMap(hashMap)
                            if (dataInputStream.readByte().toInt() != 125) {
                                throw LLSDXMLException("Map terminator expected")
                            }
                            return llsdMap
                        }
                        else -> throw LLSDXMLException("Unknown LLSD element 0x" + Integer.toHexString(readByte.toInt()))
                    }
                } catch (e: IOException) {
                    val llsdxmlException = LLSDXMLException(e.message ?: "")
                    llsdxmlException.initCause(e)
                    throw llsdxmlException
                }
            }
        }

        @JvmStatic
        fun fromBinaryFile(file: File): LLSDNode {
            try {
                DataInputStream(FileInputStream(file)).use { dataInputStream ->
                    return fromBinary(dataInputStream)
                }
            } catch (e: IOException) {
                val llsdxmlException = LLSDXMLException(e.message ?: "")
                llsdxmlException.initCause(e)
                throw llsdxmlException
            }
        }

        @JvmStatic
        fun parseXML(inputStream: InputStream, str: String): LLSDNode {
            try {
                val newPullParser: XmlPullParser = XmlPullParserFactory.newInstance().newPullParser()
                newPullParser.setInput(inputStream, str)
                newPullParser.nextTag()
                newPullParser.require(2, null, "llsd")
                newPullParser.nextTag()
                val parseNode: LLSDNode = LLSDNodeFactory.parseNode(newPullParser)
                newPullParser.nextTag()
                newPullParser.require(3, null, "llsd")
                return parseNode
            } catch (e: IOException) {
                throw LLSDXMLException("Input stream error")
            } catch (e: XmlPullParserException) {
                Debug.Log("XmlPullParserException: " + e.message)
                e.printStackTrace()
                val llsdxmlException = LLSDXMLException("Malformed XML")
                llsdxmlException.initCause(e)
                throw llsdxmlException
            }
        }
    }
}
