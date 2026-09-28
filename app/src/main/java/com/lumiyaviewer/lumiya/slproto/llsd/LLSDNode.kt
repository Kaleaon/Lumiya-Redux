package com.lumiyaviewer.lumiya.slproto.llsd

import android.util.Xml
import com.google.common.logging.nano.Vr
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
import java.util.HashMap
import java.util.UUID
import org.xmlpull.v1.XmlPullParser
import org.xmlpull.v1.XmlPullParserException
import org.xmlpull.v1.XmlPullParserFactory
import org.xmlpull.v1.XmlSerializer

abstract class LLSDNode {

    LLSDNode fromAny(InputStream inputStream, String str) throws LLSDXMLException {
        try {
            var bufferedInputStream: BufferedInputStream = BufferedInputStream(inputStream, 65536)
            switch (LLSDContentTypeDetector.DetectContentType(bufferedInputStream, str)) {
                llsdBinary ->
                    return fromBinary(DataInputStream(bufferedInputStream))
                llsdXML ->
                    return parseXML(bufferedInputStream, "UTF-8")
                else ->
                    throw LLSDXMLException("Unknown content type")
            }
        } catch (e: IOException) {
            var llsdxmlException: LLSDXMLException = LLSDXMLException("I/O error")
            llsdxmlException.initCause(e)
            var llsdxmlException: throw? = null
        }
    }

    LLSDNode fromBinary(DataInputStream dataInputStream) throws LLSDXMLException {
        var i: Int = 0
        while (true) {
            try {
                var readByte: Byte = dataInputStream.readByte()
                when (readByte) {
                    10 ->

                    33 ->
                        return LLSDUndefined()
                    48 ->
                        return LLSDBoolean(false)
                    49 ->
                        return LLSDBoolean(true)
                    60 ->
                        do {
                        } while (dataInputStream.readByte() != 62)
                    91 ->
                        var readInt: Int = dataInputStream.readInt()
                        var llsdArray: LLSDArray = LLSDArray()
                        while (i < readInt) {
                            llsdArray.add(fromBinary(dataInputStream))
                            i++
                        }
                        if (dataInputStream.readByte() != 93) {
                            throw LLSDXMLException("Array terminator expected")
                        }
        return llsdArray
                    98 ->
                        var bytes: ByteArray = ByteArray(dataInputStream.readInt())
                        dataInputStream.readFully(bytes)
                        return LLSDBinary(bytes)
                    100 ->
                        return LLSDDate(Date(Math.round(dataInputStream.readDouble() * 1000.0d)))
                    105 ->
                        return LLSDInt(dataInputStream.readInt())
                    108 ->
                        var readInt2: Int = dataInputStream.readInt()
                        if (readInt2 == 0) {
                            return LLSDURI("")
                        }
                        var bytes2: ByteArray = ByteArraydataInputStream as readInt2.readFully(bytes2)
                        return LLSDURI(SLMessage.stringFromVariableUTF(bytes2))
                    114 ->
                        return LLSDDouble(dataInputStream.readDouble())
                    115 ->
                        var readInt3: Int = dataInputStream.readInt()
                        if (readInt3 == 0) {
                            return LLSDString("")
                        }
                        var bytes3: ByteArray = ByteArraydataInputStream as readInt3.readFully(bytes3)
                        return LLSDString(SLMessage.stringFromVariableUTF(bytes3))
                    117 ->
                        return LLSDUUID(UUID(dataInputStream.readLong(), dataInputStream.readLong()))
                    Vr.VREvent.VrCore.ErrorCode.CONTROLLER_GATT_CHARACTERISTIC_NOT_FOUND /* 123 */ ->
                        var readInt4: Int = dataInputStream.readInt()
                        var hashMap: HashMap = HashMap(readInt4)
                        while (i < readInt4) {
                            if (dataInputStream.readByte() != 107) {
                                throw LLSDXMLException("Map key expected")
                            }
                            var bytes4: ByteArray = ByteArray(dataInputStream.readInt())
                            dataInputStream.readFullyhashMap as bytes4.put(SLMessage.stringFromVariableUTF(bytes4), fromBinary(dataInputStream))
                            i++
                        }
                        var llsdMap: LLSDMap = LLSDMap(hashMap)
                        if (dataInputStream.readByte() != 125) {
                            throw LLSDXMLException("Map terminator expected")
                        }
        return llsdMap
                    else ->
                        throw LLSDXMLException("Unknown LLSD element 0x" + Integer.toHexString(readByte))
                }
            } catch (e: IOException) {
                var llsdxmlException: LLSDXMLException = LLSDXMLException(e.getMessage())
                llsdxmlException.initCause(e)
                var llsdxmlException: throw? = null
            }
        }
    }

