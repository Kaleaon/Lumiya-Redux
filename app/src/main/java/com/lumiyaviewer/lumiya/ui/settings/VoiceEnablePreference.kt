package com.lumiyaviewer.lumiya.ui.settings

import android.content.Context
import android.util.AttributeSet
import androidx.preference.CheckBoxPreference

class VoiceEnablePreference @JvmOverloads constructor(
    context: Context,
    attrs: AttributeSet? = null,
    defStyleAttr: Int = androidx.preference.R.attr.checkBoxPreferenceStyle,
    defStyleRes: Int = 0
) : CheckBoxPreference(context, attrs, defStyleAttr, defStyleRes)
