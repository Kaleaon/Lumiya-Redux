package com.lumiyaviewer.lumiya.utils

import com.google.common.logging.nano.Vr
import com.lumiyaviewer.lumiya.slproto.SLMessage

class SimpleStringParser(private val string: String, private val spaceChars: String) {
    private var curPos = 0

    class StringParsingException(message: String) : Exception(message)

    fun endOfString(): Boolean = curPos >= string.length

    @Throws(StringParsingException::class)
    fun expectToken(expected: String, delimiters: String): SimpleStringParser {
        val token = nextToken(delimiters)
        if (token == expected) return this
        throw StringParsingException("Expected '$expected', got '$token'")
    }

    @Throws(StringParsingException::class)
    fun getHexToken(delimiters: String): Int {
        val token = nextToken(delimiters)
        try {
            return Integer.parseInt(token, 16)
        } catch (e: NumberFormatException) {
            val ex = StringParsingException("Cannot parse expected integer: $token")
            ex.initCause(e)
            throw ex
        }
    }

    @Throws(StringParsingException::class)
    fun getIntToken(delimiters: String): Int {
        val token = nextToken(delimiters)
        try {
            return Integer.parseInt(token)
        } catch (e: NumberFormatException) {
            val ex = StringParsingException("Cannot parse expected integer: $token")
            ex.initCause(e)
            throw ex
        }
    }

    @Throws(StringParsingException::class)
    fun getPipeTerminatedString(delimiters: String): String {
        val token = nextToken(delimiters)
        val lastIndex = token.lastIndexOf(Vr.VREvent.VrCore.ErrorCode.CONTROLLER_GATT_NOTIFY_FAILED)
        return if (lastIndex >= 0) token.substring(0, lastIndex) else token
    }

    @Throws(StringParsingException::class)
    fun getSubstring(length: Int): String {
        val bytes = SLMessage.stringToVariableUTF(string.substring(curPos))
        if (bytes.size < length) {
            throw StringParsingException("End of string reached: wanted $length, still has ${bytes.size}")
        }
        val result = ByteArray(length)
        System.arraycopy(bytes, 0, result, 0, length)
        val resultStr = SLMessage.stringFromVariableUTF(result)
        curPos += resultStr.length
        return resultStr
    }

    @Throws(StringParsingException::class)
    fun nextToken(delimiters: String): String {
        if (curPos >= string.length) {
            throw StringParsingException("End of string reached")
        }
        while (curPos < string.length && spaceChars.indexOf(string[curPos]) >= 0) {
            curPos++
        }
        var count = 0
        while (curPos < string.length && delimiters.indexOf(string[curPos]) < 0) {
            count++
            curPos++
        }
        return string.substring(curPos - count, curPos)
    }

    fun skipAllDelimiters(delimiters: String) {
        while (curPos < string.length && delimiters.indexOf(string[curPos]) >= 0) {
            curPos++
        }
    }

    fun skipOneDelimiter(delimiters: String) {
        if (curPos < string.length && delimiters.indexOf(string[curPos]) >= 0) {
            curPos++
        }
    }
}
