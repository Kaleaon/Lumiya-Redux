package com.lumiyaviewer.lumiya.slproto

import com.lumiyaviewer.rawbuffers.DirectByteBuffer
import java.nio.ByteBuffer

object ZeroDecoder {

    /**
     * Decompresses zero-coded bytes from [src] buffer into [dest] buffer in-memory using pure Kotlin/Java.
     * Returns the number of bytes written to [dest].
     */
    @JvmStatic
    fun decode(dest: ByteBuffer, src: ByteBuffer): Int {
        val destWritten = DirectByteBuffer.zeroDecode(
            dest.array(),
            dest.arrayOffset() + dest.position(),
            dest.capacity() - dest.position(),
            src.array(),
            src.arrayOffset() + src.position(),
            src.remaining()
        )
        dest.position(dest.position() + destWritten)
        return destWritten
    }

    /**
     * Decodes zero-coded byte array into uncompressed byte array.
     */
    @JvmStatic
    fun decodeByteArray(src: ByteArray, srcOffset: Int = 0, length: Int = src.size - srcOffset, maxDestSize: Int = 65536): ByteArray {
        val dest = ByteArray(maxDestSize)
        val written = DirectByteBuffer.zeroDecode(dest, 0, maxDestSize, src, srcOffset, length)
        return dest.copyOf(written)
    }
}