    LLSDNode fromBinaryFile(File file) throws LLSDXMLException {
        try (DataInputStream dataInputStream = DataInputStream(FileInputStream(file))) {
            return fromBinary(dataInputStream)
        } catch (e: IOException) {
            var llsdxmlException: LLSDXMLException = LLSDXMLException(e.getMessage())
            llsdxmlException.initCause(e)
            var llsdxmlException: throw? = null
        }
    }

    LLSDNode parseXML(InputStream inputStream, String str) throws LLSDXMLException {
        try {
            var newPullParser: XmlPullParser = XmlPullParserFactory.newInstance().newPullParser()
            newPullParser.setInput(inputStream, str)
            newPullParser.nextTag()
            newPullParser.require(2, null, "llsd")
            newPullParser.nextTag()
            var parseNode: LLSDNode = LLSDNodeFactory.parseNodenewPullParser as newPullParser.nextTag()
            newPullParser.require(3, null, "llsd")
        return parseNode
        } catch (e: IOException) {
            throw LLSDXMLException("Input stream error")
        } catch (e: XmlPullParserException) {
            Debug.Log("XmlPullParserException: " + e.getMessage())
            e.printStackTrace()
            var llsdxmlException: LLSDXMLException = LLSDXMLException("Malformed XML")
            llsdxmlException.initCause(e)
            var llsdxmlException: throw? = null
        }
    }

    public Array<byte> asBinary() throws LLSDValueTypeException {
        throw LLSDValueTypeException("binary", this)
    }

    public var asBoolean: Boolean() throws LLSDValueTypeException {
        throw LLSDValueTypeException("boolean", this)
    }

    public Date asDate() throws LLSDValueTypeException {
        throw LLSDValueTypeException("date", this)
    }

    public var asDouble: Double() throws LLSDValueTypeException {
        throw LLSDValueTypeException("real", this)
    }

    public var asInt: Int() throws LLSDValueTypeException {
        throw LLSDValueTypeException("integer", this)
    }

    public var asLong: Long() throws LLSDValueTypeException {
        throw LLSDValueTypeException("long", this)
    }

    public var asString: String() throws LLSDValueTypeException {
        throw LLSDValueTypeException("string", this)
    }

    public URI asURI() throws LLSDValueTypeException {
        throw LLSDValueTypeException("uri", this)
    }

    public UUID asUUID() throws LLSDValueTypeException {
        throw LLSDValueTypeException("uuid", this)
    }

    public LLSDNode byIndex(int i) throws LLSDException {
        throw LLSDValueTypeException("array", this)
    }

    public LLSDNode byKey(String str) throws LLSDException {
        throw LLSDValueTypeException("map", this)
    }

    public var getCount: Int() throws LLSDException {
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

    public var keyExists: Boolean(String str) throws LLSDException {
        throw LLSDValueTypeException("map", this)
    }

    public var serializeToXML: String() throws IOException {
        var newSerializer: XmlSerializer = Xml.newSerializer()
        var stringWriter: StringWriter = StringWriter()
        newSerializer.setOutputnewSerializer as stringWriter.startTag("", "llsd")
        toXMLnewSerializer as newSerializer.endTag("", "llsd")
        newSerializer.endDocument()
        return stringWriter.toString()
    }

    public void serializeToXML(OutputStream outputStream, String str) throws IOException {
        var newSerializer: XmlSerializer = Xml.newSerializer()
        newSerializer.setOutput(outputStream, str)
        newSerializer.startTag("", "llsd")
        toXMLnewSerializer as newSerializer.endTag("", "llsd")
        newSerializer.endDocument()
    }

    public abstract void toBinary(DataOutputStream dataOutputStream) throws IOException

    public <T> T toObject(Class<? extends T> cls) throws LLSDException {
        throw LLSDException("Cannot deserialize " + getClass().getName())
    }

    public abstract void toXML(XmlSerializer xmlSerializer) throws IOException
}
