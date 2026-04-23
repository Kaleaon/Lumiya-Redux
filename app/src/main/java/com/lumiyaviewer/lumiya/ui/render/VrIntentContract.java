package com.lumiyaviewer.lumiya.ui.render;

import androidx.annotation.NonNull;

/* loaded from: classes.dex */
public final class VrIntentContract {
    public static final String ALIAS_VR_ACTIVITY_CLASS = "com.lumiyaviewer.lumiya.ui.render.VrActivity";
    public static final String ACTION_LEGACY_CARDBOARD_ENTRY = "com.lumiyaviewer.lumiya.ui.render.CardboardActivity";
    public static final String ACTION_VR_ENTRY = "com.lumiyaviewer.lumiya.ui.render.VrActivity";
    public static final String EXTRA_VR_RUNTIME = "com.lumiyaviewer.lumiya.ui.render.extra.VR_RUNTIME";
    public static final String VR_RUNTIME_AUTO = "auto";
    public static final String VR_RUNTIME_CARDBOARD = "cardboard";
    public static final String VR_RUNTIME_OPENXR = "openxr";

    private VrIntentContract() {
    }

    @NonNull
    public static String sanitizeRuntime(String str) {
        if (VR_RUNTIME_OPENXR.equals(str) || VR_RUNTIME_CARDBOARD.equals(str)) {
            return str;
        }
        return VR_RUNTIME_AUTO;
    }
}
