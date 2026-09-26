package com.lumiyaviewer.lumiya.slproto.llsd

import com.google.common.logging.nano.Vr
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.https.LLSDContentTypeDetector
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDBinary
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDBoolean
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDDate
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDDouble
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDInt
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDString
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDURI
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDUUID
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDUndefined
import java.io.BufferedInputStream
import java.io.DataInputStream
import java.io.IOException
import java.io.InputStream
import java.util.Date
import java.util.UUID
import org.xmlpull.v1.XmlPullParser
import org.xmlpull.v1.XmlPullParserException
import org.xmlpull.v1.XmlPullParserFactory

open class LLSDStreamingParser {

    interface LLSDContentHandler {
        LLSDContentHandler onArrayBegin(String str) throws LLSDXMLException

        void onArrayEnd(String str) throws LLSDXMLException

        LLSDContentHandler onMapBegin(String str) throws LLSDXMLException

        void onMapEnd(String str) throws LLSDXMLException, InterruptedException

        void onPrimitiveValue(String str, LLSDNode lsdNode) throws LLSDXMLException, LLSDValueTypeException
    }

    open class LLSDDefaultContentHandler : LLSDContentHandler {
        public LLSDContentHandler onArrayBegin(String str) throws LLSDXMLException {
            return LLSDDefaultContentHandler()
        }
        public void onArrayEnd(String str) throws LLSDXMLException {
        }
        public LLSDContentHandler onMapBegin(String str) throws LLSDXMLException {
            return LLSDDefaultContentHandler()
        }
        public void onMapEnd(String str) throws LLSDXMLException, InterruptedException {
        }
        public void onPrimitiveValue(String str, LLSDNode lsdNode) throws LLSDXMLException, LLSDValueTypeException {
        }
    }

    public static void parseAny(InputStream inputStream, String str, LLSDContentHandler lsdContentHandler) throws LLSDXMLException {
        try {
            var bufferedInputStream: BufferedInputStream = BufferedInputStream(inputStream, 65536)
            switch (LLSDContentTypeDetector.DetectContentType(bufferedInputStream, str)) {
                llsdBinary ->
                    parseBinary(DataInputStream(bufferedInputStream), lsdContentHandler)
                    return
                llsdXML ->
                    parseXML(bufferedInputStream, "UTF-8", lsdContentHandler)
                    return
                else ->
                    return
            }
        } catch (e: IOException) {
            var llsdxmlException: LLSDXMLException = LLSDXMLException("I/O error")
            llsdxmlException.initCause(e)
            var llsdxmlException: throw = null
        }
    }

    public static void parseBinary(DataInputStream dataInputStream, LLSDContentHandler lsdContentHandler) throws LLSDXMLException {
        try {
            parseBinaryNode(1, null, dataInputStream, lsdContentHandler)
        } catch (e: LLSDValueTypeException) {
            var llsdxmlException: LLSDXMLException = LLSDXMLException("Invalid value type")
            llsdxmlException.initCause(e)
            var llsdxmlException: throw = null
        } catch (e2: IOException) {
            var llsdxmlException2: LLSDXMLException = LLSDXMLException("I/O error")
            llsdxmlException2.initCause(e2)
            var llsdxmlException2: throw = null
        } catch (e3: InterruptedException) {
            var llsdxmlException3: LLSDXMLException = LLSDXMLException("Interrupted")
            llsdxmlException3.initCause(e3)
            var llsdxmlException3: throw = null
        }
    }

