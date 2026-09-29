package com.lumiyaviewer.lumiya.ui.render.vr

import android.content.Context
import android.content.SharedPreferences
import android.content.pm.PackageManager
import android.provider.Settings
import android.text.TextUtils
import com.lumiyaviewer.lumiya.Debug

object OpenXrRuntimeCapabilities {
    private const val OPENXR_RUNTIME_BROKER_AUTHORITY = "org.khronos.openxr.runtime_broker"
    private const val OPENXR_SYSTEM_RUNTIME_BROKER_AUTHORITY = "org.khronos.openxr.system_runtime_broker"
    const val PREF_OPENXR_ENABLED = "pref_vr_openxr_enabled"
    const val PREF_OPENXR_STAGE = "pref_vr_openxr_stage"
    const val PREF_OPENXR_ROLLOUT_PERCENT = "pref_vr_openxr_rollout_percent"
    const val PREF_OPENXR_FORCE_ENABLE = "pref_vr_openxr_force_enable"
    const val STAGE_DISABLED = "disabled"
    const val STAGE_DOGFOOD = "dogfood"
    const val STAGE_BETA = "beta"
    const val STAGE_GENERAL = "general"

    @JvmStatic
    fun shouldUseOpenXr(context: Context, preferences: SharedPreferences): Boolean {
        if (!preferences.getBoolean(PREF_OPENXR_ENABLED, false)) {
            Debug.Printf("VR metrics: OpenXR disabled by feature flag")
            return false
        }

        val stage = preferences.getString(PREF_OPENXR_STAGE, STAGE_DISABLED) ?: STAGE_DISABLED
        val rolloutPercent = normalizePercent(preferences.getInt(PREF_OPENXR_ROLLOUT_PERCENT, 0))
        val forceEnable = preferences.getBoolean(PREF_OPENXR_FORCE_ENABLE, false)

        if (!forceEnable && STAGE_DISABLED == stage) {
            Debug.Printf("VR metrics: OpenXR stage is disabled, fallback to cardboard")
            return false
        }

        if (!isEligibleForStage(context, stage, rolloutPercent, forceEnable)) {
            Debug.Printf("VR metrics: OpenXR staged rollout filtered this device (stage=%s, percent=%d)", stage, rolloutPercent)
            return false
        }

        if (!isRuntimeCapable(context)) {
            Debug.Printf("VR metrics: OpenXR capability probe failed, fallback to cardboard")
            return false
        }

        return true
    }

    private fun isRuntimeCapable(context: Context): Boolean {
        if (!OpenXrRuntime.isBackendInstalled()) {
            Debug.Printf("VR metrics: native OpenXR session backend is not installed")
            return false
        }

        val packageManager: PackageManager = context.packageManager
        return packageManager.resolveContentProvider(OPENXR_RUNTIME_BROKER_AUTHORITY, 0) != null ||
            packageManager.resolveContentProvider(OPENXR_SYSTEM_RUNTIME_BROKER_AUTHORITY, 0) != null
    }

    private fun isEligibleForStage(context: Context, stage: String, rolloutPercent: Int, forceEnable: Boolean): Boolean {
        if (forceEnable || STAGE_GENERAL == stage) {
            return true
        }
        var effectiveRollout = rolloutPercent
        if (STAGE_DOGFOOD == stage) {
            effectiveRollout = Math.max(1, Math.min(effectiveRollout, 10))
        } else if (STAGE_BETA == stage) {
            effectiveRollout = Math.max(1, Math.min(effectiveRollout, 50))
        }
        return deviceBucket(context) < effectiveRollout
    }

    private fun normalizePercent(rawPercent: Int): Int {
        if (rawPercent < 0) {
            return 0
        }
        return Math.min(rawPercent, 100)
    }

    private fun deviceBucket(context: Context): Int {
        val androidId = Settings.Secure.getString(context.contentResolver, Settings.Secure.ANDROID_ID)
        if (TextUtils.isEmpty(androidId)) {
            return 100
        }
        return Math.floorMod(androidId.hashCode(), 100)
    }
}
