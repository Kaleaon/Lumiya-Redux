package com.lumiyaviewer.lumiya.render.gltf

import java.nio.ByteBuffer
import java.nio.ByteOrder

/** Strict structural validation for a binary glTF 2.0 container. */
object GlbContainer {
    const val MAGIC = 0x46546C67
    const val VERSION = 2
    const val JSON_CHUNK = 0x4E4F534A
    const val BIN_CHUNK = 0x004E4942
    private const val HEADER_BYTES = 12
    private const val CHUNK_HEADER_BYTES = 8

    data class Chunk(val type: Int, val offset: Int, val length: Int)

    /**
     * Validates [source] without changing its position and returns its chunks.
     * Filament receives only containers accepted here, producing useful errors
     * for truncated CDN/cache responses instead of a native parser failure.
     */
    @JvmStatic
    fun inspect(source: ByteBuffer): List<Chunk> {
        val data = source.duplicate().order(ByteOrder.LITTLE_ENDIAN)
        val start = data.position()
        val available = data.remaining()
        require(available >= HEADER_BYTES) { "GLB header is truncated: $available bytes" }
        require(data.int == MAGIC) { "Not a GLB container" }
        require(data.int == VERSION) { "Only glTF 2.0 GLB containers are supported" }
        val declaredLength = data.int.toLong() and 0xffffffffL
        require(declaredLength == available.toLong()) {
            "GLB length is $declaredLength but buffer contains $available bytes"
        }

        val chunks = ArrayList<Chunk>(2)
        while (data.hasRemaining()) {
            require(data.remaining() >= CHUNK_HEADER_BYTES) { "GLB chunk header is truncated" }
            val length = data.int.toLong() and 0xffffffffL
            val type = data.int
            require(length <= data.remaining().toLong()) { "GLB chunk exceeds container length" }
            require(length % 4L == 0L) { "GLB chunks must be 4-byte aligned" }
            chunks += Chunk(type, data.position() - start, length.toInt())
            data.position(data.position() + length.toInt())
        }
        require(chunks.isNotEmpty() && chunks.first().type == JSON_CHUNK) {
            "The first GLB chunk must contain JSON"
        }
        require(chunks.count { it.type == JSON_CHUNK } == 1) { "GLB must contain exactly one JSON chunk" }
        require(chunks.count { it.type == BIN_CHUNK } <= 1) { "GLB may contain at most one BIN chunk" }
        return chunks
    }

    /** Copies the remaining bytes into native-order direct storage for gltfio. */
    @JvmStatic
    fun directCopy(source: ByteBuffer): ByteBuffer {
        inspect(source)
        val input = source.duplicate()
        return ByteBuffer.allocateDirect(input.remaining()).order(ByteOrder.nativeOrder()).apply {
            put(input)
            flip()
        }
    }
}
