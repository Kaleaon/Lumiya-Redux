package com.lumiyaviewer.lumiya.ui.settings

import android.content.Context
import androidx.preference.EditTextPreference
import android.text.TextUtils
import android.util.AttributeSet

class FriendlyEditTextPreference @JvmOverloads constructor(
    context: Context,
    attrs: AttributeSet? = null,
    defStyleAttr: Int = androidx.preference.R.attr.editTextPreferenceStyle
) : EditTextPreference(context, attrs, defStyleAttr) {

    override fun getSummary(): CharSequence? {
        val text = text
        if (TextUtils.isEmpty(text)) {
            return null
        }
        val summary = super.getSummary() ?: return null
        return formatSummary(summary.toString(), text)
    }

    companion object {
        /**
         * Pure formatting rule: substitutes the preference's current text into
         * its summary template, matching `String.format(summary, text)`.
         */
        @JvmStatic
        fun formatSummary(summaryTemplate: String, text: String?): String =
            String.format(summaryTemplate, text)
    }
}
