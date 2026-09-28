package com.lumiyaviewer.lumiya.ui.settings

import android.content.Context
import android.content.SharedPreferences
import android.media.Ringtone
import android.media.RingtoneManager
import android.net.Uri
import com.google.common.base.Objects
import com.google.common.base.Strings
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.ui.media.NotificationSounds
import com.lumiyaviewer.lumiya.utils.LEDAction

open class NotificationSettings(private val type: NotificationType) {
    private var notificationEnabled = false
    private var soundEnabled = false
    private var ringtone: String? = ""
    private var blinkAction = LEDAction.None
    private var blinkColor = "red"

    private fun getPrefColor(str: String): Int {
        if (str.length != 6) {
            return 0
        }
        return try {
            (Integer.parseInt(str, 16) or -0x1000000)
        } catch (e: NumberFormatException) {
            e.printStackTrace()
            0
        }
    }

    private fun getPreferenceValueName(context: Context, str: String, i: Int, i2: Int): String {
        val stringArray = context.resources.getStringArray(i)
        val stringArray2 = context.resources.getStringArray(i2)
        for (j in stringArray.indices) {
            if (stringArray[j] == str) {
                return stringArray2[j]
            }
        }
        return ""
    }

    open fun Load(sharedPreferences: SharedPreferences) {
        this.notificationEnabled = sharedPreferences.getBoolean(this.type.getEnableKey(), true)
        this.soundEnabled = sharedPreferences.getBoolean(this.type.getPlaySoundKey(), true)
        val notificationSounds = NotificationSounds.defaultSounds[this.type]
        this.ringtone = sharedPreferences.getString(this.type.getRingtoneKey(), notificationSounds?.getUri()?.toString())
        this.blinkAction = LEDAction.getByPreferenceString(sharedPreferences.getString(this.type.getBlinkKey(), "none"))
        this.blinkColor = sharedPreferences.getString(this.type.getBlinkColorKey(), "FF0000") ?: "FF0000"
    }

    open fun getLEDAction(): LEDAction {
        return this.blinkAction
    }

    open fun getLEDColor(): Int {
        return getPrefColor(this.blinkColor)
    }

    open fun getRingtone(): String? {
        if (this.soundEnabled) {
            return this.ringtone
        }
        return null
    }

    internal fun getSummary(context: Context): String {
        val str: String
        if (this.ringtone != null) {
            val parse = Uri.parse(this.ringtone)
            val notificationSounds = NotificationSounds.defaultSounds[this.type]
            str = if (Objects.equal(notificationSounds?.getUri(), parse)) {
                "Default"
            } else if (this.ringtone!!.isEmpty()) {
                "Silent"
            } else {
                val ringtone: Ringtone? = RingtoneManager.getRingtone(context, parse)
                ringtone?.getTitle(context) ?: "No sound selected"
            }
        } else {
            str = "Default"
        }
        val preferenceValueName = getPreferenceValueName(context, this.blinkColor, R.array.pref_led_color_values, R.array.pref_led_color)
        if (!this.notificationEnabled) {
            return "Do nothing"
        }
        val str2 = if (this.soundEnabled) "Notify, play sound ($str)" else "Notify"
        if (LEDAction.None != this.blinkAction) {
            return str2 + ", blink " + (if (!Strings.isNullOrEmpty(preferenceValueName)) preferenceValueName.lowercase() + " " else "") + "LED"
        }
        return str2
    }

    open fun isEnabled(): Boolean {
        return this.notificationEnabled
    }
}
