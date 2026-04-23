package com.lumiyaviewer.lumiya.ui.render.vr;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.ui.render.VrIntentContract;

public final class VrRuntimeSelector {
    public static final String EXTRA_RUNTIME_ID = "com.lumiyaviewer.lumiya.ui.render.vr.RUNTIME_ID";
    private static final String PREF_VR_RUNTIME = "pref_vr_runtime";

    private VrRuntimeSelector() {
    }

    public static VrRuntime selectRuntime(Context context, Intent intent) {
        SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(context);
        String requestedId = intent != null ? intent.getStringExtra(EXTRA_RUNTIME_ID) : null;
        if (requestedId == null && intent != null) {
            String requestedMode = VrIntentContract.sanitizeRuntime(intent.getStringExtra(VrIntentContract.EXTRA_VR_RUNTIME));
            if (VrIntentContract.VR_RUNTIME_OPENXR.equals(requestedMode) || VrIntentContract.VR_RUNTIME_CARDBOARD.equals(requestedMode)) {
                requestedId = requestedMode;
            }
        }
        if (requestedId == null) {
            requestedId = preferences.getString(PREF_VR_RUNTIME, CardboardRuntime.ID);
        }

        boolean openXrAllowed = OpenXrRuntimeCapabilities.shouldUseOpenXr(context, preferences);
        if ((OpenXrRuntime.ID.equalsIgnoreCase(requestedId) || VrIntentContract.VR_RUNTIME_AUTO.equalsIgnoreCase(requestedId)) && openXrAllowed) {
            Debug.Printf("VR metrics: selected runtime=%s", OpenXrRuntime.ID);
            return new OpenXrRuntime();
        }

        if (OpenXrRuntime.ID.equalsIgnoreCase(requestedId) && !openXrAllowed) {
            Debug.Printf("VR metrics: OpenXR requested but unavailable, falling back to cardboard.", new Object[0]);
        }
        Debug.Printf("VR metrics: selected runtime=%s", CardboardRuntime.ID);
        return new CardboardRuntime();
    }

    public static void putRuntime(Intent intent, String runtimeId) {
        intent.putExtra(EXTRA_RUNTIME_ID, runtimeId);
    }
}
