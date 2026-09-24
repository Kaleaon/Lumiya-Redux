package com.lumiyaviewer.lumiya.ui.render.filament;

import static org.junit.Assert.assertTrue;

import android.os.Debug;
import android.os.SystemClock;
import androidx.test.core.app.ActivityScenario;
import androidx.test.ext.junit.runners.AndroidJUnit4;
import java.util.concurrent.atomic.AtomicInteger;
import org.junit.Test;
import org.junit.runner.RunWith;

/**
 * Stage F0 exit check (P4-ENGINE-01): the Filament world view opens, renders
 * and closes 100 times without native memory drift. Runs on a device or
 * emulator: ./gradlew :app:connectedDebugAndroidTest
 */
@RunWith(AndroidJUnit4.class)
public class FilamentWorldLifecycleTest {
    private static final int CYCLES = 100;
    /** Allowed growth of the native heap after warm-up. */
    private static final long MAX_DRIFT_BYTES = 8L * 1024 * 1024;

    private static void openRenderClose() {
        try (ActivityScenario<FilamentWorldActivity> scenario = ActivityScenario.launch(FilamentWorldActivity.class)) {
            AtomicInteger frames = new AtomicInteger();
            long deadline = SystemClock.uptimeMillis() + 5000;
            while (frames.get() < 3 && SystemClock.uptimeMillis() < deadline) {
                scenario.onActivity(activity -> {
                    FilamentWorldRenderer renderer = activity.getRenderer();
                    frames.set(renderer != null ? renderer.getFramesRendered().get() : 0);
                });
                SystemClock.sleep(50);
            }
            assertTrue("no frames rendered", frames.get() >= 3);
        }
    }

    private static long nativeHeapAfterGc() {
        for (int i = 0; i < 3; i++) {
            Runtime.getRuntime().gc();
            System.runFinalization();
        }
        return Debug.getNativeHeapAllocatedSize();
    }

    @Test
    public void openAndClose100TimesWithoutNativeDrift() {
        // Warm-up: first-use allocations (driver, shader caches) are not leaks.
        for (int i = 0; i < 5; i++) {
            openRenderClose();
        }
        long before = nativeHeapAfterGc();
        for (int i = 0; i < CYCLES; i++) {
            openRenderClose();
        }
        long drift = nativeHeapAfterGc() - before;
        assertTrue("native heap grew by " + drift + " bytes over " + CYCLES + " cycles", drift < MAX_DRIFT_BYTES);
    }
}
