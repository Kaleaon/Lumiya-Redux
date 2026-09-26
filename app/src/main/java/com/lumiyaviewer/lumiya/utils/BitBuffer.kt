package com.lumiyaviewer.lumiya.utils

import java.nio.ByteBuffer
import java.util.Arrays

/** Reads most-significant-bit-first values from a byte array. */
class BitBuffer(bytes: ByteArray) {
    private val buffer = ByteBuffer.wrap(bytes)
    private val output = ByteArray(Int.SIZE_BYTES)
    private var bytePos = 0
    private var bitPos = 0

    fun getBits(count: Int): Int {
        Arrays.fill(output, 0)
        var outputBitPos = 0
        var outputBytePos = 0
        var bitsRemaining = count

        while (bitsRemaining > 0) {
            val remainingAfterByte = if (bitsRemaining > BITS_PER_BYTE) {
                bitsRemaining - BITS_PER_BYTE
            } else {
                0
            }
            bitsRemaining = minOf(bitsRemaining, BITS_PER_BYTE)

            while (bitsRemaining > 0) {
                output[outputBytePos] = (output[outputBytePos].toInt() shl 1).toByte()
                if (buffer[bytePos].toInt() and (0x80 shr bitPos) != 0) {
                    output[outputBytePos] = (output[outputBytePos].toInt() or 1).toByte()
                }
                bitPos++
                bitsRemaining--
                outputBitPos++
                if (bitPos >= BITS_PER_BYTE) {
                    bitPos = 0
                    bytePos++
                }
                if (outputBitPos >= BITS_PER_BYTE) {
                    outputBytePos++
                    outputBitPos = 0
                }
            }
            bitsRemaining = remainingAfterByte
        }

        return (output[0].toInt() and 0xff) or
            (output[1].toInt() shl 8 and 0xff00) or
            (output[2].toInt() shl 16 and 0xff0000) or
            (output[3].toInt() shl 24)
    }

    fun getFloat(): Float = Float.fromBits(getBits(Int.SIZE_BITS))

    val isEOF: Boolean
        get() = bytePos >= buffer.limit()

    private companion object {
        const val BITS_PER_BYTE = 8
    }
}
