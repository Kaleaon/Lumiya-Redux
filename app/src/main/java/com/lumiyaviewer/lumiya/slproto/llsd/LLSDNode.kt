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
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDLong
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
        return this is LLSDInt || this is LLSDLong
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
                    LLSDContentTypeDetector.LLSDContentType.llsdNotation ->
                        fromNotation(bufferedInputStream)
                }
            } catch (e: IOException) {
                val llsdxmlException = LLSDXMLException("I/O error")
                llsdxmlException.initCause(e)
                throw llsdxmlException
            }
        }

        @JvmStatic
        fun fromNotation(inputStream: InputStream): LLSDNode {
            val text = inputStream.bufferedReader(Charsets.UTF_8).readText()
            return fromNotation(text)
        }

        @JvmStatic
        fun fromNotation(rawText: String): LLSDNode {
            var text = rawText
            if (text.startsWith("<?llsd/notation?>") || text.startsWith("<? llsd/notation ?>")) {
                val nl = text.indexOf('\n')
                if (nl >= 0) text = text.substring(nl + 1)
            }
            return NotationParser(text).parse()
        }

        private class NotationParser(private val text: String) {
            private var pos = 0

            fun parse(): LLSDNode {
                skipWs()
                return parseValue()
            }

            private fun skipWs() {
                while (pos < text.length && text[pos].isWhitespace()) pos++
            }

            private fun peek(): Char = if (pos < text.length) text[pos] else '\u0000'
            private fun consume(): Char = text[pos++]

            fun parseValue(): LLSDNode {
                skipWs()
                val c = peek()
                return when (c) {
                    '!' -> { consume(); LLSDUndefined() }
                    'T', 't' -> parseBoolWord(true)
                    'F', 'f' -> parseBoolWord(false)
                    '1' -> { consume(); LLSDBoolean(true) }
                    '0' -> { consume(); LLSDBoolean(false) }
                    'i' -> {
                        if (text.startsWith("i64", pos)) {
                            pos += 3
                            LLSDLong(parseNumberWord().toLongOrNull() ?: 0L)
                        } else {
                            consume()
                            LLSDInt(parseNumberWord().toIntOrNull() ?: 0)
                        }
                    }
                    'r' -> { consume(); LLSDDouble(parseNumberWord().toDoubleOrNull() ?: 0.0) }
                    'u' -> { consume(); LLSDUUID(parseUuidLiteral()) }
                    'd' -> { consume(); LLSDDate(parseQuotedAfterTag()) }
                    'l' -> { consume(); LLSDURI(parseQuotedAfterTag()) }
                    'b' -> parseBinaryNotation()
                    's' -> parseSizedString()
                    '\'' -> LLSDString(parseSingleQuoted())
                    '"' -> LLSDString(parseDoubleQuoted())
                    '{' -> parseMap()
                    '[' -> parseArray()
                    else -> {
                        if (c != '\u0000') consume()
                        LLSDUndefined()
                    }
                }
            }

            private fun parseBoolWord(value: Boolean): LLSDNode {
                val word = if (value) "true" else "false"
                if (text.regionMatches(pos, word, 0, word.length, ignoreCase = true)) {
                    pos += word.length
                } else {
                    consume()
                }
                return LLSDBoolean(value)
            }

            private fun parseNumberWord(): String {
                val start = pos
                while (pos < text.length) {
                    val c = text[pos]
                    if (c.isWhitespace() || c in ",}]") break
                    pos++
                }
                return text.substring(start, pos)
            }

            private fun parseUuidLiteral(): String {
                val start = pos
                val end = (start + 36).coerceAtMost(text.length)
                pos = end
                return text.substring(start, end)
            }

            private fun parseQuotedAfterTag(): String {
                skipWs()
                return when (peek()) {
                    '"' -> parseDoubleQuoted()
                    '\'' -> parseSingleQuoted()
                    else -> ""
                }
            }

            private fun parseDoubleQuoted(): String {
                consume()
                val sb = StringBuilder()
                while (pos < text.length) {
                    val c = consume()
                    if (c == '"') break
                    if (c == '\\' && pos < text.length) {
                        val esc = consume()
                        when (esc) {
                            'a' -> sb.append('\u0007')
                            'b' -> sb.append('\b')
                            'f' -> sb.append('\u000C')
                            'n' -> sb.append('\n')
                            'r' -> sb.append('\r')
                            't' -> sb.append('\t')
                            'v' -> sb.append('\u000B')
                            else -> sb.append(esc)
                        }
                    } else {
                        sb.append(c)
                    }
                }
                return sb.toString()
            }

            private fun parseSingleQuoted(): String {
                consume()
                val sb = StringBuilder()
                while (pos < text.length) {
                    val c = consume()
                    if (c == '\'') break
                    if (c == '\\' && pos < text.length) {
                        val esc = consume()
                        when (esc) {
                            'a' -> sb.append('\u0007')
                            'b' -> sb.append('\b')
                            'f' -> sb.append('\u000C')
                            'n' -> sb.append('\n')
                            'r' -> sb.append('\r')
                            't' -> sb.append('\t')
                            'v' -> sb.append('\u000B')
                            else -> sb.append(esc)
                        }
                    } else {
                        sb.append(c)
                    }
                }
                return sb.toString()
            }

            private fun parseSizedString(): LLSDNode {
                consume()
                skipWs()
                if (peek() == '(') {
                    consume()
                    val lenStr = StringBuilder()
                    while (pos < text.length && peek().isDigit()) lenStr.append(consume())
                    if (peek() == ')') consume()
                    val len = lenStr.toString().toIntOrNull() ?: 0
                    skipWs()
                    val quote = consume()
                    val start = pos
                    pos = (start + len).coerceAtMost(text.length)
                    val str = text.substring(start, pos)
                    if (pos < text.length && peek() == quote) consume()
                    return LLSDString(str)
                } else {
                    return LLSDString(parseQuotedAfterTag())
                }
            }

            private fun parseBinaryNotation(): LLSDNode {
                consume()
                if (text.startsWith("64", pos)) {
                    pos += 2
                    val str = parseQuotedAfterTag()
                    val bytes = try { android.util.Base64.decode(str, android.util.Base64.DEFAULT) } catch (_: Exception) { ByteArray(0) }
                    return LLSDBinary(bytes)
                }
                if (text.startsWith("16", pos)) {
                    pos += 2
                    val str = parseQuotedAfterTag()
                    val bytes = hexDecode(str)
                    return LLSDBinary(bytes)
                }
                skipWs()
                if (peek() == '(') {
                    consume()
                    val lenStr = StringBuilder()
                    while (pos < text.length && peek().isDigit()) lenStr.append(consume())
                    if (peek() == ')') consume()
                    val len = lenStr.toString().toIntOrNull() ?: 0
                    skipWs()
                    val quote = consume()
                    val bytes = ByteArray(len)
                    var count = 0
                    while (pos < text.length && count < len) {
                        val c = consume()
                        if (c == quote) break
                        bytes[count++] = c.code.toByte()
                    }
                    return LLSDBinary(bytes)
                }
                return LLSDBinary(ByteArray(0))
            }

            private fun hexDecode(hex: String): ByteArray {
                val clean = hex.replace(" ", "")
                val len = clean.length / 2
                val bytes = ByteArray(len)
                for (i in 0 until len) {
                    bytes[i] = clean.substring(i * 2, i * 2 + 2).toInt(16).toByte()
                }
                return bytes
            }

            private fun parseMap(): LLSDNode {
                consume()
                val map = HashMap<String, LLSDNode>()
                skipWs()
                while (pos < text.length && peek() != '}') {
                    val key = parseQuotedAfterTag().ifEmpty { parseNumberWord() }
                    skipWs()
                    if (peek() == ':' || peek() == '=') consume()
                    skipWs()
                    map[key] = parseValue()
                    skipWs()
                    if (peek() == ',') consume()
                    skipWs()
                }
                if (pos < text.length && peek() == '}') consume()
                return LLSDMap(map)
            }

            private fun parseArray(): LLSDNode {
                consume()
                val arr = LLSDArray()
                skipWs()
                while (pos < text.length && peek() != ']') {
                    arr.add(parseValue())
                    skipWs()
                    if (peek() == ',') consume()
                    skipWs()
                }
                if (pos < text.length && peek() == ']') consume()
                return arr
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
                        73 -> return LLSDLong(dataInputStream.readLong())
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
                                val keyTag = dataInputStream.readByte().toInt()
                                if (keyTag != 107 && keyTag != 115) {
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
