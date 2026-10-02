package com.lumiyaviewer.lumiya.render.tex

import com.lumiyaviewer.lumiya.render.TextureMemoryTracker
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.atomic.AtomicLong

/**
 * Mobile Texture Manager and VRAM Budget Manager.
 *
 * Hard ceiling: 512 MB (536,870,912 bytes)
 * Active GPU footprint limit: 384 MB (402,653,184 bytes)
 * Least Recently Used (LRU) distant texture eviction when active VRAM exceeds 384MB.
 * Camera distance LOD selector (<10m full LOD 0, 10-35m mid LOD 1, >35m low LOD 2).
 */
class MobileTextureManager {

    data class TextureMetadata(
        val textureId: String,
        val width: Int,
        val height: Int,
        val sizeBytes: Long,
        var cameraDistanceMeters: Float,
        var lastAccessedTimestamp: Long = System.currentTimeMillis(),
        val astcFormat: AstcTranscoder.TargetAstcFormat
    )

    companion object {
        const val VRAM_HARD_CEILING_BYTES = 512L * 1024L * 1024L // 512 MB
        const val VRAM_TARGET_LIMIT_BYTES = 384L * 1024L * 1024L // 384 MB

        const val DISTANCE_LOD0_THRESHOLD_METERS = 10.0f
        const val DISTANCE_LOD1_THRESHOLD_METERS = 35.0f

        @JvmStatic
        val instance = MobileTextureManager()

        fun getLodForDistance(distanceMeters: Float): Int {
            return when {
                distanceMeters < DISTANCE_LOD0_THRESHOLD_METERS -> 0
                distanceMeters <= DISTANCE_LOD1_THRESHOLD_METERS -> 1
                else -> 2
            }
        }

        fun getAstcFormatForDistance(distanceMeters: Float): AstcTranscoder.TargetAstcFormat {
            return if (distanceMeters > DISTANCE_LOD1_THRESHOLD_METERS) {
                AstcTranscoder.TargetAstcFormat.ASTC_6x6
            } else {
                AstcTranscoder.TargetAstcFormat.ASTC_4x4
            }
        }
    }

    private val trackedTextures = ConcurrentHashMap<String, TextureMetadata>()
    private val activeVramBytes = AtomicLong(0L)

    init {
        TextureMemoryTracker.setMemoryLimit(VRAM_HARD_CEILING_BYTES.toInt())
    }

    fun registerTexture(
        textureId: String,
        width: Int,
        height: Int,
        sizeBytes: Long,
        cameraDistanceMeters: Float,
        astcFormat: AstcTranscoder.TargetAstcFormat
    ) {
        val meta = TextureMetadata(
            textureId = textureId,
            width = width,
            height = height,
            sizeBytes = sizeBytes,
            cameraDistanceMeters = cameraDistanceMeters,
            lastAccessedTimestamp = System.currentTimeMillis(),
            astcFormat = astcFormat
        )

        val old = trackedTextures.put(textureId, meta)
        if (old != null) {
            activeVramBytes.addAndGet(-old.sizeBytes)
            TextureMemoryTracker.releaseTextureMemory(old.sizeBytes.toInt())
        }

        activeVramBytes.addAndGet(sizeBytes)
        TextureMemoryTracker.allocTextureMemory(sizeBytes.toInt())

        if (activeVramBytes.get() > VRAM_TARGET_LIMIT_BYTES) {
            evictLruTextures()
        }
    }

    fun updateTextureDistance(textureId: String, cameraDistanceMeters: Float) {
        trackedTextures[textureId]?.let {
            it.cameraDistanceMeters = cameraDistanceMeters
            it.lastAccessedTimestamp = System.currentTimeMillis()
        }
    }

    fun unregisterTexture(textureId: String) {
        trackedTextures.remove(textureId)?.let { old ->
            activeVramBytes.addAndGet(-old.sizeBytes)
            TextureMemoryTracker.releaseTextureMemory(old.sizeBytes.toInt())
        }
    }

    fun evictLruTextures() {
        if (activeVramBytes.get() <= VRAM_TARGET_LIMIT_BYTES) return

        val candidateList = trackedTextures.values.sortedWith(
            compareByDescending<TextureMetadata> { it.cameraDistanceMeters }
                .thenBy { it.lastAccessedTimestamp }
        )

        for (meta in candidateList) {
            if (activeVramBytes.get() <= VRAM_TARGET_LIMIT_BYTES) break

            unregisterTexture(meta.textureId)
        }
    }

    fun getActiveVramUsageBytes(): Long {
        return activeVramBytes.get()
    }

    fun getTrackedTextureCount(): Int {
        return trackedTextures.size
    }

    fun clearAll() {
        trackedTextures.clear()
        activeVramBytes.set(0L)
        TextureMemoryTracker.releaseAllGLMemory()
    }
}
