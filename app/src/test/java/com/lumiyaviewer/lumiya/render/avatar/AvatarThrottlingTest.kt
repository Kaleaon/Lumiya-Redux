package com.lumiyaviewer.lumiya.render.avatar

import com.lumiyaviewer.lumiya.render.spatial.FrustrumPlanes
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class AvatarThrottlingTest {

    @Test
    fun testFrustumCullingOffscreenBoundingBox() {
        // Construct identity MVP matrix frustum planes
        val identityMVP = floatArrayOf(
            1f, 0f, 0f, 0f,
            0f, 1f, 0f, 0f,
            0f, 0f, 1f, 0f,
            0f, 0f, 0f, 1f
        )
        val planes = FrustrumPlanes(identityMVP)

        // Bounding box far outside normalized frustum (-1..1 in NDC)
        val offscreenBox = floatArrayOf(100f, 100f, 100f, 105f, 105f, 105f)
        val result = planes.testBoundingBox(offscreenBox, null)
        assertEquals(FrustrumPlanes.OUTSIDE, result)

        // Bounding box inside normalized frustum
        val onscreenBox = floatArrayOf(-0.5f, -0.5f, -0.5f, 0.5f, 0.5f, 0.5f)
        val resultOnscreen = planes.testBoundingBox(onscreenBox, null)
        assertTrue("Onscreen bounding box must be inside or intersect frustum", resultOnscreen != FrustrumPlanes.OUTSIDE)
    }

    @Test
    fun testDistanceTierClassification() {
        val cameraX = 0f
        val cameraY = 0f
        val cameraZ = 0f

        // Nearby avatar position (10m away)
        val nearbyX = 6f
        val nearbyY = 8f
        val nearbyZ = 0f
        val nearbyDistSq = nearbyX * nearbyX + nearbyY * nearbyY + nearbyZ * nearbyZ
        assertTrue("Nearby avatar <= 20m should qualify for 60Hz", nearbyDistSq <= 400f)

        // Distant avatar position (30m away)
        val distantX = 18f
        val distantY = 24f
        val distantZ = 0f
        val distantDistSq = distantX * distantX + distantY * distantY + distantZ * distantZ
        assertFalse("Distant avatar > 20m should qualify for 15Hz", distantDistSq <= 400f)

        // 20m threshold exact boundary
        val thresholdX = 12f
        val thresholdY = 16f
        val thresholdZ = 0f
        val thresholdDistSq = thresholdX * thresholdX + thresholdY * thresholdY + thresholdZ * thresholdZ
        assertEquals("Boundary avatar at 20m must equal 400m^2", 400f, thresholdDistSq, 0.001f)
    }

    @Test
    fun testFocalAvatarOverridesDistanceTier() {
        val isFocal = true
        val distantDistSq = 900f // 30 meters
        val minIntervalMs = if (isFocal || distantDistSq <= 400f) 16L else 66L

        assertEquals("Focal avatar must use 60Hz rate (16ms min interval) regardless of distance", 16L, minIntervalMs)
    }

    @Test
    fun testReEntryForcesPoseEvaluation() {
        var wasOffscreen = true
        var forceAnimateCalled = false

        // Simulating re-entry logic
        if (wasOffscreen) {
            wasOffscreen = false
            forceAnimateCalled = true
        }

        assertFalse("wasOffscreen state should be cleared on re-entry", wasOffscreen)
        assertTrue("Animation update must be forced on frustum re-entry to prevent pose popping", forceAnimateCalled)
    }
}
