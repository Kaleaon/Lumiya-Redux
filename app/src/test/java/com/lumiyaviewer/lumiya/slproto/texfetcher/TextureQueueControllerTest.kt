package com.lumiyaviewer.lumiya.slproto.texfetcher

import com.lumiyaviewer.lumiya.slproto.modules.texfetcher.TextureQueueController
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class TextureQueueControllerTest {

    private class TestQueueController : TextureQueueController {
        private var paused = false
        var pauseCount = 0
        var resumeCount = 0

        override val isFetchingPaused: Boolean
            get() = paused

        override fun pauseFetching() {
            if (!paused) {
                paused = true
                pauseCount++
            }
        }

        override fun resumeFetching() {
            if (paused) {
                paused = false
                resumeCount++
            }
        }
    }

    @Test
    fun testInitialStateNotPaused() {
        val controller = TestQueueController()
        assertFalse(controller.isFetchingPaused)
    }

    @Test
    fun testPauseFetchingStateTransition() {
        val controller = TestQueueController()
        controller.pauseFetching()
        assertTrue(controller.isFetchingPaused)
        assertEquals(1, controller.pauseCount)
    }

    @Test
    fun testResumeFetchingStateTransition() {
        val controller = TestQueueController()
        controller.pauseFetching()
        assertTrue(controller.isFetchingPaused)

        controller.resumeFetching()
        assertFalse(controller.isFetchingPaused)
        assertEquals(1, controller.resumeCount)
    }

    @Test
    fun testIdempotentPauseAndResume() {
        val controller = TestQueueController()
        controller.pauseFetching()
        controller.pauseFetching()
        assertEquals(1, controller.pauseCount)

        controller.resumeFetching()
        controller.resumeFetching()
        assertEquals(1, controller.resumeCount)
    }
}
