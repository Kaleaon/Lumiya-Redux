package com.lumiyaviewer.lumiya.ui.render

import android.content.SharedPreferences

class RenderSettings(sharedPreferences: SharedPreferences) {
    @JvmField val avatarCountLimit: Int
    @JvmField val drawDistance: Int

    init {
        drawDistance = parseIntSetting(sharedPreferences.getString("drawDistance", "20"), 20)
        avatarCountLimit = parseIntSetting(sharedPreferences.getString("avatarCountLimit", "5"), 5)
    }

    companion object {
        /**
         * Parses a preference string into an int, falling back to [default] when
         * the value is missing or not a valid integer. Pure parsing logic,
         * independent of Android's SharedPreferences storage.
         */
        @JvmStatic
        fun parseIntSetting(value: String?, default: Int): Int = value?.toIntOrNull() ?: default
    }
}
