package com.lumiyaviewer.lumiya.ui.render

object VrIntentContract {
    const val ALIAS_VR_ACTIVITY_CLASS = "com.lumiyaviewer.lumiya.ui.render.VrActivity"
    const val ACTION_LEGACY_CARDBOARD_ENTRY = "com.lumiyaviewer.lumiya.ui.render.CardboardActivity"
    const val ACTION_VR_ENTRY = "com.lumiyaviewer.lumiya.ui.render.VrActivity"
    const val EXTRA_VR_RUNTIME = "com.lumiyaviewer.lumiya.ui.render.extra.VR_RUNTIME"
    const val VR_RUNTIME_AUTO = "auto"
    const val VR_RUNTIME_CARDBOARD = "cardboard"
    const val VR_RUNTIME_OPENXR = "openxr"

    @JvmStatic
    fun sanitizeRuntime(value: String?): String =
        if (value == VR_RUNTIME_OPENXR || value == VR_RUNTIME_CARDBOARD) value else VR_RUNTIME_AUTO
}
