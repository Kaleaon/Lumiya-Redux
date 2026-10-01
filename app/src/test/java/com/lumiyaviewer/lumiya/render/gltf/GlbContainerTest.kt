package com.lumiyaviewer.lumiya.render.gltf

import java.nio.ByteBuffer
import java.nio.ByteOrder
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class GlbContainerTest {
    private fun glb(json: String = "{}"): ByteBuffer {
        val padded = json.padEnd((json.length + 3) and -4, ' ').toByteArray()
        return ByteBuffer.allocate(20 + padded.size).order(ByteOrder.LITTLE_ENDIAN).apply {
            putInt(GlbContainer.MAGIC)
            putInt(GlbContainer.VERSION)
            putInt(capacity())
            putInt(padded.size)
            putInt(GlbContainer.JSON_CHUNK)
            put(padded)
            flip()
        }
    }

    @Test fun acceptsGlb2AndPreservesCallerPosition() {
        val payload = glb("{\"asset\":{\"version\":\"2.0\"}}")
        val position = payload.position()
        val chunks = GlbContainer.inspect(payload)
        assertEquals(position, payload.position())
        assertEquals(1, chunks.size)
        assertEquals(GlbContainer.JSON_CHUNK, chunks.single().type)
    }

    @Test fun directCopyIsIndependentAndDirect() {
        val payload = glb()
        val copy = GlbContainer.directCopy(payload)
        assertEquals(true, copy.isDirect)
        assertEquals(payload.remaining(), copy.remaining())
        payload.put(0, 0)
        assertEquals(GlbContainer.MAGIC, copy.order(ByteOrder.LITTLE_ENDIAN).int)
    }

    @Test fun rejectsTruncationAndFalseLength() {
        assertThrows(IllegalArgumentException::class.java) { GlbContainer.inspect(ByteBuffer.allocate(11)) }
        val payload = glb().apply { putInt(8, remaining() + 4) }
        assertThrows(IllegalArgumentException::class.java) { GlbContainer.inspect(payload) }
    }

    @Test fun rejectsNonJsonFirstChunk() {
        val payload = glb().apply { putInt(16, GlbContainer.BIN_CHUNK) }
        assertThrows(IllegalArgumentException::class.java) { GlbContainer.inspect(payload) }
    }
}
