package com.lumiyaviewer.lumiya.render.backend.filament;

import android.opengl.GLES20;
import android.os.Build;
import com.lumiyaviewer.lumiya.Debug;

/* loaded from: classes.dex */
public class FilamentBackendRuntime {
    private final FilamentTelemetry telemetry = new FilamentTelemetry();
    private final FilamentSceneUploadBridge sceneUploadBridge = new FilamentSceneUploadBridge();
    private final FilamentCameraSyncBridge cameraSyncBridge = new FilamentCameraSyncBridge();
    private boolean initialized = false;
    private int runtimeFrames = 0;

    public void initialize(boolean z, boolean z2) throws IllegalStateException {
        if (Build.VERSION.SDK_INT < 24) {
            throw new IllegalStateException("Filament backend requires Android 7.0+");
        }
        this.initialized = true;
        this.runtimeFrames = 0;
        this.telemetry.reportStartup("filament_experimental", true, z2, z);
        Debug.AlwaysPrintf("FilamentBridge: initialized (ANGLE requested=%b)", Boolean.valueOf(z));
    }

    public FilamentSceneUploadBridge getSceneUploadBridge() {
        return this.sceneUploadBridge;
    }

    public FilamentCameraSyncBridge getCameraSyncBridge() {
        return this.cameraSyncBridge;
    }

    public boolean isInitialized() {
        return this.initialized;
    }

    public void reportStartupFallback(boolean z) {
        this.initialized = false;
        this.telemetry.reportStartup("legacy_gles", true, true, z);
    }

    public void sampleRuntimeStability() {
        if (!this.initialized) {
            return;
        }
        this.runtimeFrames++;
        if (this.runtimeFrames % 300 == 0) {
            this.telemetry.reportRuntimeStability(this.runtimeFrames, GLES20.glGetError() == 0);
        }
    }
}
