package com.lumiyaviewer.lumiya.render.backend.filament;

import com.lumiyaviewer.lumiya.Debug;

/* loaded from: classes.dex */
public class FilamentTelemetry {
    public void reportStartup(String str, boolean z, boolean z2, boolean z3) {
        Debug.AlwaysPrintf("Telemetry(RenderBackend): backend=%s startupOk=%b fallback=%b angleRequested=%b", str, Boolean.valueOf(z), Boolean.valueOf(z2), Boolean.valueOf(z3));
    }

    public void reportRuntimeStability(int i, boolean z) {
        Debug.AlwaysPrintf("Telemetry(RenderBackend): runtimeFrames=%d stable=%b", Integer.valueOf(i), Boolean.valueOf(z));
    }
}