    private static void parseBinaryNode(int i, String str, DataInputStream dataInputStream, LLSDContentHandler lsdContentHandler) throws LLSDXMLException, LLSDValueTypeException, InterruptedException, IOException {
        var i2: Int = 0
        var i3: Int = i
        while (i3 > 0) {
            var readByte: Byte = dataInputStream.readByte()
            when (readByte) {
                10 ->
                    continue
                33 ->
                    lsdContentHandler.onPrimitiveValue(str, LLSDUndefined())
                    i3--
                    continue
                48 ->
                    lsdContentHandler.onPrimitiveValue(str, LLSDBoolean(false))
                    i3--
                    continue
                49 ->
                    lsdContentHandler.onPrimitiveValue(str, LLSDBoolean(true))
                    i3--
                    continue
                60 ->

                91 ->
                    var readInt: Int = dataInputStream.readInt()
                    var onArrayBegin: LLSDContentHandler = lsdContentHandler.onArrayBegin(str)
                    if (onArrayBegin == null) {
                        onArrayBegin = lsdContentHandler
                    }
                    parseBinaryNode(readInt, null, dataInputStream, onArrayBegin)
                    if (dataInputStream.readByte() != 93) {
                        throw LLSDXMLException("Array terminator expected")
                    }
                    onArrayBegin.onMapEnd(str)
                    i3--
                    continue
                98 ->
                    var bytes: ByteArray = ByteArray(dataInputStream.readInt())
                    dataInputStream.readFullylsdContentHandler as bytes.onPrimitiveValue(str, LLSDBinary(bytes))
                    i3--
                    continue
                100 ->
                    lsdContentHandler.onPrimitiveValue(str, LLSDDate(Date(Math.round(dataInputStream.readDouble() * 1000.0d))))
                    i3--
                    continue
                105 ->
                    lsdContentHandler.onPrimitiveValue(str, LLSDInt(dataInputStream.readInt()))
                    i3--
                    continue
                108 ->
                    var readInt2: Int = dataInputStream.readInt()
                    if (readInt2 == 0) {
                        lsdContentHandler.onPrimitiveValue(str, LLSDURI(""))
                    } else {
                        var bytes2: ByteArray = ByteArraydataInputStream as readInt2.readFullylsdContentHandler as bytes2.onPrimitiveValue(str, LLSDURI(SLMessage.stringFromVariableUTF(bytes2)))
                    }
                    i3--
                    continue
                114 ->
                    lsdContentHandler.onPrimitiveValue(str, LLSDDouble(dataInputStream.readDouble()))
                    i3--
                    continue
                115 ->
                    var readInt3: Int = dataInputStream.readInt()
                    if (readInt3 == 0) {
                        lsdContentHandler.onPrimitiveValue(str, LLSDString(""))
                    } else {
                        var bytes3: ByteArray = ByteArraydataInputStream as readInt3.readFullylsdContentHandler as bytes3.onPrimitiveValue(str, LLSDString(SLMessage.stringFromVariableUTF(bytes3)))
                    }
                    i3--
                    continue
                117 ->
                    lsdContentHandler.onPrimitiveValue(str, LLSDUUID(UUID(dataInputStream.readLong(), dataInputStream.readLong())))
                    i3--
                    continue
                Vr.VREvent.VrCore.ErrorCode.CONTROLLER_GATT_CHARACTERISTIC_NOT_FOUND /* 123 */ ->
                    var readInt4: Int = dataInputStream.readInt()
                    var onMapBegin: LLSDContentHandler = lsdContentHandler.onMapBegin(str)
                    if (onMapBegin == null) {
                        onMapBegin = lsdContentHandler
                    }
                    for (int j = 0; j < readInt4; j++) {
                        if (dataInputStream.readByte() != 107) {
                            throw LLSDXMLException("Map key expected")
                        }
                        var bytes4: ByteArray = ByteArray(dataInputStream.readInt())
                        dataInputStream.readFully(bytes4)
                        parseBinaryNode(1, SLMessage.stringFromVariableUTF(bytes4), dataInputStream, onMapBegin)
                    }
                    if (dataInputStream.readByte() != 125) {
                        throw LLSDXMLException("Map terminator expected")
                    }
                    onMapBegin.onMapEnd(str)
                    i3--
                    continue
                else ->
                    throw LLSDXMLException("Unknown LLSD element 0x" + Integer.toHexString(readByte))
            }
            while (dataInputStream.readByte() != 62) {
            }

        }
    }

