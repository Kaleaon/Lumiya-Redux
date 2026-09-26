package com.lumiyaviewer.lumiya.ui.settings

import android.content.Context
import android.media.RingtoneManager
import android.net.Uri
import android.util.AttributeSet
import androidx.preference.Preference
import com.google.common.base.Objects
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.ui.media.NotificationSounds

class RingtonePreference : Preference {
    private var defaultRawResource = 0

    constructor(context: Context) : super(context)

    constructor(context: Context, attrs: AttributeSet?) : super(context, attrs) {
        applyAttributes(context, attrs, 0, 0)
    }

    constructor(context: Context, attrs: AttributeSet?, defStyleAttr: Int) : super(context, attrs, defStyleAttr) {
        applyAttributes(context, attrs, defStyleAttr, 0)
    }

    constructor(context: Context, attrs: AttributeSet?, defStyleAttr: Int, defStyleRes: Int) :
        super(context, attrs, defStyleAttr, defStyleRes) {
        applyAttributes(context, attrs, defStyleAttr, defStyleRes)
    }

    private fun applyAttributes(context: Context, attrs: AttributeSet?, defStyleAttr: Int, defStyleRes: Int) {
        val typedArray = context.theme.obtainStyledAttributes(attrs, R.styleable.RingtonePreference, defStyleAttr, defStyleRes)
        try {
            defaultRawResource = typedArray.getResourceId(0, defaultRawResource)
        } finally {
            typedArray.recycle()
        }
    }

    fun getDefaultRawResource(): Int = defaultRawResource

    override fun getSummary(): CharSequence? {
        val value = sharedPreferences?.getString(key, null) ?: return "Default"
        val parsed = Uri.parse(value)
        if (Objects.equal(NotificationSounds.getResourceUri(defaultRawResource), parsed)) {
            return "Default"
        }
        if (value.isEmpty()) {
            return "Silent"
        }
        val ringtone = RingtoneManager.getRingtone(context, parsed)
        return ringtone?.getTitle(context) ?: "No sound selected"
    }
}
