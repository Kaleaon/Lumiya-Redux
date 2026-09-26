package com.lumiyaviewer.lumiya.ui.render.vr

import android.content.Context
import android.content.Intent
import androidx.preference.PreferenceManager
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.ui.render.VrIntentContract

object VrRuntimeSelector {
    const val EXTRA_RUNTIME_ID = "com.lumiyaviewer.lumiya.ui.render.vr.RUNTIME_ID"
    private const val PREF_VR_RUNTIME = "pref_vr_runtime"

    @JvmStatic
    fun selectRuntime(context: Context, intent: Intent?): VrRuntime {
        val preferences = PreferenceManager.getDefaultSharedPreferences(context)
        var requestedId = intent?.getStringExtra(EXTRA_RUNTIME_ID)
        if (requestedId == null && intent != null) {
            val requestedMode = VrIntentContract.sanitizeRuntime(intent.getStringExtra(VrIntentContract.EXTRA_VR_RUNTIME))
            if (VrIntentContract.VR_RUNTIME_OPENXR == requestedMode || VrIntentContract.VR_RUNTIME_CARDBOARD == requestedMode) {
                requestedId = requestedMode
            }
        }
        if (requestedId == null) {
            requestedId = preferences.getString(PREF_VR_RUNTIME, VrIntentContract.VR_RUNTIME_AUTO)
        }

        val openXrAllowed = OpenXrRuntimeCapabilities.shouldUseOpenXr(context, preferences)
        if ((OpenXrRuntime.ID.equals(requestedId, ignoreCase = true) ||
                VrIntentContract.VR_RUNTIME_AUTO.equals(requestedId, ignoreCase = true)) && openXrAllowed
        ) {
            Debug.Printf("VR metrics: selected runtime=%s", OpenXrRuntime.ID)
            return OpenXrRuntime()
        }

        if (OpenXrRuntime.ID.equals(requestedId, ignoreCase = true) && !openXrAllowed) {
            Debug.Printf("VR metrics: OpenXR requested but unavailable, falling back to cardboard.")
        }
        Debug.Printf("VR metrics: selected runtime=%s", CardboardRuntime.ID)
        return CardboardRuntime()
    }

    @JvmStatic
    fun putRuntime(intent: Intent, runtimeId: String) {
        intent.putExtra(EXTRA_RUNTIME_ID, runtimeId)
        intent.putExtra(
            VrIntentContract.EXTRA_VR_RUNTIME,
            if (OpenXrRuntime.ID.equals(runtimeId, ignoreCase = true)) {
                VrIntentContract.VR_RUNTIME_OPENXR
            } else {
                VrIntentContract.VR_RUNTIME_CARDBOARD
            }
        )
    }
}
