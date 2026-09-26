package com.lumiyaviewer.lumiya.ui.settings

import android.content.Context
import androidx.preference.Preference
import android.util.AttributeSet
import com.google.common.base.Strings
import com.lumiyaviewer.lumiya.R

class CacheLocationPreference @JvmOverloads constructor(
    context: Context,
    attrs: AttributeSet? = null,
    defStyleAttr: Int = androidx.preference.R.attr.preferenceStyle,
    defStyleRes: Int = 0
) : Preference(context, attrs, defStyleAttr, defStyleRes) {

    override fun getSummary(): CharSequence {
        val persistedString = getPersistedString(null)
        return if (Strings.isNullOrEmpty(persistedString)) {
            context.getString(R.string.default_cache_location)
        } else {
            makeDisplayableCacheLocation(persistedString)
        }
    }

    companion object {
        /**
         * Trims the Android-specific `/Android/...` and package-data suffix off
         * a persisted cache path, leaving only the user-facing root the cache
         * lives under. Pure string logic, independent of Android.
         */
        @JvmStatic
        fun makeDisplayableCacheLocation(path: String): String {
            var str = path
            val androidIndex = str.indexOf("/Android")
            if (androidIndex >= 0) {
                str = str.substring(0, androidIndex)
            }
            val packageIndex = str.indexOf("/com.lumiyaviewer.lumiya")
            return if (packageIndex >= 0) str.substring(0, packageIndex) else str
        }
    }
}
