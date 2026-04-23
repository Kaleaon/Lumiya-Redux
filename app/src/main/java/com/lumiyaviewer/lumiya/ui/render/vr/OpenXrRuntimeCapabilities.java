package com.lumiyaviewer.lumiya.ui.render.vr;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
import android.provider.Settings;
import android.text.TextUtils;
import androidx.annotation.NonNull;
import com.lumiyaviewer.lumiya.Debug;

final class OpenXrRuntimeCapabilities {
    static final String PREF_OPENXR_ENABLED = "pref_vr_openxr_enabled";
    static final String PREF_OPENXR_STAGE = "pref_vr_openxr_stage";
    static final String PREF_OPENXR_ROLLOUT_PERCENT = "pref_vr_openxr_rollout_percent";
    static final String PREF_OPENXR_FORCE_ENABLE = "pref_vr_openxr_force_enable";
    static final String STAGE_DISABLED = "disabled";
    static final String STAGE_DOGFOOD = "dogfood";
    static final String STAGE_BETA = "beta";
    static final String STAGE_GENERAL = "general";

    private OpenXrRuntimeCapabilities() {
    }

    static boolean shouldUseOpenXr(@NonNull Context context, @NonNull SharedPreferences preferences) {
        if (!preferences.getBoolean(PREF_OPENXR_ENABLED, false)) {
            Debug.Printf("VR metrics: OpenXR disabled by feature flag", new Object[0]);
            return false;
        }

        String stage = preferences.getString(PREF_OPENXR_STAGE, STAGE_DISABLED);
        int rolloutPercent = normalizePercent(preferences.getInt(PREF_OPENXR_ROLLOUT_PERCENT, 0));
        boolean forceEnable = preferences.getBoolean(PREF_OPENXR_FORCE_ENABLE, false);

        if (!forceEnable && STAGE_DISABLED.equals(stage)) {
            Debug.Printf("VR metrics: OpenXR stage is disabled, fallback to cardboard", new Object[0]);
            return false;
        }

        if (!isEligibleForStage(context, stage, rolloutPercent, forceEnable)) {
            Debug.Printf("VR metrics: OpenXR staged rollout filtered this device (stage=%s, percent=%d)", stage, Integer.valueOf(rolloutPercent));
            return false;
        }

        if (!isRuntimeCapable(context)) {
            Debug.Printf("VR metrics: OpenXR capability probe failed, fallback to cardboard", new Object[0]);
            return false;
        }

        return true;
    }

    private static boolean isRuntimeCapable(Context context) {
        boolean supportsVrMode = Build.VERSION.SDK_INT >= 24;
        boolean hasVrHighPerformance = context.getPackageManager().hasSystemFeature("android.hardware.vr.high_performance");
        return supportsVrMode || hasVrHighPerformance;
    }

    private static boolean isEligibleForStage(Context context, String stage, int rolloutPercent, boolean forceEnable) {
        if (forceEnable || STAGE_GENERAL.equals(stage)) {
            return true;
        }
        int effectiveRollout = rolloutPercent;
        if (STAGE_DOGFOOD.equals(stage)) {
            effectiveRollout = Math.max(1, Math.min(effectiveRollout, 10));
        } else if (STAGE_BETA.equals(stage)) {
            effectiveRollout = Math.max(1, Math.min(effectiveRollout, 50));
        }
        return deviceBucket(context) < effectiveRollout;
    }

    private static int normalizePercent(int rawPercent) {
        if (rawPercent < 0) {
            return 0;
        }
        return Math.min(rawPercent, 100);
    }

    private static int deviceBucket(Context context) {
        String androidId = Settings.Secure.getString(context.getContentResolver(), Settings.Secure.ANDROID_ID);
        if (TextUtils.isEmpty(androidId)) {
            return 100;
        }
        return Math.abs(androidId.hashCode()) % 100;
    }
}
