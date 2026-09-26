package com.lumiyaviewer.lumiya.utils

import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.io.DataInput
import java.io.EOFException
import java.io.IOException
import java.io.InputStream

class LittleEndianDataInputStream(private val inputStream: InputStream) : DataInput {
    private val buf = ByteArray(8)

    @Throws(IOException::class)
    override fun readBoolean(): Boolean {
        val read = inputStream.read()
        if (read == -1) throw EOFException("End of stream")
        return read != 0
    }

    @Throws(IOException::class)
    override fun readByte(): Byte {
        val read = inputStream.read()
        if (read == -1) throw EOFException("End of stream")
        return (read and 0xFF).toByte()
    }

    @Throws(IOException::class)
    override fun readChar(): Char {
        val read = inputStream.read()
        if (read == -1) throw EOFException("End of stream")
        return (read and 0xFF).toChar()
    }

    @Throws(IOException::class)
    override fun readDouble(): Double = java.lang.Double.longBitsToDouble(readLong())

    @Throws(IOException::class)
    override fun readFloat(): Float = java.lang.Float.intBitsToFloat(readInt())

    @Throws(IOException::class)
    override fun readFully(bytes: ByteArray) {
        if (inputStream.read(bytes, 0, bytes.size) != bytes.size) {
            throw EOFException("End of stream")
        }
    }

    @Throws(IOException::class)
    override fun readFully(bytes: ByteArray, off: Int, len: Int) {
        if (inputStream.read(bytes, off, len) != len) {
            throw EOFException("End of stream")
        }
    }

    @Throws(IOException::class)
    override fun readInt(): Int {
        if (inputStream.read(buf, 0, 4) != 4) {
            throw EOFException("End of stream")
        }
        return (buf[3].toInt() shl 24) or
                ((buf[2].toInt() and 0xFF) shl 16) or
                ((buf[1].toInt() and 0xFF) shl 8) or
                (buf[0].toInt() and 0xFF)
    }

    @Throws(IOException::class)
    override fun readLine(): String {
        val sb = StringBuilder()
        while (true) {
            val ch = readChar()
            if (ch == '\n' || ch == '\r') break
            sb.append(ch)
        }
        return sb.toString()
    }

    @Throws(IOException::class)
    override fun readLong(): Long {
        if (inputStream.read(buf, 0, 8) != 8) {
            throw EOFException("End of stream")
        }
        return (buf[7].toLong() shl 56) or
                ((buf[6].toLong() and 0xFF) shl 48) or
                ((buf[5].toLong() and 0xFF) shl 40) or
                ((buf[4].toLong() and 0xFF) shl 32) or
                ((buf[3].toLong() and 0xFF) shl 24) or
                ((buf[2].toLong() and 0xFF) shl 16) or
                ((buf[1].toLong() and 0xFF) shl 8) or
                (buf[0].toLong() and 0xFF)
    }

    @Throws(IOException::class)
    override fun readShort(): Short {
        if (inputStream.read(buf, 0, 2) != 2) {
            throw EOFException("End of stream")
        }
        return (((buf[1].toInt() and 0xFF) shl 8) or (buf[0].toInt() and 0xFF)).toShort()
    }

    @Throws(IOException::class)
    override fun readUTF(): String = readLine()

    @Throws(IOException::class)
    override fun readUnsignedByte(): Int {
        val read = inputStream.read()
        if (read == -1) throw EOFException("End of stream")
        return read and 0xFF
    }

    @Throws(IOException::class)
    override fun readUnsignedShort(): Int {
        if (inputStream.read(buf, 0, 2) != 2) {
            throw EOFException("End of stream")
        }
        return ((buf[1].toInt() and 0xFF) shl 8) or (buf[0].toInt() and 0xFF)
    }

    @Throws(IOException::class)
    fun readVector3(): LLVector3 = LLVector3(readFloat(), readFloat(), readFloat())

    @Throws(IOException::class)
    fun readZeroTerminatedString(): String {
        val sb = StringBuilder()
        while (true) {
            val ch = readChar()
            if (ch == '\u0000') return sb.toString()
            sb.append(ch)
        }
    }

    @Throws(IOException::class)
    override fun skipBytes(n: Int): Int = inputStream.skip(n.toLong()).toInt()
}
