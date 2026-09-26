package com.lumiyaviewer.lumiya.ui.settings

import android.content.Context
import androidx.preference.Preference
import android.util.AttributeSet

class ClearCachePreference @JvmOverloads constructor(
    context: Context,
    attrs: AttributeSet? = null,
    defStyleAttr: Int = androidx.preference.R.attr.preferenceStyle,
    defStyleRes: Int = 0
) : Preference(context, attrs, defStyleAttr, defStyleRes)
