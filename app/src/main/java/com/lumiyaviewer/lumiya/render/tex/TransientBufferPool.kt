package com.lumiyaviewer.lumiya.render.tex

import java.util.concurrent.ConcurrentLinkedQueue

/**
 * Transient memory pool providing zero-allocation byte buffers for ASTC block transcoding
 * and DXT block decompression operations. Prevents mobile heap allocation spikes and GC pauses.
 */
object TransientBufferPool {

    private const val DEFAULT_BLOCK_TEXEL_BUFFER_SIZE = 16 * 4 // 16 texels * 4 RGBA bytes = 64 bytes
    private const val DEFAULT_6X6_TEXEL_BUFFER_SIZE = 36 * 4  // 36 texels * 4 RGBA bytes = 144 bytes

    private val pool4x4 = ConcurrentLinkedQueue<ByteArray>()
    private val pool6x6 = ConcurrentLinkedQueue<ByteArray>()

    private val threadLocalBuffer4x4 = ThreadLocal.withInitial { ByteArray(DEFAULT_BLOCK_TEXEL_BUFFER_SIZE) }
    private val threadLocalBuffer6x6 = ThreadLocal.withInitial { ByteArray(DEFAULT_6X6_TEXEL_BUFFER_SIZE) }

    fun obtain4x4TexelBuffer(): ByteArray {
        return pool4x4.poll() ?: ByteArray(DEFAULT_BLOCK_TEXEL_BUFFER_SIZE)
    }

    fun release4x4TexelBuffer(buffer: ByteArray) {
        if (buffer.size == DEFAULT_BLOCK_TEXEL_BUFFER_SIZE && pool4x4.size < 256) {
            pool4x4.offer(buffer)
        }
    }

    fun obtain6x6TexelBuffer(): ByteArray {
        return pool6x6.poll() ?: ByteArray(DEFAULT_6X6_TEXEL_BUFFER_SIZE)
    }

    fun release6x6TexelBuffer(buffer: ByteArray) {
        if (buffer.size == DEFAULT_6X6_TEXEL_BUFFER_SIZE && pool6x6.size < 256) {
            pool6x6.offer(buffer)
        }
    }

    fun getThreadLocal4x4TexelBuffer(): ByteArray {
        return threadLocalBuffer4x4.get()
    }

    fun getThreadLocal6x6TexelBuffer(): ByteArray {
        return threadLocalBuffer6x6.get()
    }

    fun clearPools() {
        pool4x4.clear()
        pool6x6.clear()
    }
}
