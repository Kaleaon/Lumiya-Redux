package com.lumiyaviewer.lumiya.render.tex

import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

class MobileTextureManagerTest {

    private val manager = MobileTextureManager.instance

    @Before
    fun setUp() {
        manager.clearAll()
    }

    @Test
    fun testCameraDistanceLodSelection() {
        assertEquals(0, MobileTextureManager.getLodForDistance(5.0f))
        assertEquals(1, MobileTextureManager.getLodForDistance(20.0f))
        assertEquals(2, MobileTextureManager.getLodForDistance(50.0f))

        assertEquals(AstcTranscoder.TargetAstcFormat.ASTC_4x4, MobileTextureManager.getAstcFormatForDistance(8.0f))
        assertEquals(AstcTranscoder.TargetAstcFormat.ASTC_4x4, MobileTextureManager.getAstcFormatForDistance(25.0f))
        assertEquals(AstcTranscoder.TargetAstcFormat.ASTC_6x6, MobileTextureManager.getAstcFormatForDistance(40.0f))
    }

    @Test
    fun testVramBudgetTrackingAndLruEviction() {
        val texSize = 100L * 1024L * 1024L // 100 MB each

        manager.registerTexture("tex_close", 1024, 1024, texSize, 5.0f, AstcTranscoder.TargetAstcFormat.ASTC_4x4)
        manager.registerTexture("tex_mid", 1024, 1024, texSize, 20.0f, AstcTranscoder.TargetAstcFormat.ASTC_4x4)
        manager.registerTexture("tex_far1", 1024, 1024, texSize, 45.0f, AstcTranscoder.TargetAstcFormat.ASTC_6x6)

        // 300MB registered, <= 384MB active VRAM target limit
        assertEquals(300L * 1024L * 1024L, manager.getActiveVramUsageBytes())
        assertEquals(3, manager.getTrackedTextureCount())

        // Add 4th texture (100MB) -> total 400MB > 384MB -> triggers LRU eviction of farthest texture ("tex_far1")
        manager.registerTexture("tex_far2", 1024, 1024, texSize, 60.0f, AstcTranscoder.TargetAstcFormat.ASTC_6x6)

        assertTrue("VRAM usage should stay under active limit 384MB", manager.getActiveVramUsageBytes() <= MobileTextureManager.VRAM_TARGET_LIMIT_BYTES)
    }
}
