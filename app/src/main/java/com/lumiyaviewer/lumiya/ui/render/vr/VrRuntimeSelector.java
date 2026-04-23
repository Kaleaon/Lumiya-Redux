package com.lumiyaviewer.lumiya.ui.render.vr;

import android.content.Context;
import android.content.Intent;
import android.preference.PreferenceManager;
import com.lumiyaviewer.lumiya.Debug;

public final class VrRuntimeSelector {
    public static final String EXTRA_RUNTIME_ID = "com.lumiyaviewer.lumiya.ui.render.vr.RUNTIME_ID";
    private static final String PREF_VR_RUNTIME = "pref_vr_runtime";
    private static final String PREF_OPENXR_ENABLED = "pref_vr_openxr_enabled";

    private VrRuntimeSelector() {
    }

    public static VrRuntime selectRuntime(Context context, Intent intent) {
        String requestedId = intent != null ? intent.getStringExtra(EXTRA_RUNTIME_ID) : null;
        if (requestedId == null) {
            requestedId = PreferenceManager.getDefaultSharedPreferences(context).getString(PREF_VR_RUNTIME, CardboardRuntime.ID);
        }
        boolean openXrEnabled = PreferenceManager.getDefaultSharedPreferences(context).getBoolean(PREF_OPENXR_ENABLED, false);
        if (OpenXrRuntime.ID.equalsIgnoreCase(requestedId) && openXrEnabled) {
            Debug.Printf("VR metrics: selected runtime=%s", OpenXrRuntime.ID);
            return new OpenXrRuntime();
        }
        if (OpenXrRuntime.ID.equalsIgnoreCase(requestedId) && !openXrEnabled) {
            Debug.Printf("VR metrics: OpenXR requested but disabled by feature flag, falling back to cardboard.", new Object[0]);
        }
        Debug.Printf("VR metrics: selected runtime=%s", CardboardRuntime.ID);
        return new CardboardRuntime();
    }

    public static void putRuntime(Intent intent, String runtimeId) {
        intent.putExtra(EXTRA_RUNTIME_ID, runtimeId);
    }
}
