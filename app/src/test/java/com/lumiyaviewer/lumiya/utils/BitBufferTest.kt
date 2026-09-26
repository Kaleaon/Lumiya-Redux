package com.lumiyaviewer.lumiya.utils

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class BitBufferTest {
    @Test
    fun readsAcrossByteBoundariesInOriginalBitOrder() {
        val buffer = BitBuffer(byteArrayOf(0b1011_0010.toByte(), 0b0110_1001))

        assertEquals(0b101, buffer.getBits(3))
        assertFalse(buffer.isEOF)
        assertEquals(0b10010, buffer.getBits(5))
        assertEquals(0b0110_1001, buffer.getBits(8))
        assertTrue(buffer.isEOF)
    }

    @Test
    fun returnsMultiByteValuesWithFirstByteInLeastSignificantBits() {
        val buffer = BitBuffer(byteArrayOf(0x12, 0x34, 0x56, 0x78))

        assertEquals(0x78563412, buffer.getBits(32))
    }

    @Test
    fun reconstructsFloatBits() {
        val bits = 1.5f.toRawBits()
        val buffer = BitBuffer(
            byteArrayOf(bits.toByte(), (bits ushr 8).toByte(), (bits ushr 16).toByte(), (bits ushr 24).toByte())
        )

        assertEquals(1.5f, buffer.getFloat(), 0.0f)
    }
}
