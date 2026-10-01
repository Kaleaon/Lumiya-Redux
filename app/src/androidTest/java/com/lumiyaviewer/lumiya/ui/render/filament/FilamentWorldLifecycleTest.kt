package com.lumiyaviewer.lumiya.ui.render.filament

import android.os.Debug
import android.os.SystemClock
import androidx.test.core.app.ActivityScenario
import androidx.test.ext.junit.runners.AndroidJUnit4
import java.util.concurrent.atomic.AtomicInteger
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith

/** Device lifecycle/leak gate for the Kotlin Filament and gltfio renderer. */
@RunWith(AndroidJUnit4::class)
class FilamentWorldLifecycleTest {
    private fun openRenderClose() {
        ActivityScenario.launch(FilamentWorldActivity::class.java).use { scenario ->
            val frames = AtomicInteger()
            val deadline = SystemClock.uptimeMillis() + 5_000
            while (frames.get() < 3 && SystemClock.uptimeMillis() < deadline) {
                scenario.onActivity { activity -> frames.set(activity.renderer?.framesRendered?.get() ?: 0) }
                SystemClock.sleep(50)
            }
            assertTrue("no frames rendered", frames.get() >= 3)
        }
    }

    private fun nativeHeapAfterGc(): Long {
        repeat(3) {
            Runtime.getRuntime().gc()
            System.runFinalization()
        }
        return Debug.getNativeHeapAllocatedSize()
    }

    @Test
    fun openAndClose100TimesWithoutNativeDrift() {
        repeat(5) { openRenderClose() }
        val before = nativeHeapAfterGc()
        repeat(CYCLES) { openRenderClose() }
        val drift = nativeHeapAfterGc() - before
        assertTrue("native heap grew by $drift bytes over $CYCLES cycles", drift < MAX_DRIFT_BYTES)
    }

    private companion object {
        const val CYCLES = 100
        const val MAX_DRIFT_BYTES = 8L * 1024 * 1024
    }
}
