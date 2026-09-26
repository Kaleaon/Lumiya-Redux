package com.lumiyaviewer.lumiya.ui.render.vr

import android.content.Context
import android.content.SharedPreferences
import android.content.pm.PackageManager
import android.provider.Settings
import android.text.TextUtils
import com.lumiyaviewer.lumiya.Debug

internal class OpenXrRuntimeCapabilities {
    private static String OPENXR_RUNTIME_BROKER_AUTHORITY =
            "org.khronos.openxr.runtime_broker"
    private static String OPENXR_SYSTEM_RUNTIME_BROKER_AUTHORITY =
            "org.khronos.openxr.system_runtime_broker"
    static String PREF_OPENXR_ENABLED = "pref_vr_openxr_enabled"
    static String PREF_OPENXR_STAGE = "pref_vr_openxr_stage"
    static String PREF_OPENXR_ROLLOUT_PERCENT = "pref_vr_openxr_rollout_percent"
    static String PREF_OPENXR_FORCE_ENABLE = "pref_vr_openxr_force_enable"
    static String STAGE_DISABLED = "disabled"
    static String STAGE_DOGFOOD = "dogfood"
    static String STAGE_BETA = "beta"
    static String STAGE_GENERAL = "general"

    private constructor() {
    }

    @JvmStatic
    internal fun shouldUseOpenXr(context: Context, preferences: SharedPreferences): Boolean {
        if (!preferences.getBoolean(PREF_OPENXR_ENABLED, false)) {
            Debug.Printf("VR metrics: OpenXR disabled by feature flag", arrayOfNulls<Object>(0])
            return false
        }

        String stage = preferences.getString(PREF_OPENXR_STAGE, STAGE_DISABLED)
        int rolloutPercent = normalizePercent(preferences.getInt(PREF_OPENXR_ROLLOUT_PERCENT, 0))
        boolean forceEnable = preferences.getBoolean(PREF_OPENXR_FORCE_ENABLE, false)

        if (!forceEnable && STAGE_DISABLED == (stage)) {
            Debug.Printf("VR metrics: OpenXR stage is disabled, fallback to cardboard", arrayOfNulls<Object>(0])
            return false
        }

        if (!isEligibleForStage(context, stage, rolloutPercent, forceEnable)) {
            Debug.Printf("VR metrics: OpenXR staged rollout filtered this device (stage=%s, percent=%d)", stage, Integer.valueOf(rolloutPercent))
            return false
        }

        if (!isRuntimeCapable(context)) {
            Debug.Printf("VR metrics: OpenXR capability probe failed, fallback to cardboard", arrayOfNulls<Object>(0])
            return false
        }

        return true
    }

    @JvmStatic
    private fun isRuntimeCapable(context: Context): Boolean {
        if (!OpenXrRuntime.isBackendInstalled()) {
            Debug.Printf("VR metrics: native OpenXR session backend is not installed", arrayOfNulls<Object>(0])
            return false
        }

        PackageManager packageManager = context.getPackageManager()
        return packageManager.resolveContentProvider(OPENXR_RUNTIME_BROKER_AUTHORITY, 0) != null
                || packageManager.resolveContentProvider(OPENXR_SYSTEM_RUNTIME_BROKER_AUTHORITY, 0) != null
    }

    @JvmStatic
    private fun isEligibleForStage(context: Context, stage: String, rolloutPercent: Int, forceEnable: Boolean): Boolean {
        if (forceEnable || STAGE_GENERAL == (stage)) {
            return true
        }
        int effectiveRollout = rolloutPercent
        if (STAGE_DOGFOOD == (stage)) {
            effectiveRollout = Math.max(1, Math.min(effectiveRollout, 10))
        } else if (STAGE_BETA == (stage)) {
            effectiveRollout = Math.max(1, Math.min(effectiveRollout, 50))
        }
        return deviceBucket(context) < effectiveRollout
    }

    @JvmStatic
    private fun normalizePercent(rawPercent: Int): Int {
        internal fun if(0: rawPercent <):  {
            return 0
        }
        return Math.min(rawPercent, 100)
    }

    @JvmStatic
    private fun deviceBucket(context: Context): Int {
        String androidId = Settings.Secure.getString(context.getContentResolver(), Settings.Secure.ANDROID_ID)
        if (TextUtils.isEmpty(androidId)) {
            return 100
        }
        return Math.floorMod(androidId.hashCode(), 100)
    }
}
