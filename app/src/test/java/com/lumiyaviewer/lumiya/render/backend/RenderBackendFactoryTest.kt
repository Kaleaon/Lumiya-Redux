package com.lumiyaviewer.lumiya.render.backend

import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class RenderBackendFactoryTest {
    @Test
    fun stableRolloutUsesLegacyBackend() {
        assertFalse(RenderBackendFlags.ENABLE_EXPERIMENTAL_BACKEND)
        assertTrue(RenderBackendFactory.createBackend() is LegacyGlesBackend)
    }
}