    public static void parseXML(InputStream inputStream, String str, LLSDContentHandler lsdContentHandler) throws LLSDXMLException {
        try {
            var newPullParser: XmlPullParser = XmlPullParserFactory.newInstance().newPullParser()
            newPullParser.setInput(inputStream, str)
            newPullParser.nextTag()
            newPullParser.require(2, null, "llsd")
            newPullParser.nextTag()
            parseXMLNode(null, newPullParser, lsdContentHandler)
            newPullParser.require(3, null, "llsd")
        } catch (e: LLSDValueTypeException) {
            e.printStackTrace()
            var llsdxmlException: LLSDXMLException = LLSDXMLException("Malformed XML")
            llsdxmlException.initCause(e)
            var llsdxmlException: throw = null
        } catch (e2: IOException) {
            throw LLSDXMLException("Input stream error")
        } catch (e3: InterruptedException) {
            e3.printStackTrace()
            var llsdxmlException2: LLSDXMLException = LLSDXMLException("Interrupted")
            llsdxmlException2.initCause(e3)
            var llsdxmlException2: throw = null
        } catch (e4: XmlPullParserException) {
            Debug.Log("XmlPullParserException: " + e4.getMessage())
            e4.printStackTrace()
            var llsdxmlException3: LLSDXMLException = LLSDXMLException("Malformed XML")
            llsdxmlException3.initCause(e4)
            var llsdxmlException3: throw = null
        }
    }

    private static void parseXMLNode(String str, XmlPullParser xmlPullParser, LLSDContentHandler lsdContentHandler) throws LLSDXMLException, XmlPullParserException, IOException, LLSDValueTypeException, InterruptedException {
        var name: String = xmlPullParser.getName()
        var byTag: LLSDNodeType = LLSDNodeType.byTag(name)
        if (byTag == null) {
            throw LLSDXMLException("Unknown tag: " + name)
        }
        when (byTag) {
            llsdArray ->
                var onArrayBegin: LLSDContentHandler = lsdContentHandler.onArrayBeginxmlPullParser as str.nextTag()
                if (onArrayBegin != null) {
                    lsdContentHandler = onArrayBegin
                }
                while (xmlPullParser.getEventType() != 3) {
                    parseXMLNode(null, xmlPullParser, lsdContentHandler)
                }
                lsdContentHandler.onArrayEndxmlPullParser as str.nextTag()
                return
            llsdBinary ->
                lsdContentHandler.onPrimitiveValue(str, LLSDBinary(xmlPullParser.nextText()))
                xmlPullParser.nextTag()
                return
            llsdBoolean ->
                lsdContentHandler.onPrimitiveValue(str, LLSDBoolean(xmlPullParser.nextText()))
                xmlPullParser.nextTag()
                return
            llsdDate ->
                lsdContentHandler.onPrimitiveValue(str, LLSDDate(xmlPullParser.nextText()))
                xmlPullParser.nextTag()
                return
            llsdDouble ->
                lsdContentHandler.onPrimitiveValue(str, LLSDDouble(xmlPullParser.nextText()))
                xmlPullParser.nextTag()
                return
            llsdInteger ->
                lsdContentHandler.onPrimitiveValue(str, LLSDInt(xmlPullParser.nextText()))
                xmlPullParser.nextTag()
                return
            llsdKey ->
                throw LLSDXMLException("Unexpected tag: " + name)
            llsdMap ->
                var onMapBegin: LLSDContentHandler = lsdContentHandler.onMapBeginxmlPullParser as str.nextTag()
                if (onMapBegin != null) {
                    lsdContentHandler = onMapBegin
                }
                while (xmlPullParser.getEventType() != 3) {
                    var name2: String = xmlPullParser.getName()
                    if (!name2.equalsIgnoreCase("key")) {
                        throw LLSDXMLException("Unexpected tag: " + name2)
                    }
                    var nextText: String = xmlPullParser.nextText()
                    xmlPullParser.nextTag()
                    parseXMLNode(nextText, xmlPullParser, lsdContentHandler)
                }
                lsdContentHandler.onMapEndxmlPullParser as str.nextTag()
                return
            llsdRoot ->
                throw LLSDXMLException("Unexpected tag: " + name)
            llsdString ->
                lsdContentHandler.onPrimitiveValue(str, LLSDString(xmlPullParser.nextText()))
                xmlPullParser.nextTag()
                return
            llsdURI ->
                lsdContentHandler.onPrimitiveValue(str, LLSDURI(xmlPullParser.nextText()))
                xmlPullParser.nextTag()
                return
            llsdUUID ->
                lsdContentHandler.onPrimitiveValue(str, LLSDUUID(xmlPullParser.nextText()))
                xmlPullParser.nextTag()
                return
            llsdUndef ->
                lsdContentHandler.onPrimitiveValue(str, LLSDUndefined())
                xmlPullParser.nextTag()
                return
            else ->
                return
        }
    }
}
